#!/bin/bash
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'

clear

cat /usr/bin/bannerku
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
sleep 1
        echo -e ""
        echo -e "   \e[032;1mUPTIME:\e[0m $(neofetch | grep Uptime | cut -d " " -f 2-100)"
        echo -e "   \e[032;1mIsp Name:\e[0m $ISP"
        echo -e "   \e[032;1mCity:\e[0m $CITY"
        echo -e "   \e[032;1mDOMAIN:\e[0m $(cat /etc/xray/domain)"
        echo -e "   \e[033;1mIPVPS :\e[0m $MYIP"
echo -e  ""
echo -e  "   -------------------------MENU OPTIONS------------------------"
echo -e   "   1\e[1;33m)\e[m SSH & OpenVPN Menu" 
echo -e   "   2\e[1;33m)\e[m Panel Wireguard " 
echo -e   "   3\e[1;33m)\e[m Panel SSR & SS Account" 
echo -e   "   4\e[1;33m)\e[m Panel TrojanGo" 
echo -e   "   5\e[1;33m)\e[m V2ray Core Menu"  
echo -e   "   6\e[1;33m)\e[m Xray  Core Menu"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "                             SYSTEM MENU\e[m"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "    7\e[1;33m)\e[m  Add Subdomain Host For VPS" 
echo -e   "    8\e[1;33m)\e[m  Renew Certificate V2RAY" 
echo -e   "    9\e[1;33m)\e[m  Change Port All Account"
echo -e   "   10\e[1;33m)\e[m  Backup Data VPS" 
echo -e   "   11\e[1;33m)\e[m  Restore Data VPS" 
echo -e   "   12\e[1;33m)\e[m  Webmin Menu" 
echo -e   "   13\e[1;33m)\e[m  Limit Bandwith Speed Server" 
echo -e   "   14\e[1;33m)\e[m  Check Usage of VPS Ram"  
echo -e   "   15\e[1;33m)\e[m  Reboot VPS" 
echo -e   "   16\e[1;33m)\e[m  Speedtest VPS" 
echo -e   "   17\e[1;33m)\e[m  Information Display System" 
echo -e   "   18\e[1;33m)\e[m  Info Script Auto Install" 
echo -e   "   19\e[1;33m)\e[m  Install BBR" 
echo -e   "   20\e[1;33m)\e[m  Add ID Cloudflare"
echo -e   "   21\e[1;33m)\e[m  Cloudflare Add-Ons" 
echo -e   "   22\e[1;33m)\e[m  Pointing BUG" 
echo -e   "   23\e[1;33m)\e[m  Clear log" 
echo -e   "   24\e[1;33m)\e[m  Auto Reboot" 
echo -e   "   25\e[1;33m)\e[m  Check Service Running"
echo -e   "   26\e[1;33m)\e[m  Update Lates Script"
echo -e   "   27\e[1;33m)\e[m  Pointing VPS"
echo -e   "   28\e[1;33m)\e[m  Cek Bandwidth VPS"
echo -e   "   29\e[1;33m)\e[m  Wildcard"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   "   x)   Exit"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m"
echo -e   ""
read -p "     Select From Options [1-29 or x] :  " menu
echo -e   ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-ssr
;;
4)
menu-trgo
;;
5)
menu-v2ray
;;
6)
menu-xray
;;
7)
addhost
;;
8)
cert
;;
9)
changeport
;;
10)
backup
;;
11)
restore
;;
12)
wbmn
;;
13)
limitspeed
;;
14)
T
;;
15)
reboot
;;
16)
speedtest
;;
17)
ram
;;
18)
reboot
;;
19)
bbr
;;
20)
info
;;
21)
about
;;
22)
bbr
;;
23)
cff
;;
24)
cfd
;;
25)
cfh
;;
26)
clear-log
;;
27)
autoreboot
;;
28)
sudo running
;;
29)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac
