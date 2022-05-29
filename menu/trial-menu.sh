#!/bin/bash
clear
echo -e "                   ═══[TRIAL MENU]═══            " | lolcat
echo -e "     \e[32m══════════════════════════════\e[m" | lolcat
echo " 1)= >> Create TRial XRay VMess Accounts                         
echo " 2)= >> Create TRial XRay VLess Accounts                      
echo " 3)= >> Create TRial XRay Trojan Accounts                      
echo " 4)= >> Create TRial XRay XTLS Accounts                              ║"
echo "║ 5.Create TRial XRay GRPC Accounts                              ║"
echo "║ 6.Create TRial V2Ray Vmess Websocket                           ║"
echo "║ 7.Create TRial V2Ray Vless Websocket                           ║"
echo "║ 8.Create Trial V2Ray Trojan                                    ║"
echo "║ 9.Create TRial ShadowsocksR                                    ║"
echo "║ 10.Create TRial Shadowsocks                                    ║"
echo "║ 11.Create TRial SSTP Accounts                                  ║"
echo "║ 12.Create TRial PPTP Accounts                                  ║"
echo "║ 13.Create TRial L2TP Accounts                                  ║"
echo "║  x.Exit                                                        ║"                                                  
echo "╚════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-20] :  " menu
case $menu in 
1)
trialxvmess
;;
2)
trialxvless
;;
3)
trialxtrojan
;;
4)
trialxtls
;;
5)
trialgrpc
;;
6)
trialvmess 
;;
7)
trialvless
;;
8)
trialtrojan
;;
9)
trialssr
;;
10)
trialss
;;
11)
trialsstp
;;
12)
trialpptp
;;
13)
triall2tp
;;
x)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac



