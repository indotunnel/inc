#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                       ┃ Bot Panel Menu ┃                        ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create Bot Configuration                                      ║"
echo "║ 2.Delete Bot Configuration                                      ║"
echo "║ 3.Restart Bot Services                                          ║"
echo "║ 4.Exit                                                          ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-4] :  " menu
case $menu in 
1)
addbbt
;;
2)
delbbt
;;
3)
systemctl restart bbt 
menu
;;
4)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
