#!/bin/bash
# My Telegram : https://t.me/Manternet
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo start
sleep 0.5
domain=$(cat /etc/xray/domain)
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop xray
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
clear
cd .acme.sh
echo "starting....," 
echo "Port 80 Akan di Hentikan Saat Proses install Cert"          
bash acme.sh --issue -d $domain --standalone -k ec-256 --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl start xray.service
systemctl start v2ray
systemctl start v2ray@none
systemctl start vmess-grpc
restart
echo Done
sleep 0.5 
clear
neofetch
