cd /var/log
ls -l |grep messages*
rm -rf messages*
cd /opt/scripts/LogManagement
/opt/EIMS/scripts/linux_scripts/LogManagement/index_deletion_scripts/delete_indices_https.sh http 0.0.0.0 elastic elastic 2


# Get all unique PIDs of processes with deleted files
PIDS=$(lsof | grep deleted | awk '{print $2}' | sort -u)

# Check if any PIDs are found
if [ -z "$PIDS" ]; then
    echo "✅ No processes with deleted file handles found."
    exit 0
fi

echo "⚠️ Found the following PIDs holding deleted files:"
echo "$PIDS"
echo

# Confirm before killing
read -p "Do you want to kill these processes? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "❌ Operation cancelled."
    exit 0
fi

# Kill all found processes
for pid in $PIDS; do
    echo "Killing PID: $pid ..."
    kill -9 "$pid" 2>/dev/null && echo "✅ PID $pid killed." || echo "⚠️ Failed to kill PID $pid."
done

echo "✅ All processes terminated (if any were active)."

