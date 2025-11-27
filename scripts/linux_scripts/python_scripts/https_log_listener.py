from http.server import HTTPServer, BaseHTTPRequestHandler
import ssl
import json
import logging
import gzip
import traceback
import os
import datetime
import base64

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

LOG_DIR = "/opt/https_logs"
os.makedirs(LOG_DIR, exist_ok=True)

# Authentication credentials
VALID_USERNAME = "Dhusnic"
VALID_PASSWORD = "Dhusnic"
VALID_API_KEY = "Dhusnic"

class HTTPSLogHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        try:
            # Check API Key first
            api_key = self.headers.get('X-API-Key', '')
            if api_key != VALID_API_KEY:
                logging.warning(f"Invalid API key from {self.client_address[0]}: {api_key}")
                self.send_error(401, "Invalid API Key")
                return
            
            # Check Basic Authentication
            auth_header = self.headers.get('Authorization', '')
            if auth_header.startswith('Basic '):
                try:
                    credentials = base64.b64decode(auth_header[6:]).decode('utf-8')
                    username, password = credentials.split(':', 1)
                    if username != VALID_USERNAME or password != VALID_PASSWORD:
                        logging.warning(f"Invalid credentials from {self.client_address[0]}: {username}")
                        self.send_error(401, "Unauthorized - Invalid credentials")
                        return
                except Exception as e:
                    logging.error(f"Authentication parsing error: {e}")
                    self.send_error(401, "Invalid authentication format")
                    return
            else:
                self.send_error(401, "Authentication required")
                return
            
            # Process the log data
            content_length = int(self.headers.get('Content-Length', 0))
            if content_length == 0:
                self.send_error(400, "No content")
                return
                
            post_data = self.rfile.read(content_length)
            
            # Log request details
            content_encoding = self.headers.get('Content-Encoding', '')
            content_type = self.headers.get('Content-Type', '')
            client_ip = self.client_address[0]
            
            logging.info(f"Authenticated HTTPS request from {client_ip}")
            logging.info(f"Content-Type: {content_type}, Content-Encoding: {content_encoding}")
            logging.info(f"Content-Length: {content_length} bytes")
            
            # Generate unique filename with timestamp
            now = datetime.datetime.now()
            timestamp = now.strftime("%Y-%m-%d_%H-%M-%S-%f")[:-3]
            
            # Handle compressed/uncompressed data
            if content_encoding.lower() == 'gzip' or (len(post_data) >= 2 and post_data[0] == 0x1f and post_data[1] == 0x8b):
                # Save compressed data
                filename = f"https_{timestamp}_{client_ip}.log.gz"
                filepath = os.path.join(LOG_DIR, filename)
                
                with open(filepath, 'wb') as f:
                    f.write(post_data)
                
                logging.info(f"Saved compressed HTTPS log to {filepath} ({len(post_data)} bytes)")
                
                # Decompress for processing
                try:
                    data_str = gzip.decompress(post_data).decode('utf-8')
                    logging.info("Successfully decompressed gzip data")
                except Exception as e:
                    logging.error(f"Error decompressing data: {e}")
                    data_str = None
                    
            else:
                # Save uncompressed data
                filename = f"https_{timestamp}_{client_ip}.log"
                filepath = os.path.join(LOG_DIR, filename)
                
                with open(filepath, 'wb') as f:
                    f.write(post_data)
                
                logging.info(f"Saved uncompressed HTTPS log to {filepath} ({len(post_data)} bytes)")
                
                # Decode data
                for encoding in ['utf-8', 'latin1', 'ascii']:
                    try:
                        data_str = post_data.decode(encoding)
                        break
                    except UnicodeDecodeError:
                        continue
                else:
                    logging.error(f"Could not decode data with any encoding")
                    data_str = None
            
            # Parse and log JSON content
            if data_str:
                try:
                    log_data = json.loads(data_str)
                    if isinstance(log_data, list):
                        logging.info(f"Processed batch of {len(log_data)} log entries via HTTPS")
                        # Log sample entry
                        if len(log_data) > 0:
                            sample_log = log_data[0]
                            logging.info(f"Sample log entry: {json.dumps(sample_log, indent=2)}")
                    else:
                        logging.info(f"Processed single log entry via HTTPS: {json.dumps(log_data, indent=2)}")
                except json.JSONDecodeError:
                    logging.info(f"Non-JSON data received via HTTPS (first 200 chars): {data_str[:200]}...")
            
        except Exception as e:
            logging.error(f"Error processing HTTPS request: {e}")
            logging.error(traceback.format_exc())
            self.send_error(500, "Internal server error")
            return
        
        # Send success response
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Server', 'Python-HTTPS-Log-Server')
        self.end_headers()
        
        response = {
            "status": "success", 
            "message": "HTTPS log received and saved",
            "filename": filename,
            "saved_to": filepath,
            "timestamp": datetime.datetime.now().isoformat(),
            "client_ip": client_ip
        }
        self.wfile.write(json.dumps(response, indent=2).encode('utf-8'))
    
    def log_message(self, format, *args):
        # Suppress default HTTP server logging
        pass

