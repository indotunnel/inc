#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                   ┃ SSTP / PPTP / L2TP MENU ┃                   ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create Account L2TP                                           ║"
echo "║ 2.Create Account PPTP                                           ║"
echo "║ 3.Create Account SSTP                                           ║"
echo "║ 4.Delete Account L2TP                                           ║"
echo "║ 5.Delete Account PPTP                                           ║"
echo "║ 6.Delete Account SSTP                                           ║"
echo "║ 7.Renews Account L2TP                                           ║"
echo "║ 8.Renews Account SSTP                                           ║"
echo "║ 9.Renews Account PPTP                                           ║"
echo "║ 10.Exit Menu                                                    ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-10 or x] :  " menu
case $menu in 
1)
addl2tp
;;
2)
addpptp
;;
3)
addsstp
;;
4)
dell2tp
;;
5)
delpptp
;;
6)
delsstp
;;
7)
renewl2tp
;;
8)
renewsstp
;;
9)
renewpptp
;;
10)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
