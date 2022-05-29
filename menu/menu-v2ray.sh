#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
clear
IP=$(wget -qO- ipinfo.io/ip);
echo -e "           ═══[V2RAY CORE MENU]═══        "
echo -e "           \e[32m═════════════════════════\e[m      " 
echo -e""
echo -e "${color1}1${color3}.$bd Create Account Vmess Websocket (${color2}addv2ray${color3})"
echo -e "${color1}2${color3}.$bd Create Account Vless Websocket (${color2}addv2ray${color3})"
echo -e "${color1}3${color3}.$bd Create Account Trojan (${color2}addv2ray${color3})"
echo -e "${color1}4${color3}.$bd Delete Account Vmess Websocket (${color2}delv2ray${color3})"
echo -e "${color1}5${color3}.$bd Delete Account Vless Websocket (${color2}delv2ray${color3})"
echo -e "${color1}6${color3}.$bd Delete Account Trojan (${color2}delv2ray${color3})"
echo -e "${color1}7${color3}.$bd Renew Account Vmess Websocket (${color2}renewv2ray${color3})"
echo -e "${color1}8${color3}.$bd Renew Account Vless Websocket (${color2}renewv2ray${color3})"
echo -e "${color1}9${color3}.$bd Renew Account Trojan (${color2}renewv2ray${color3})"
echo -e "${color1}10${color3}.$bd Check Account Vmess Websocket (${color2}cekv2ray${color3})"
echo -e "${color1}11${color3}.$bd Check Account Vless Websocket (${color2}cekv2ray${color3})"
echo -e "${color1}12${color3}.$bd Check Account Trojan (${color2}cekv2ray${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " silahkan masukkan nomor [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
addvless
;;
3)
addtrojan
;;
4)
delvmess
;;
5)
delvless
;;
6)
deltrojan
;;
7)
renewvmess
;;
8)
renewvless
;;
9)
renewtrojan
;;
10)
cekvmess
;;
11)
cekvless
;;
12)
cektrojan
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
menu-v2ray
;;
esac
