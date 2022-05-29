#!/bin/bash
# My Telegram : https://t.me/joysmark
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
IP=$(wget -qO- ipinfo.io/ip);
ssr_user=dev-`</dev/urandom tr -dc X-Z0-9 | head -c4`
source /var/lib/geovpn/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
masaaktif=1
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
lastport=$(cat /usr/local/shadowsocksr/mudb.json | grep '"port": ' | tail -n1 | awk '{print $2}' | cut -d "," -f 1 | cut -d ":" -f 1 )
if [[ $lastport == '' ]]; then
ssr_port=1443
else
ssr_port=$((lastport+1))
fi
ssr_password="$ssr_user"
ssr_method="aes-256-cfb"
ssr_protocol="origin"
ssr_obfs="plain"
ssr_protocol_param="2"
ssr_speed_limit_per_con=0
ssr_speed_limit_per_user=0
ssr_transfer="838868"
ssr_forbid="bittorrent"
cd /usr/local/shadowsocksr
match_add=$(python mujson_mgr.py -a -u "${ssr_user}" -p "${ssr_port}" -k "${ssr_password}" -m "${ssr_method}" -O "${ssr_protocol}" -G "${ssr_protocol_param}" -o "${ssr_obfs}" -s "${ssr_speed_limit_per_con}" -S "${ssr_speed_limit_per_user}" -t "${ssr_transfer}" -f "${ssr_forbid}"|grep -w "add user info")
cd
echo -e "${Info}Penambahan user berhasil [username: ${ssr_user}]"
echo -e "### $ssr_user $exp" >> /usr/local/shadowsocksr/akun.conf
tmp1=$(echo -n "${ssr_password}" | base64 -w0 | sed 's/=//g;s/\//_/g;s/+/-/g')
SSRobfs=$(echo ${ssr_obfs} | sed 's/_compatible//g')
tmp2=$(echo -n "$IP:${ssr_port}:${ssr_protocol}:${ssr_method}:${SSRobfs}:${tmp1}/obfsparam=" | base64 -w0)
ssr_link="ssr://${tmp2}"
/etc/init.d/ssrmu restart
systemctl restart ssrmu
service cron restart
IP=$(wget -qO- ifconfig.co);
clear

echo -e "======-SHADOWSOCKSR-======"
echo -e "IP/Host     : ${IP}"
echo -e "Domain      : $domain"
echo -e "Port        : ${ssr_port}"
echo -e "Password    : ${ssr_password}"
echo -e "Encryption  : ${ssr_method}"
echo -e "Protocol    : ${Red_font_prefix}${ssr_protocol}"
echo -e "Obfs        : ${Red_font_prefix}${ssr_obfs}"
echo -e "Max Device  : ${ssr_protocol_param}"
echo -e "Created     : $hariini"
echo -e "Expired     : ${exp} "
echo -e "=========================="
echo -e "Link SSR    : ${ssr_link}"
echo -e "=========================="
echo -e ""
