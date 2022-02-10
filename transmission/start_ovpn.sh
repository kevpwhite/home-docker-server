#!/bin/sh
route add -net 10.10.10.0 netmask 255.255.255.0 gw 172.21.0.1 #Adds the local LAN to route to the container so the web url works. 

#Note: you need to add ca /usr/app/ca.ipvanish.com.crt to all the ipvanish-US-Los-Angeles-lax..... files or the docker image will look for certs in /etc/openvpn/...
openvpn --config /usr/app/ipvanish-US-Los-Angeles-lax-a06.ovpn --auth-user-pass /usr/app/.ipvlogin
