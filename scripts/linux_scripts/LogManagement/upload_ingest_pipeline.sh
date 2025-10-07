#!/usr/bin/env bash
###############################################################################
# upload_ingest_pipelines.sh
#
# Upload all *.json files found in a given folder to matching ingest-pipeline
# IDs in Elasticsearch.  Any JSON file **not** present is skipped with a
# warning—no hard-failure.
#
# USAGE:
#   ./upload_ingest_pipelines.sh <ABSOLUTE_FOLDER_PATH> <IP> <http|https>
#
# EXAMPLE:
#   ./upload_ingest_pipelines.sh /opt/pipelines 10.0.5.97 https
###############################################################################

set -euo pipefail

# --------------------------- CONSTANTS / DEFAULTS ---------------------------
CA_CERT="/opt/certs/http_ca.crt"      # Edit if your CA lives elsewhere
ES_USER="elastic"
ES_PASS="elastic"

# -------------------- FULL PIPELINE MAP FOR FILEBEAT 8.14.0 ------------------
declare -A PIPELINES=(
  [activemq_log.json]="filebeat-8.14.0-activemq-log-pipeline"
  [apache_access.json]="filebeat-8.14.0-apache-access-pipeline"
  [apache_error.json]="filebeat-8.14.0-apache-error-pipeline"
  [auditd_log.json]="filebeat-8.14.0-auditd-log-pipeline"
  [aws_cloudtrail.json]="filebeat-8.14.0-aws-cloudtrail-pipeline"
  [aws_cloudwatch.json]="filebeat-8.14.0-aws-cloudwatch-pipeline"
  [aws_vpcflow.json]="filebeat-8.14.0-aws-vpcflow-pipeline"
  [azure_activitylog.json]="filebeat-8.14.0-azure-activitylog-pipeline"
  [azure_signinlogs.json]="filebeat-8.14.0-azure-signinlogs-pipeline"
  [cef_log.json]="filebeat-8.14.0-cef-log-pipeline"
  [checkpoint_fw.json]="filebeat-8.14.0-checkpoint-fw-pipeline"
  [cisco_asa.json]="filebeat-8.14.0-cisco-asa-pipeline"
  [cisco_ftd.json]="filebeat-8.14.0-cisco-ftd-pipeline"
  [cisco_ise.json]="filebeat-8.14.0-cisco-ise-pipeline"
  [coredns_log.json]="filebeat-8.14.0-coredns-log-pipeline"
  [crowdstrike_fdr.json]="filebeat-8.14.0-crowdstrike-fdr-pipeline"
  [elasticsearch_deprecation.json]="filebeat-8.14.0-elasticsearch-deprecation-pipeline"
  [elasticsearch_gc.json]="filebeat-8.14.0-elasticsearch-gc-pipeline"
  [elasticsearch_slowlog.json]="filebeat-8.14.0-elasticsearch-slowlog-pipeline"
  [envoyproxy_access.json]="filebeat-8.14.0-envoyproxy-access-pipeline"
  [fortinet_fortigate.json]="filebeat-8.14.0-fortinet-fortigate-pipeline"
  [gcp_audit.json]="filebeat-8.14.0-gcp-audit-pipeline"
  [gcp_firewall.json]="filebeat-8.14.0-gcp-firewall-pipeline"
  [gcp_vpcflow.json]="filebeat-8.14.0-gcp-vpcflow-pipeline"
  [gws_admin.json]="filebeat-8.14.0-google_workspace-admin-pipeline"
  [gws_login.json]="filebeat-8.14.0-google_workspace-login-pipeline"
  [haproxy_log.json]="filebeat-8.14.0-haproxy-log-pipeline"
  [ibmmq_log.json]="filebeat-8.14.0-ibmmq-log-pipeline"
  [iis_access.json]="filebeat-8.14.0-iis-access-pipeline"
  [iis_error.json]="filebeat-8.14.0-iis-error-pipeline"
  [iptables_log.json]="filebeat-8.14.0-iptables-log-pipeline"
  [juniper_junos.json]="filebeat-8.14.0-juniper-junos-pipeline"
  [kafka_log.json]="filebeat-8.14.0-kafka-log-pipeline"
  [kibana_log.json]="filebeat-8.14.0-kibana-log-pipeline"
  [logstash_log.json]="filebeat-8.14.0-logstash-log-pipeline"
  [m365_audit.json]="filebeat-8.14.0-microsoft-365-audit-pipeline"
  [m365_defender.json]="filebeat-8.14.0-microsoft-365-defender-pipeline"
  [mongodb_log.json]="filebeat-8.14.0-mongodb-log-pipeline"
  [mongodb_log_pipeline_json.json]="filebeat-8.14.0-mongodb-log-pipeline-json"
  [mongodb_log_pipeline_plaintext.json]="filebeat-8.14.0-mongodb-log-pipeline-plaintext"
  [mssql_error.json]="filebeat-8.14.0-mssql-error-pipeline"
  [mysql_error.json]="filebeat-8.14.0-mysql-error-pipeline"
  [mysql_slowlog.json]="filebeat-8.14.0-mysql-slowlog-pipeline"
  [nats_log.json]="filebeat-8.14.0-nats-log-pipeline"
  [netflow_log.json]="filebeat-8.14.0-netflow-log-pipeline"
  [nginx_access.json]="filebeat-8.14.0-nginx-access-pipeline"
  [nginx_error.json]="filebeat-8.14.0-nginx-error-pipeline"
  [okta_system.json]="filebeat-8.14.0-okta-system-pipeline"
  [oracle_alert.json]="filebeat-8.14.0-oracle-alert-pipeline"
  [osquery_result.json]="filebeat-8.14.0-osquery-result-pipeline"
  [panw_panorama.json]="filebeat-8.14.0-paloalto-panorama-pipeline"
  [postgresql_log.json]="filebeat-8.14.0-postgresql-log-pipeline"
  [rabbitmq_log.json]="filebeat-8.14.0-rabbitmq-log-pipeline"
  [redis_log.json]="filebeat-8.14.0-redis-log-pipeline"
  [salesforce_log.json]="filebeat-8.14.0-salesforce-log-pipeline"
  [santa_log.json]="filebeat-8.14.0-santa-log-pipeline"
  [snyk_log.json]="filebeat-8.14.0-snyk-log-pipeline"
  [sophos_xg.json]="filebeat-8.14.0-sophos-xg-pipeline"
  [suricata_eve.json]="filebeat-8.14.0-suricata-eve-pipeline"
  [system_auth.json]="filebeat-8.14.0-system-auth-pipeline"
  [system_syslog.json]="filebeat-8.14.0-system-syslog-pipeline"
  [threatintel_anomali.json]="filebeat-8.14.0-threatintel-anomali-pipeline"
  [traefik_access.json]="filebeat-8.14.0-traefik-access-pipeline"
  [zeek_conn.json]="filebeat-8.14.0-zeek-conn-pipeline"
  [zeek_dns.json]="filebeat-8.14.0-zeek-dns-pipeline"
  [zeek_http.json]="filebeat-8.14.0-zeek-http-pipeline"
  [zeek_notice.json]="filebeat-8.14.0-zeek-notice-pipeline"
  [zookeeper_log.json]="filebeat-8.14.0-zookeeper-log-pipeline"
  [zoom_log.json]="filebeat-8.14.0-zoom-log-pipeline"
)
# ---------------------------------------------------------------------------

