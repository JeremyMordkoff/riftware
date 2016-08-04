#!/bin/bash

yum install -y yum-utils curl
curl -o /etc/yum.repos.d/OSM.repo http://buildtracker.riftio.com/repo_file/fc20/OSM/ 
yum install -y --nogpgcheck rw.tools-container-tools rw.tools-scripts 
/usr/rift/container_tools/mkcontainer  --modes ui
yum -y install riftware-launchpad
systemctl start rwlp
MY_IP=$(ifconfig | awk '/127.0.0.1/ { next } 
/inet / { print $2 }')
cat <<EOF

launchpad installed and running
please open a browser to https://$MY_IP:8443 
log file is /var/log/launchpad-console.log

EOF

