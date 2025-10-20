import logging
import threading
import time
import random
import socket
import json

# Configuration
LOGSTASH_HOST = "10.0.5.97"  # Change to Logstash server IP
LOGSTASH_PORT = 6002  # Logstash listening port (UDP or TCP)
LOGS_PER_SECOND = 10
THREADS = 4  # Multi-threading for better performance
LOGS_PER_THREAD = LOGS_PER_SECOND // THREADS

# Set up UDP socket for sending logs to Logstash
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # Use SOCK_STREAM for TCP

# Log levels
LOG_LEVELS = ["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"]

# Application Messages
APP_MESSAGES = [
    "User logged in",
    "File uploaded successfully",
    "Database connection lost",
    "High memory usage detected",
    "Invalid password attempt",
    "Network latency spike",
    "System reboot initiated"
]

# Windows Event Logs (Sample)
WINDOWS_EVENTS = [
    {
        "event_id": 4624,
        "message": (
            "An account was successfully logged on.\n"
            "====================================================\n"
            "Logon Type: 2 (Interactive Logon) - User logged in at the console or via RDP.\n"
            "User: johndoe\n"
            "Security ID: S-1-5-21-52448577-171664333-1208921634-1001\n"
            "Account Domain: COMPANY_DOMAIN\n"
            "Workstation Name: WORKSTATION-12\n"
            "Source Network Address: 192.168.1.50\n"
            "Source Port: 54032\n"
            "Authentication Package: NTLM\n"
            "Logon GUID: {e1c7f5d4-47db-43e5-b20b-97d4a44e93b6}\n"
            "Transmitted Services: -\n"
            "Key Length: 128-bit AES Encryption\n"
            "Elevated Token: No\n"
            "Additional Security Details: The user authenticated using cached credentials.\n"
            "Device Information: Dell Latitude 5420, Windows 10 Pro, Build 19045\n"
            "Previous Logon Time: 2025-02-26T23:59:01Z\n"
            "Account Lockout Status: Not Locked\n"
            "Failed Login Attempts Before Success: 0\n"
            "System Integrity Check: No anomalies detected.\n"
            "====================================================\n"
            "Notes: This logon event was captured successfully and indicates a successful interactive session."
        )
    },
    {
        "event_id": 4625,
        "message": (
            "An account failed to log on.\n"
            "====================================================\n"
            "Logon Type: 3 (Network Logon) - This event indicates an attempt to access a network resource.\n"
            "User: admin\n"
            "Security ID: S-1-5-21-1478007337-2138945671-891743245-500\n"
            "Account Domain: COMPANY_DOMAIN\n"
            "Workstation Name: SERVER-01\n"
            "Source Network Address: 10.0.4.5\n"
            "Source Port: 49321\n"
            "Failure Reason: Unknown user name or bad password.\n"
            "Logon Process: NtLmSsp\n"
            "Authentication Package: NTLM\n"
            "Logon GUID: {c873a84c-117d-44b5-b7c5-d02a423ef104}\n"
            "Password Last Set: 2024-12-12T14:10:09Z\n"
            "Account Lockout Threshold: 5\n"
            "Failed Login Attempts: 4\n"
            "Account Status: Locked due to excessive failed logins.\n"
            "Risk Level: High - Multiple failed login attempts detected.\n"
            "Additional Security Details: This event was generated due to repeated authentication failures.\n"
            "====================================================\n"
            "Notes: If this login attempt was unexpected, an investigation into possible brute-force attacks is recommended."
        )
    },
    {
        "event_id": 4720,
        "message": (
            "A new user account was created.\n"
            "====================================================\n"
            "Account Name: temp_user\n"
            "Security ID: S-1-5-21-3623811015-3361044348-30300820-1010\n"
            "Account Domain: COMPANY_DOMAIN\n"
            "Created by User: administrator\n"
            "Administrator Security ID: S-1-5-21-3623811015-3361044348-30300820-500\n"
            "Caller Process ID: 0x3e7\n"
            "System Time: 2025-02-27T14:32:51Z\n"
            "Privileges Assigned: SeInteractiveLogonRight, SeNetworkLogonRight, SeChangeNotifyPrivilege\n"
            "Remote Account Creation Request: Yes\n"
            "Account Expiration: 2025-06-01T00:00:00Z\n"
            "Password Complexity Requirements: Met\n"
            "Password Expiry Date: 2025-04-30T00:00:00Z\n"
            "MFA Enabled: No\n"
            "Access Groups: Domain Users, Remote Desktop Users\n"
            "====================================================\n"
            "Notes: This account creation event was logged. Ensure it aligns with organizational policy."
        )
    },
    {
        "event_id": 4738,
        "message": (
            "A user account was modified.\n"
            "====================================================\n"
            "Target Account: service_account\n"
            "Security ID: S-1-5-21-3623811015-3361044348-30300820-1022\n"
            "Modified by User: sysadmin\n"
            "Modification Type: Password Reset, Privileges Updated\n"
            "Previous Privileges: SeBatchLogonRight\n"
            "New Privileges: SeBatchLogonRight, SeInteractiveLogonRight\n"
            "Remote Change Request: Yes\n"
            "Request Origin: 192.168.2.50\n"
            "Password Change Required: No\n"
            "Last Password Change: 2024-11-22T10:12:00Z\n"
            "Security Policy Compliance Check: Passed\n"
            "Access Log Summary: No unauthorized access detected in the past 30 days.\n"
            "====================================================\n"
            "Notes: A modification to a critical service account was performed. Ensure it was authorized."
        )
    },
    {
        "event_id": 1102,
        "message": (
            "The audit log was cleared.\n"
            "====================================================\n"
            "Cleared by User: administrator\n"
            "Security ID: S-1-5-18\n"
            "System Time: 2025-02-27T17:45:05Z\n"
            "Caller Process ID: 0x3e7\n"
            "Action performed using elevated privileges.\n"
            "Workstation Name: SECURE-SERVER-01\n"
            "Remote IP: 203.0.113.15\n"
            "Event Log Type: Security\n"
            "Event Log Size Before Clearing: 512MB\n"
            "Event Log Retention Policy: Overwrite Events as Needed\n"
            "Risk Level: Critical - Log clearance may indicate tampering.\n"
            "====================================================\n"
            "Notes: The security audit log was cleared. If this action was unauthorized, investigate immediately."
        )
    }
]