# ------------------------------ FUNCTIONS -----------------------------------
usage() {
  echo "Usage: $0 <ABSOLUTE_FOLDER_PATH> <IP> <http|https>" >&2
  exit 1
}

validate_args() {
  [[ $1 = /* ]]                             || { echo "ERROR: Path must be absolute." >&2; exit 1; }
  [[ -d $1 && -r $1 ]]                      || { echo "ERROR: Folder '$1' not accessible." >&2; exit 2; }
  [[ $2 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "ERROR: '$2' is not a valid IPv4." >&2; exit 1; }
  [[ $3 == "http" || $3 == "https" ]]       || { echo "ERROR: Protocol must be http or https." >&2; exit 1; }
}

upload_pipeline() {
  local file=$1 id=$2 url extra
  url="${PROTO}://${IP}:9200/_ingest/pipeline/${id}"
  [[ $PROTO == "https" ]] && extra=(--cacert "$CA_CERT") || extra=()

  echo ">> PUT ${file}  →  ${id}"
  curl -sS -w "\nHTTP %{http_code}\n" \
       -u "${ES_USER}:${ES_PASS}" \
       -X PUT "${url}" \
       -H 'Content-Type: application/json' \
       -d @"${FOLDER}/${file}" \
       "${extra[@]}"
}

# ----------------------------- MAIN SCRIPT -----------------------------------
[[ $# -ne 3 ]] && usage
FOLDER=$1; IP=$2; PROTO=$3
validate_args "$FOLDER" "$IP" "$PROTO"

# --- Iterate only over JSON files that actually exist in the folder ----------
found_any=false
for file in "${!PIPELINES[@]}"; do
  if [[ -r "${FOLDER}/${file}" ]]; then
    found_any=true
    upload_pipeline "${file}" "${PIPELINES[$file]}"
  else
    echo "WARN: Skipping ${file} – not found in ${FOLDER}" >&2
  fi
done

$found_any || { echo "No matching JSON files found – nothing uploaded."; exit 0; }
echo "Completed."

