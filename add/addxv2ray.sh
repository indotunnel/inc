#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
domain=$(cat /etc/v2ray/domain)
tls=$(cat /etc/xray/vmesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
none=$(cat /etc/xray/vmessnone.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
mkcp=$(cat /etc/xray/mkcp.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vmesstls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "SNI (bug): " sni 
read -p "Subdomain (EXP : manternet.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmesstls.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmessnone.json
sed -i '/#mkcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/mkcp.json
cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${dom}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/xray",
      "type": "none",
      "host": "${sni}",
      "tls": "tls"
}
EOF
cat > /etc/xray/$user-none.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${dom}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/xray",
      "type": "none",
      "host": "${sni}",
      "tls": "none"
}
EOF
cat > /etc/xray/$user-mkcp.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${dom}",
      "port": "${mkcp}",
      "id": "${uuid}",
      "aid": "0",
      "net": "kcp",
      "path": "/xray",
      "type": "dtls",
      "host": "${sni}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/xray/$user-none.json)"
vmesslink3="vmess://$(base64 -w 0 /etc/xray/$user-mkcp.json)"
systemctl restart xr-vm-ntls.service
systemctl restart xr-vm-tls.service
systemctl restart xr-vm-mk.service
service cron restart
clear
echo -e "================================="
echo -e "            XRAY VMESS          " 
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Subdomain      : ${dom}"
echo -e "port TCP       : ${tls}"
echo -e "port none TCP  : ${none}"
echo -e "port KCP       : ${mkcp}"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Security       : auto"
echo -e "network        : TCP"
echo -e "path           : /xray"
echo -e "================================="
echo -e "Link TCP       : ${vmesslink1}"
echo -e "================================="
echo -e "Link None TCP  : ${vmesslink2}"
echo -e "================================="
echo -e "Link KCP       : ${vmesslink3}"
echo -e "================================="
echo -e "Expired On     : $exp"