# Network Log Samples
NETWORK_PROTOCOLS = ["TCP", "UDP", "ICMP"]
IP_ADDRESSES = ["192.168.1.100", "192.168.1.101", "10.0.4.5", "172.16.0.22", "8.8.8.8", "192.168.1.50"]
PORTS = [22, 53, 80, 443, 3389, 8080, 3306]

def generate_logs():
    """Function to generate logs and send them to Logstash via UDP"""
    while True:
        start_time = time.time()

        for _ in range(LOGS_PER_THREAD):
            log_type = random.choice(["app", "windows_event", "network"])

            if log_type == "app":
                log_entry = {
                    "timestamp": time.strftime("%Y-%m-%dT%H:%M:%S"),
                    "log_type": "application",
                    "level": random.choice(LOG_LEVELS),
                    "message": random.choice(APP_MESSAGES),
                    "source": "python_log_generator"
                }
            
            elif log_type == "windows_event":
                event = random.choice(WINDOWS_EVENTS)
                log_entry = {
                    "timestamp": time.strftime("%Y-%m-%dT%H:%M:%S"),
                    "log_type": "windows_event",
                    "event_id": event["event_id"],
                    "message": event["message"],
                    "source": "Windows Security Log"
                }

            else:  # Network Logs
                log_entry = {
                    "timestamp": time.strftime("%Y-%m-%dT%H:%M:%S"),
                    "log_type": "network",
                    "protocol": random.choice(NETWORK_PROTOCOLS),
                    "source_ip": random.choice(IP_ADDRESSES),
                    "source_port": random.choice(PORTS),
                    "destination_ip": random.choice(IP_ADDRESSES),
                    "destination_port": random.choice(PORTS),
                    "action": random.choice(["allowed", "denied"])
                }

            log_data = json.dumps(log_entry)  # Convert log to JSON format

            # Print log to terminal
            print(log_data)

            # Send log to Logstash
            sock.sendto(log_data.encode(), (LOGSTASH_HOST, LOGSTASH_PORT))

        elapsed_time = time.time() - start_time
        sleep_time = max(0, 1 - elapsed_time)  # Maintain logs per second
        time.sleep(sleep_time)

# Start log generation threads
threads = []
for _ in range(THREADS):
    t = threading.Thread(target=generate_logs, daemon=True)
    t.start()
    threads.append(t)

# Keep the script running
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    print("Log generation stopped.")
    sock.close()

