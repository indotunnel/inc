#!/bin/bash
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
#cert
domain=$(cat /root/domain)
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
sudo bash acme.sh --register-account -m admin@geolstore.net
sudo bash acme.sh --issue -d $domain --standalone -k ec-256 --force
sudo bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
restart
clear
rm -f /root/cert.sh
