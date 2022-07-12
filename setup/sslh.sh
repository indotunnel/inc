#!/bin/bash
apt-get install -y sslh
cat > /etc/default/sslh << "EOF" 
RUN=yes

DAEMON=/usr/sbin/sslh

DAEMON_OPTS='--user sslh --listen 0.0.0.0:443 --ssh 127.0.0.1:143 --ssl 127.0.0.1:3127 --http 127.0.0.1:8080 --openvpn 127.0.0.1:1194 --pidfile /var/run/sslh/sslh.pid'
EOF

systemctl enable sslh
systemctl start sslh
