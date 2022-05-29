#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
IP=$(wget -qO- ipinfo.io/ip);
clear
echo -e "          ═══[XRAY CORE MENU]═══"
echo -e " \e[32m═══════════════════════════════\e[m"
echo -e""
echo -e "${color1}1${color3}.$bd Create Account Vmess TCP (${color2}addxray${color3})"
echo -e "${color1}2${color3}.$bd Create Account Vless TCP (${color2}addxray${color3})"
echo -e "${color1}3${color3}.$bd Create Account Trojan (${color2}addxray${color3})"
echo -e "${color1}4${color3}.$bd Create Account Xtls (${color2}addxray${color3})"
echo -e "${color1}5${color3}.$bd Create Account GRPC (${color2}addxray${color3})"
echo -e "-----------------------------------------------------------------------------------" |
echo -e "${color1}6${color3}.$bd Delete Account Vmess TCP (${color2}delray${color3})"
echo -e "${color1}7${color3}.$bd Delete Account Vless TCP (${color2}delxray${color3})"
echo -e "${color1}8${color3}.$bd Delete Account Trojan (${color2}delxray${color3})"
echo -e "${color1}9${color3}.$bd Delete Account Xtls (${color2}delxray${color3})"
echo -e "${color1}10${color3}.$bd Delete Account GRPC (${color2}delxray${color3})"
echo -e "-----------------------------------------------------------------------------------"
echo -e "${color1}11${color3}.$bd Renew Account Vmess TCP(${color2}renewxray${color3})"
echo -e "${color1}12${color3}.$bd Renew Account Vless TCP(${color2}renewxray${color3})"
echo -e "${color1}13${color3}.$bd Renew Account Trojan (${color2}renewxray${color3})"
echo -e "${color1}14${color3}.$bd Renew Account Xtls (${color2}renewxray${color3})"
echo -e "${color1}15${color3}.$bd Renew Account GRPC (${color2}renewxray${color3})"
echo -e "-----------------------------------------------------------------------------------"
echo -e "${color1}16${color3}.$bd Check Account Vmess TCP (${color2}cekxray${color3})"
echo -e "${color1}17${color3}.$bd Check Account Vless TCP (${color2}cekxray${color3})"
echo -e "${color1}18${color3}.$bd Check Account Trojan (${color2}cekxray${color3})"
echo -e "${color1}19${color3}.$bd Check Account Xtls (${color2}cekxray${color3})"
echo -e "${color1}20${color3}.$bd Check Account GRPC (${color2}cekxray${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " silahkan masukkan nomor [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addxvmess
;;
2)
addxvless
;;
3)
addxtrojan
;;
4)
addxtls
;;
5)
addgrpc
;;
6)
delxvmess
;;
7)
delxvless
;;
8)
delxtrojan
;;
9)
delxtls
;;
10)
delgrpc
;;
11)
renewxvmess
;;
12)
renewxvless
;;
13)
renewxtrojan
;;
14)
renewxtls
;;
15)
renewgrpc
;;
16)
cekxvmess
;;
17)
cekxvless
;;
18)
cekxtrojan
;;
19)
cekxtls
;;
20)
cekgrpc
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
menu-xray
;;
esac
