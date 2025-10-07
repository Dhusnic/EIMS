#!/usr/bin/env python3
import os
import argparse
import logging
import json
from elasticsearch import Elasticsearch, exceptions as es_exceptions

# ------------------- Logging Setup -------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler()]
)

# ------------------- Pipeline Exporter -------------------
def fetch_pipelines(es_client):
    """Fetch all ingest pipelines from Elasticsearch"""
    try:
        return es_client.ingest.get_pipeline()
    except es_exceptions.ConnectionError as e:
        logging.error(f"Connection error: {e}")
        raise
    except es_exceptions.AuthenticationException as e:
        logging.error("Authentication failed. Check username/password.")
        raise
    except Exception as e:
        logging.error(f"Error fetching pipelines: {e}")
        raise

def sanitize_filename(pipeline_name: str) -> str:
    """
    Convert pipeline name like:
      filebeat-8.14.0-apache-access-pipeline
    into a clean filename like:
      apache_access.json
    """
    try:
        parts = pipeline_name.split("-")
        # Remove filebeat + version, keep rest
        core = "-".join(parts[2:]).replace("-pipeline", "")
        return core.replace("-", "_") + ".json"
    except Exception:
        return pipeline_name.replace("-", "_") + ".json"

def save_pipelines(pipelines: dict, output_dir: str):
    """Save each pipeline definition into JSON file"""
    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        logging.info(f"Created directory: {output_dir}")

    for pipeline_name, definition in pipelines.items():
        filename = sanitize_filename(pipeline_name)
        file_path = os.path.join(output_dir, filename)

        try:
            with open(file_path, "w", encoding="utf-8") as f:
                json.dump(definition, f, indent=2)
            logging.info(f"Saved pipeline '{pipeline_name}' -> {file_path}")
        except Exception as e:
            logging.error(f"Failed to save {pipeline_name}: {e}")

# ------------------- Main CLI -------------------
def main():
    parser = argparse.ArgumentParser(description="Export Elasticsearch ingest pipelines to JSON files")
    parser.add_argument("--es-url", default="http://localhost:9200", help="Elasticsearch URL (default: http://localhost:9200)")
    parser.add_argument("--user", default=None, help="Elasticsearch username")
    parser.add_argument("--password", default=None, help="Elasticsearch password")
    parser.add_argument("--output-dir", default="/opt/ingest_pipeline_script", help="Output directory for pipeline JSON files")

    args = parser.parse_args()

    try:
        es = Elasticsearch(
            [args.es_url],
            basic_auth=(args.user, args.password) if args.user and args.password else None
        )
        logging.info(f"Connecting to Elasticsearch at {args.es_url}")
        pipelines = fetch_pipelines(es)
        save_pipelines(pipelines, args.output_dir)
        logging.info("Pipeline export completed successfully.")
    except Exception as e:
        logging.error(f"Script failed: {e}")

if __name__ == "__main__":
    main()

