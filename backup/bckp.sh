#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);

IP=$(wget -qO- icanhazip.com);
isp=$(curl -s ipinfo.io/org)
hostname=$(hostname)
date=$(date +"%Y-%m-%d")
email=$(cat /home/email)
echo Creating Directory...
mkdir /root/backup
sleep 1
echo Starting Backup...
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/Manpokr/ backup/manpokr
cp -r /home/sstp backup/sstp
cp -r /etc/v2ray backup/v2ray
cp -r /etc/xray backup/xray
cp -r /etc/trojan backup/trojan
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp /etc/crontab backup/crontab
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file.

Your VPS Detail :
IP Address : $IP
ISP : $isp
Hostname : $hostname

$link

If you want to restore data, please enter the link above.

Thank You For Using Our Services" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo Done
