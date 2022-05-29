#!/bin/bash
#Menu
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
IP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "            ═══[SSH MENU]═══"
echo -e "  \e[32m═══════════════════════\e[m"
echo -e""
echo -e "${color1}1${color3}.$bd Create Account SSH & OpenVPN (${color2}addssh${color3})"
echo -e "${color1}2${color3}.$bd Trial Account SSH & OpenVPN (${color2}trialssh${color3})"
echo -e "${color1}3${color3}.$bd Renew Account SSH & OpenVPN (${color2}renewssh${color3})"
echo -e "${color1}4${color3}.$bd Delete Account SSH & OpenVPN (${color2}delssh${color3})"
echo -e "${color1}5${color3}.$bd Check User Login SSH & OpenVPN (${color2}cekssh${color3})"
echo -e "${color1}6${color3}.$bd Daftar Member SSH & OpenVPN (${color2}member${color3})"
echo -e "${color1}7${color3}.$bd Padam User SSH & OpenVPN Exp (${color2}delexp${color3})"
echo -e "${color1}8${color3}.$bd Set up Autokill SSH (${color2}autokill${color3})"
echo -e "${color1}9${color3}.$bd Check User Multi Login SSH (${color2}ceklim${color3})"
echo -e "${color1}10${color3}.$bd Restart All Service (${color2}restart${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-9 or x] :  "  menu
echo -e ""
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
delssh
;;
5)
cekssh
;;
6)
member
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
menu-ssh
;;
esac
