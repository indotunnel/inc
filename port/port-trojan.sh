#!/bin/bash
#Port Changer Trojan

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

# Validate Your IP Address
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
tr=$(cat /etc/trojan/config.json | grep local_port | sed 's/local_//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/"//g' | sed 's/   //g' | sed 's/  //g')
echo -e "======================================"
echo -e "         V2Ray VMess Port Changer"
echo -e ""
echo -e "     [1]  Change Port V2Ray Trojan ${RED}$tr${NC}"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1 or x] :  " port
echo -e ""
case $port in
1)
read -p "Type New Port For V2Ray Trojan : " tr1
if [ -z $tr1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tr/$tr1/g" /etc/trojan/config.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
clear
echo -e "${GREEN}Succesfully Changed V2Ray Trojan Port To $tr1${NC}"
else
echo -e "${RED}Error ! ${NC}Port $tr1 Is Already Used"
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
