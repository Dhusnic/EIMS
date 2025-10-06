cd /var/log
ls -l |grep messages*
rm -rf messages*
cd /opt/scripts/LogManagement
./delete_indices_https.sh
