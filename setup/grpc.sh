#!/usr/bin/env bash

## grpc

mkdir -p /usr/local/xray/
wget -q -O /usr/local/xray/xray "https://raw.githubusercontent.com/indotunnel/inc/main/core/xray"
wget -q -O /usr/local/xray/xray "https://raw.githubusercontent.com/indotunnel/inc/main/core/xray" 
wget -q -O /usr/local/xray/geosite.dat "https://raw.githubusercontent.com/indotunnel/inc/main/addon/geosite.dat"
wget -q -O /usr/local/xray/geoip.dat "https://raw.githubusercontent.com/indotunnel/inc/main/addon/geoip.dat"
mkdir -p /etc/xray/
chmod 775 /etc/xray/

  cat > '/etc/xray/trojangrpc.json' << "EOF"
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": 2022,
      "listen": "127.0.0.1",
      "protocol": "trojan",
      "tag": "trojangRPC",
        "settings": {
            "clients": [
                {
                    "password": "$uuid"
                }
            ]
        },
        "streamSettings": {
            "network": "grpc",
            "grpcSettings": {
                "serviceName": "/grpc_trojan"
            }
        }
    }
  ],
  "outbounds": [
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {}
    },
    {
      "tag": "blocked",
      "protocol": "blackhole",
      "settings": {}
    }
  ],
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "type": "field",
        "ip": [
          "geoip:private"
        ],
        "outboundTag": "direct"
      },
      {
        "type": "field",
        "domain": [
          "geosite:category-ads"
        ],
        "outboundTag": "blocked"
      }
    ]
  }
}
EOF

  cat > '/etc/systemd/system/trojan-grpc.service' << EOF
[Unit]
Description=Trojan(Grpc) Service
Wants=network-online.target
After=network-online.target nss-lookup.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/xray/xray -config /etc/xray/trojangrpc.json
TimeoutStopSec=infinity
LimitNOFILE=65536
Restart=on-failure
RestartSec=3s

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable trojan-grpc.service
systemctl restart trojan-grpc.service

cd /root
}
