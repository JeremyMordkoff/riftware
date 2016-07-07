#!/bin/bash

cd $(dirname $0)
./scripts/vm_image/mkvmimg --container --modes ui --repofile ./riftware-fedora.repo
yum -y install riftware-launchpad
systemctl start rwlp
MY_IP=$(ifconfig | awk '/127.0.0.1/ { next } 
/inet / { print $2 }')
cat <<EOF

launchpad installed and running
please open a browser to https://$MY_IP:8443 
log file is /var/log/launchpad-console.log

EOF

