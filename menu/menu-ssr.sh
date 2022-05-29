#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bd='\e[1m'
bl='\e[36;1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
IP=$(wget -qO- ipinfo.io/ip);
clear
echo -e "           ═══[SSR / SS MENU]═══"
echo -e "\e[32m══════════════════════════════\e[m"
echo -e""
echo -e "${color1}1${color3}.$bd  Create Account ShadowsocksR(${color2}addssr${color3})"
echo -e "${color1}2${color3}.$bd  Create Account Shadowsocks  (${color2}addss${color3})"
echo -e "${color1}3${color3}.$bd  Delete Account ShadowsocksR (${color2}delssr${color3})"
echo -e "${color1}4${color3}.$bd  Delete Account Shadowsocks (${color2}delss${color3})"
echo -e "${color1}5${color3}.$bd  Renew Account ShadowsocksR  (${color2}renewssr${color3})"
echo -e "${color1}6${color3}.$bd  Renew Account Shadowsocks (${color2}renewss${color3})"
echo -e "${color1}7${color3}.$bd  Check User Login Ss & Ssr (${color2}cekss${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-8 or x] :  "  menu
echo -e ""
case $menu in
1)
addssr
;;
2)
addss
;;
3)
delssr
;;
4)
delss
;;
5)
renewssr
;;
6)
renewss
;;
7)
cekss
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada" 
sleep 1
menu-ssr
;;
esac
