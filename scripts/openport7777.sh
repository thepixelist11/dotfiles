#!/bin/bash

sudo iptables -A INPUT -p tcp --dport 7777 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 7777 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 7777 -j ACCEPT
sudo iptables -A OUTPUT -p udp --sport 7777 -j ACCEPT
sudo iptables-save > /etc/iptables/iptables.rules
sudo systemctl start iptables
