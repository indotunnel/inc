#!/bin/bash
#Port Changer Vmess

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

# Validate Your IP Address
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear

tls=$(cat /etc/v2ray/config.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
none=$(cat /etc/v2ray/none.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
echo -e "======================================"
echo -e "         V2Ray VMess Port Changer"
echo -e ""
echo -e "     [1]  Change Port V2Ray VMess Tls ${RED}$tls${NC}"
echo -e "     [2]  Change Port V2Ray VMess Non-Tls ${RED}$none${NC}"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-2 or x] :  " port
echo -e ""
case $port in
1)
read -p "Type New Port For V2Ray VMess TLS: " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/config.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray > /dev/null
clear
echo -e "${GREEN}Succesfully Changed V2Ray VMess TLS Port To $tls1${NC}"
else
echo -e "${RED}Error ! ${NC}Port $none1 Is Already Used"
fi
;;
2)
echo "Input Only 2 Numbers (eg : 99)"
read -p "Type New Port For V2Ray VMess Non-Tls : " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/v2ray/none.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@none > /dev/null
clear
echo -e "${GREEN}Succesfully Change V2Ray VMess Non-Tls Port To $none1${NC}"
else
echo -e "${RED}Error ! ${NC}Port $none1 Is Already Used"
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
