from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import logging
import gzip
import traceback
import os
import datetime
import argparse
import base64

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

# Create log directory
LOG_DIR = "/opt/http_logs"
os.makedirs(LOG_DIR, exist_ok=True)

# Global creds (will be set from CLI args)
USERNAME = None
PASSWORD = None
AUTH_REQUIRED = False


class LogHandler(BaseHTTPRequestHandler):
    def _check_auth(self):
        """Check Basic Auth if enabled"""
        if not AUTH_REQUIRED:
            return True

        auth_header = self.headers.get("Authorization")
        if not auth_header or not auth_header.startswith("Basic "):
            return False

        encoded_credentials = auth_header.split(" ")[1]
        decoded_credentials = base64.b64decode(encoded_credentials).decode("utf-8")
        user, pwd = decoded_credentials.split(":", 1)

        return user == USERNAME and pwd == PASSWORD

    def do_AUTHHEAD(self):
        """Send 401 with WWW-Authenticate header"""
        self.send_response(401)
        self.send_header("WWW-Authenticate", 'Basic realm="Log Server"')
        self.send_header("Content-type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps({"error": "Authentication required"}).encode("utf-8"))

    def do_POST(self):
        try:
            # If creds required, enforce authentication
            if AUTH_REQUIRED and not self._check_auth():
                self.do_AUTHHEAD()
                return

            content_length = int(self.headers.get('Content-Length', 0))
            if content_length == 0:
                self.send_error(400, "No content")
                return

            post_data = self.rfile.read(content_length)

            # Log request details
            content_encoding = self.headers.get('Content-Encoding', '')
            content_type = self.headers.get('Content-Type', '')
            client_ip = self.client_address[0]
            logging.info(f"Request from {client_ip} - Content-Type: {content_type}, Content-Encoding: {content_encoding}")

            # Generate unique filename with timestamp
            now = datetime.datetime.now()
            timestamp = now.strftime("%Y-%m-%d_%H-%M-%S-%f")[:-3]

            # Check if data is compressed
            if content_encoding.lower() == 'gzip' or (len(post_data) >= 2 and post_data[0] == 0x1f and post_data[1] == 0x8b):
                filename = f"{timestamp}_{client_ip}.log.gz"
                filepath = os.path.join(LOG_DIR, filename)
                with open(filepath, 'wb') as f:
                    f.write(post_data)
                logging.info(f"Saved compressed log to {filepath} ({len(post_data)} bytes)")
                try:
                    data_str = gzip.decompress(post_data).decode('utf-8')
                    logging.info("Successfully decompressed gzip data for processing")
                except Exception as e:
                    logging.error(f"Error decompressing data: {e}")
                    data_str = None
            else:
                filename = f"{timestamp}_{client_ip}.log"
                filepath = os.path.join(LOG_DIR, filename)
                with open(filepath, 'wb') as f:
                    f.write(post_data)
                logging.info(f"Saved uncompressed log to {filepath} ({len(post_data)} bytes)")
                for encoding in ['utf-8', 'latin1', 'ascii']:
                    try:
                        data_str = post_data.decode(encoding)
                        break
                    except UnicodeDecodeError:
                        continue
                else:
                    logging.error(f"Could not decode data with any encoding. First 20 bytes: {post_data[:20]}")
                    data_str = None

            # Try to parse JSON
            if data_str:
                try:
                    log_data = json.loads(data_str)
                    if isinstance(log_data, list):
                        logging.info(f"Processed batch of {len(log_data)} log entries")
                        if len(log_data) > 0:
                            logging.info(f"Sample log entry: {json.dumps(log_data[0], indent=2)}")
                    else:
                        logging.info(f"Processed single log entry: {json.dumps(log_data, indent=2)}")
                except json.JSONDecodeError:
                    logging.info(f"Non-JSON data received (first 200 chars): {data_str[:200]}...")

        except Exception as e:
            logging.error(f"Error processing request: {e}")
            logging.error(traceback.format_exc())
            self.send_error(500, "Internal server error")
            return

        # Send success response
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        response = {
            "status": "success",
            "message": "Log received and saved",
            "filename": filename,
            "saved_to": filepath
        }
        self.wfile.write(json.dumps(response).encode('utf-8'))

    def log_message(self, format, *args):
        pass  # suppress default logging

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Enhanced HTTP Log Server with optional auth")
    parser.add_argument("--no-creds", action="store_true", help="Run without authentication")
    parser.add_argument("-creds", nargs=2, metavar=("USERNAME", "PASSWORD"), help="Enable authentication with username and password")
    args = parser.parse_args()

    if args.creds:
        USERNAME, PASSWORD = args.creds
        AUTH_REQUIRED = True
        print(f"Authentication enabled. Username: {USERNAME}")
    else:
        AUTH_REQUIRED = False
        print("Running without authentication")



    # Test log dir
    try:
        test_file = os.path.join(LOG_DIR, "test_write.tmp")
        with open(test_file, 'w') as f:
            f.write("test")
        os.remove(test_file)
    except Exception as e:
        print(f"Error: Cannot write to {LOG_DIR}: {e}")
        exit(1)

    server = HTTPServer(('0.0.0.0', 8080), LogHandler)
    print("Enhanced HTTP log server running on port 8080...")
    print(f"Logs will be saved to: {LOG_DIR}")
    if AUTH_REQUIRED:
        print("Authentication is required to POST logs")
    else:
        print("No authentication required")
    server.serve_forever()
