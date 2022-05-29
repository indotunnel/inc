#!/bin/bash
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
clear
echo "          ┃ RUNNING MENU ┃        " | lolcat
echo " ************************** " | lolcat
echo ""
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH               : SSH Service is "$green"running"$NC""
else
echo -e " SSh               : SSH Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Stunnel4          : Stunnel4 Service is "$green"running"$NC""
else
echo -e " Stunnel4          : Stunnel4 Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " DropBear          : DropBear Service is "$green"running"$NC""
else
echo -e " DropBear          : DropBear Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Non TLS     : V2ray Non TLS Service is "$green"running"$NC""
else
echo -e " V2ray Non TLS     : V2ray Non TLS Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray TLS         : V2ray TLS Service is "$green"running"$NC""
else
echo -e " V2ray TLS         : V2ray TLS Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Vless TLS         : Vless TLS Service is "$green"running"$NC""
else
echo -e " Vless TLS         : Vless TLS Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Vless Non TLS     : Vless Non TLS Service is "$green"running"$NC""
else
echo -e " Vless Non TLS     : Vless Non TLS Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show trojan --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Trojan            : Trojan Service is "$green"running"$NC""
else
echo -e " Trojan            : Trojan Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Squid             : Squid Service is "$green"running"$NC""
else
echo -e " Squid             : Squid Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show openvpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Openvpn           : Openvpn Service is "$green"running"$NC""
else
echo -e " Openvpn           : Openvpn Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show wg-quick@wg0 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Wireguard         : Wireguard Service is "$green"running"$NC""
else
echo -e " Wireguard         : Wireguard Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show shadowsocks-libev.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Shadowsocks       : Shadowsocks Service is "$green"running"$NC""
else
echo -e " Shadowsocks       : Shadowsocks Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ssrmu --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSR               : SSR Service is "$green"running"$NC""
else
echo -e " SSR               : SSR Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show websocket.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " websocket         : websocket Service is "$green"running"$NC""
else
echo -e " websocket         : websocket Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ws-ovpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ws-ovpn           : ws-ovpn Service is "$green"running"$NC""
else
echo -e " ws-ovpn           : ws-ovpn Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ws-stunnel.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ws-stunnel        : ws-stunnel Service is "$green"running"$NC""
else
echo -e " ws-stunnel        : ws-stunnel Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx             : Nginx Service is "$green"running"$NC""
else
echo -e " Nginx             : Nginx Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xr-vm-tls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " xr-vm-tls         : xr-vm-tls Service is "$green"running"$NC""
else
echo -e " xr-vm-tls         : xr-vm-tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xr-vm-ntls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " xr-vm-ntls        : xr-vm-ntls Service is "$green"running"$NC""
else
echo -e " xr-vm-ntls        : xr-vm-ntls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xr-vm-mk.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " xr-vm-mk          : xr-vm-mk Service is "$green"running"$NC""
else
echo -e " xr-vm-mk          : xr-vm-mk Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xr-vl-tls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " xr-vl-tls         : xr-vl-tls Service is "$green"running"$NC""
else
echo -e " xr-vl-tls         : xr-vl-tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xr-vl-ntls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " xr-vl-ntls        : xr-vl-ntls Service is "$green"running"$NC""
else
echo -e " xr-vl-ntls        : xr-vl-ntls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xtls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " xtls              : xtls Service is "$green"running"$NC""
else
echo -e " xtls              : xtls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show x-tr.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " x-tr              : x-tr Service is "$green"running"$NC""
else
echo -e " x-tr              : x-tr Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show vmess-grpc.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " vmess-grpc        : vmess-grpc Service is "$green"running"$NC""
else
echo -e " vmess-grpc        : vmess-grpc Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " vless-grpc        : vless-grpc Service is "$green"running"$NC""
else
echo -e " vless-grpc        : vless-grpc Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show trojan-go.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " trojan-go         : trojan-go Service is "$green"running"$NC""
else
echo -e " trojan-go         : trojan-go Service is "$red"not running (Error)"$NC""
fi
