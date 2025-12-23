#!/bin/bash

# Non-interactive timezone
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Update system
apt-get update -y
apt-get install -y curl ca-certificates

# Install sshx
curl -sSf https://sshx.io/get | sh

# Start sshx in background and save output
sshx > /tmp/sshx.log 2>&1 &

# Give sshx time to start
sleep 5

# Show sshx web URL
echo "========== SSHX ACCESS =========="
grep -o 'https://sshx.io/[a-zA-Z0-9]*' /tmp/sshx.log
echo "================================="

# Keep session alive
while true; do
    echo "alive $(date)"
    sleep 300
done
