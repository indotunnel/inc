#!/bin/bash

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

#change port
tr=$(cat /etc/xray/trojan.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
echo -e "======================================"
echo -e "         Xray Trojan Port Changer"
echo -e ""
echo -e "     [1]  Change Port Xray Trojan ${RED}$tr${NC}"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1 or x] :  " port
echo -e ""
case $port in
1)
read -p "Type New Port For Xray Trojan : " tr2
if [ -z $tr2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tr2)
if [[ -z $cek ]]; then
sed -i "s/$tr/$tr2/g" /etc/xray/trojan.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Xray Trojan Port To $tr2${NC}"
else
echo -e "${RED}Error ! ${NC}Port $tr2 Is Already Used"
fi
;;
x)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac
