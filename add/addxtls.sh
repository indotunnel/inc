#!/bin/bash

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear

# // Input
read -p "Username   : " username
read -p "Expired    : " expired
read -p "SNI (BUG)  : " sni
read -p "Subdomain (EXP : manternet.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
domain=$(cat /root/domain)
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$expired days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
port=$(cat /etc/xray/xrayxtls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')

# // Input Data User Ke XRay Vless TCP XTLS
sed -i '/#XRay$/a\#DEPAN '"Username : $username | Expired : $exp"'\
            },{"id": "'""$uuid""'","flow": "'xtls-rprx-direct'"\
#BELAKANG '"Username : $username | Expired : $exp"'' /etc/xray/xrayxtls.json
IP=$( curl -s ipinfo.io/ip )
vd="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#$username"
vu="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct-udp443&sni=$sni#$username"
vs="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#$username"
vsu="vless://$uuid@$dom:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice-udp443&sni=$sni#$username"
systemctl restart xtls
clear
echo -e "================================="
echo -e "            XRAY VLESS          "
echo -e "================================="
echo -e "Remarks        : ${username}"
echo -e "Domain         : ${domain}"
echo -e "Subdomain      : ${dom}"
echo -e "port TCP       : $port"
echo -e "port none TCP  : $none"
echo -e "id             : ${uuid}"
echo -e "================================="
echo -e "Direct         : ${vd}"
echo -e "================================="
echo -e "Direct UDP     : ${vu}"
echo -e "================================="
echo -e "Splice         : ${vs}"
echo -e "================================="
echo -e "Splice         : ${vsu}"
echo -e "================================="
echo -e "Expired On     : $exp"
