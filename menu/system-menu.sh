#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                        ┃ System MENU ┃                          ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Add Or Change Subdomain Host For VPS                          ║"
echo "║ 2.Change Port Of Some Service                                   ║"
echo "║ 3.Autobackup Data VPS                                           ║"
echo "║ 4.Backup Data VPS                                               ║"
echo "║ 5.Restore Data VPS                                              ║"
echo "║ 6.Webmin Menu                                                   ║"
echo "║ 7.Limit Bandwith Speed Server                                   ║"
echo "║ 8.Speedtest Server                                              ║"
echo "║ 9.Reboot VPS                                                    ║"
echo "║ 10.Exit Menu                                                    ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-10 or x] :  " menu
case $menu in 
1)
addhost
;;
2)
changeport
;;
3)
autobackup
;;
4)
backup
;;
5)
restore
;;
6)
wbmn
;;
7)
limitspeed
;;
8)
speedtest
;;
9)
reboot
;;
10)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