def create_self_signed_cert():
    """Create a self-signed certificate for testing"""
    try:
        from cryptography import x509
        from cryptography.x509.oid import NameOID
        from cryptography.hazmat.primitives import hashes
        from cryptography.hazmat.primitives.asymmetric import rsa
        from cryptography.hazmat.primitives import serialization
        import datetime
        
        # Generate private key
        private_key = rsa.generate_private_key(
            public_exponent=65537,
            key_size=2048,
        )
        
        # Create certificate
        subject = issuer = x509.Name([
            x509.NameAttribute(NameOID.COUNTRY_NAME, "US"),
            x509.NameAttribute(NameOID.STATE_OR_PROVINCE_NAME, "Test"),
            x509.NameAttribute(NameOID.LOCALITY_NAME, "Test"),
            x509.NameAttribute(NameOID.ORGANIZATION_NAME, "Test Org"),
            x509.NameAttribute(NameOID.COMMON_NAME, "localhost"),
        ])
        
        cert = x509.CertificateBuilder().subject_name(
            subject
        ).issuer_name(
            issuer
        ).public_key(
            private_key.public_key()
        ).serial_number(
            x509.random_serial_number()
        ).not_valid_before(
            datetime.datetime.utcnow()
        ).not_valid_after(
            datetime.datetime.utcnow() + datetime.timedelta(days=365)
        ).sign(private_key, hashes.SHA256())
        
        # Write certificate and key to files
        cert_path = "/opt/server.crt"
        key_path = "/opt/server.key"
        
        with open(cert_path, "wb") as f:
            f.write(cert.public_bytes(serialization.Encoding.PEM))
        
        with open(key_path, "wb") as f:
            f.write(private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption()
            ))
        
        return cert_path, key_path
        
    except ImportError:
        print("cryptography library not available. Using OpenSSL command...")
        os.system('openssl req -x509 -newkey rsa:2048 -keyout /opt/server.key -out /opt/server.crt -days 365 -nodes -subj "/C=US/ST=Test/L=Test/O=Test/CN=localhost"')
        return "/opt/server.crt", "/opt/server.key"

if __name__ == '__main__':
    # Ensure log directory exists
    try:
        test_file = os.path.join(LOG_DIR, "test_write.tmp")
        with open(test_file, 'w') as f:
            f.write("test")
        os.remove(test_file)
        print(f"HTTPS log directory {LOG_DIR} is ready and writable")
    except Exception as e:
        print(f"Error: Cannot write to {LOG_DIR}: {e}")
        exit(1)
    
    # Create or use existing SSL certificate
    cert_file = "/opt/server.crt"
    key_file = "/opt/server.key"
    
    if not os.path.exists(cert_file) or not os.path.exists(key_file):
        print("Creating self-signed certificate for testing...")
        cert_file, key_file = create_self_signed_cert()
        print(f"Created certificate: {cert_file}")
        print(f"Created private key: {key_file}")
    
    # Create HTTPS server
    server = HTTPServer(('0.0.0.0', 443), HTTPSLogHandler)
    
    # Wrap with SSL
    context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
    context.load_cert_chain(cert_file, key_file)
    server.socket = context.wrap_socket(server.socket, server_side=True)
    
    print("Enhanced HTTPS log server running on port 443...")
    print(f"Logs will be saved to: {LOG_DIR}")
    print("Authentication: Username='Dhusnic', API-Key='Dhusnic'")
    print("Ready to receive both compressed and uncompressed data via HTTPS...")
    print("Note: Using self-signed certificate - set verify_ssl=false in Logstash for testing")
    
    try:
        server.serve_forever()
    except PermissionError:
        print("Error: Permission denied. Port 443 requires root privileges.")
        print("Try running with: sudo python3 https_server.py")
    except KeyboardInterrupt:
        print("\nShutting down HTTPS server...")
        server.shutdown()

