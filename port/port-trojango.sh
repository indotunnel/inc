#!/bin/bash
#Port Changer Trojan

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

# Validate Your IP Address
MYIP=$(wget -qO- icanhazip.com);
echo "Checking Auth For Permission"

trgo=$(cat /etc/trgo-mini/config.json | grep local_port | sed 's/local_//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/"//g' | sed 's/   //g' | sed 's/  //g')
echo -e "======================================"
echo -e "         Trojan-GO Port Changer"
echo -e ""
echo -e "     [1]  Change Port Trojan-GO ${RED}$trgo${NC}"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1 or x] :  " port
echo -e ""
case $port in
1)
read -p "Type New Port For Trojan-GO : " trgo1
if [ -z $trgo1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$trgo/$trgo1/g" /etc/trojan/config.json
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trgo -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trgo -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $trgo1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $trgo1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trgo-mini > /dev/null
clear
echo -e "${GREEN}Succesfully Changed Trojan-GO Port To $trgo1${NC}"
else
echo -e "${RED}Error ! ${NC}Port $trgo1 Is Already Used"
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
