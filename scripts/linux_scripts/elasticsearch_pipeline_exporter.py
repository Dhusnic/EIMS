#!/usr/bin/env python3
"""
Elasticsearch Ingest Pipeline Exporter

This script connects to an Elasticsearch cluster, fetches all ingest pipelines,
and saves them as individual JSON files with proper naming conventions.

Author: Elasticsearch Pipeline Export Tool
Version: 1.0.0
"""

import argparse
import json
import logging
import os
import re
import sys
from pathlib import Path
from typing import Dict, Any, Optional

try:
    from elasticsearch import Elasticsearch
    from elasticsearch.exceptions import ConnectionError, AuthenticationException, NotFoundError
except ImportError:
    print("ERROR: elasticsearch package not found. Install it with: pip install elasticsearch")
    sys.exit(1)


class ElasticsearchPipelineExporter:
    """Main class for handling Elasticsearch pipeline export operations."""

    def __init__(self, es_url: str, username: str = None, password: str = None, 
                 output_dir: str = "/opt/ingest_pipeline_script"):
        """
        Initialize the pipeline exporter.

        Args:
            es_url: Elasticsearch cluster URL
            username: Username for basic authentication
            password: Password for basic authentication
            output_dir: Directory to save pipeline JSON files
        """
        self.es_url = es_url
        self.username = username
        self.password = password
        self.output_dir = Path(output_dir)
        self.logger = self._setup_logging()
        self.es_client = None

    def _setup_logging(self) -> logging.Logger:
        """Set up logging configuration."""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
            handlers=[
                logging.StreamHandler(sys.stdout),
                logging.FileHandler('pipeline_exporter.log')
            ]
        )
        return logging.getLogger(__name__)

    def _create_elasticsearch_client(self) -> Elasticsearch:
        """
        Create and configure Elasticsearch client with authentication and error handling.

        Returns:
            Configured Elasticsearch client

        Raises:
            ConnectionError: If unable to connect to Elasticsearch
            AuthenticationException: If authentication fails
        """
        try:
            # Configure client parameters
            client_params = {
                'hosts': [self.es_url],
                'timeout': 30,
                'max_retries': 3,
                'retry_on_timeout': True
            }

            # Add authentication if provided
            if self.username and self.password:
                client_params['basic_auth'] = (self.username, self.password)
                self.logger.info(f"Using basic authentication for user: {self.username}")

            # Create client
            es_client = Elasticsearch(**client_params)

            # Test connection
            if not es_client.ping():
                raise ConnectionError("Failed to ping Elasticsearch cluster")

            # Get cluster info
            cluster_info = es_client.info()
            self.logger.info(f"Connected to Elasticsearch cluster: {cluster_info['name']} "
                           f"(version: {cluster_info['version']['number']})")

            return es_client

        except AuthenticationException as e:
            self.logger.error(f"Authentication failed: {e}")
            raise
        except ConnectionError as e:
            self.logger.error(f"Failed to connect to Elasticsearch at {self.es_url}: {e}")
            raise
        except Exception as e:
            self.logger.error(f"Unexpected error creating Elasticsearch client: {e}")
            raise

    def _sanitize_filename(self, pipeline_name: str) -> str:
        """
        Convert pipeline name to sanitized filename following the mapping pattern.

        Args:
            pipeline_name: Original pipeline name from Elasticsearch

        Returns:
            Sanitized filename without extension
        """
        # Remove common prefixes and suffixes
        name = pipeline_name

        # Handle filebeat pattern: filebeat-X.X.X-name-pipeline
        filebeat_pattern = r'^filebeat-\d+\.\d+\.\d+-(.*?)-pipeline$'
        match = re.match(filebeat_pattern, name)
        if match:
            name = match.group(1)
        else:
            # Remove common suffixes
            if name.endswith('-pipeline'):
                name = name[:-9]  # Remove '-pipeline'
            elif name.endswith('_pipeline'):
                name = name[:-9]  # Remove '_pipeline'

        # Replace hyphens with underscores and sanitize
        sanitized = re.sub(r'[^a-zA-Z0-9_-]', '_', name)
        sanitized = re.sub(r'-', '_', sanitized)
        sanitized = re.sub(r'_{2,}', '_', sanitized)  # Replace multiple underscores
        sanitized = sanitized.strip('_')  # Remove leading/trailing underscores

        return sanitized

    def _create_output_directory(self) -> None:
        """Create output directory if it doesn't exist."""
        try:
            self.output_dir.mkdir(parents=True, exist_ok=True)
            self.logger.info(f"Output directory created/verified: {self.output_dir}")
        except Exception as e:
            self.logger.error(f"Failed to create output directory {self.output_dir}: {e}")
            raise

    def fetch_pipelines(self) -> Dict[str, Any]:
        """
        Fetch all ingest pipelines from Elasticsearch.

        Returns:
            Dictionary containing all pipeline definitions

        Raises:
            Exception: If unable to fetch pipelines
        """
        try:
            self.logger.info("Fetching all ingest pipelines from Elasticsearch...")

            # Use the _ingest/pipeline API to get all pipelines
            response = self.es_client.ingest.get_pipeline(id='*')

            if not response:
                self.logger.warning("No pipelines found in Elasticsearch cluster")
                return {}

            pipeline_count = len(response)
            self.logger.info(f"Successfully fetched {pipeline_count} pipeline(s)")

            # Log pipeline names for debugging
            for pipeline_name in response.keys():
                self.logger.debug(f"Found pipeline: {pipeline_name}")

            return response

        except NotFoundError:
            self.logger.warning("No pipelines found (_ingest/pipeline returned 404)")
            return {}
        except Exception as e:
            self.logger.error(f"Failed to fetch pipelines: {e}")
            raise

    def save_pipeline_to_file(self, pipeline_name: str, pipeline_definition: Dict[str, Any]) -> None:
        """
        Save a single pipeline definition to a JSON file.

        Args:
            pipeline_name: Name of the pipeline
            pipeline_definition: Pipeline definition dictionary
        """
        try:
            # Generate sanitized filename
            sanitized_name = self._sanitize_filename(pipeline_name)
            filename = f"{sanitized_name}.json"
            filepath = self.output_dir / filename

            # Ensure the pipeline definition is properly formatted for re-upload
            # The API returns the pipeline definition directly, so we can save it as-is
            output_data = pipeline_definition

            # Write to file with proper formatting
            with open(filepath, 'w', encoding='utf-8') as f:
                json.dump(output_data, f, indent=2, ensure_ascii=False)

            self.logger.info(f"Pipeline saved: [{filename}] = \"{pipeline_name}\"")

        except Exception as e:
            self.logger.error(f"Failed to save pipeline {pipeline_name} to file: {e}")
            raise

    def save_all_pipelines(self, pipelines: Dict[str, Any]) -> None:
        """
        Save all pipeline definitions to individual JSON files.

        Args:
            pipelines: Dictionary of all pipeline definitions
        """
        if not pipelines:
            self.logger.info("No pipelines to save")
            return

        self.logger.info(f"Saving {len(pipelines)} pipeline(s) to {self.output_dir}")

        saved_count = 0
        failed_count = 0

        for pipeline_name, pipeline_definition in pipelines.items():
            try:
                self.save_pipeline_to_file(pipeline_name, pipeline_definition)
                saved_count += 1
            except Exception as e:
                self.logger.error(f"Failed to save pipeline {pipeline_name}: {e}")
                failed_count += 1

        self.logger.info(f"Pipeline export completed: {saved_count} saved, {failed_count} failed")

    def export_pipelines(self) -> bool:
        """
        Main method to export all pipelines.

        Returns:
            True if export was successful, False otherwise
        """
        try:
            # Create Elasticsearch client
            self.es_client = self._create_elasticsearch_client()

            # Create output directory
            self._create_output_directory()

            # Fetch all pipelines
            pipelines = self.fetch_pipelines()

            # Save pipelines to files
            self.save_all_pipelines(pipelines)

            self.logger.info("Pipeline export completed successfully")
            return True

        except Exception as e:
            self.logger.error(f"Pipeline export failed: {e}")
            return False


def create_argument_parser() -> argparse.ArgumentParser:
    """Create and configure command line argument parser."""
    parser = argparse.ArgumentParser(
        description='Export Elasticsearch ingest pipelines to individual JSON files',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s --user elastic --password mypassword
  %(prog)s --es-url http://localhost:9200 --output-dir /tmp/pipelines
  %(prog)s --es-url https://elastic.example.com:9200 --user admin --password secret --output-dir ./pipelines

The exported JSON files can be re-uploaded using:
  curl -X PUT "localhost:9200/_ingest/pipeline/pipeline-name" -H "Content-Type: application/json" -d @filename.json
        """
    )

    parser.add_argument(
        '--es-url',
        default='http://localhost:9200',
        help='Elasticsearch cluster URL (default: %(default)s)'
    )

    parser.add_argument(
        '--user',
        help='Username for basic authentication'
    )

    parser.add_argument(
        '--password',
        help='Password for basic authentication'
    )

    parser.add_argument(
        '--output-dir',
        default='/opt/ingest_pipeline_script',
        help='Output directory for pipeline JSON files (default: %(default)s)'
    )

    parser.add_argument(
        '--log-level',
        choices=['DEBUG', 'INFO', 'WARNING', 'ERROR'],
        default='INFO',
        help='Set logging level (default: %(default)s)'
    )

    parser.add_argument(
        '--version',
        action='version',
        version='%(prog)s 1.0.0'
    )

    return parser


def validate_arguments(args) -> None:
    """
    Validate command line arguments.

    Args:
        args: Parsed arguments namespace

    Raises:
        ValueError: If arguments are invalid
    """
    # Check if both username and password are provided for authentication
    if (args.user and not args.password) or (args.password and not args.user):
        raise ValueError("Both --user and --password must be provided for authentication")

    # Validate URL format
    if not args.es_url.startswith(('http://', 'https://')):
        raise ValueError("Elasticsearch URL must start with http:// or https://")


def main() -> int:
    """
    Main entry point for the script.

    Returns:
        Exit code (0 for success, 1 for failure)
    """
    try:
        # Parse command line arguments
        parser = create_argument_parser()
        args = parser.parse_args()

        # Validate arguments
        validate_arguments(args)

        # Set logging level
        logging.getLogger().setLevel(getattr(logging, args.log_level))

        # Create exporter instance
        exporter = ElasticsearchPipelineExporter(
            es_url=args.es_url,
            username=args.user,
            password=args.password,
            output_dir=args.output_dir
        )

        # Export pipelines
        success = exporter.export_pipelines()

        return 0 if success else 1

    except KeyboardInterrupt:
        print("\nOperation cancelled by user")
        return 1
    except Exception as e:
        print(f"ERROR: {e}")
        return 1


if __name__ == '__main__':
    sys.exit(main())

