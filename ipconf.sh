#!/bin/bash

# config: /etc/hostname
echo "Please enter the hostname"
read host
echo "Please enter the ip address"
read ipadd
echo "$host.localdomain" > hostname

yum install rsync -y
yum install nano -y

#Check and then disable firewall:
systemctl status firewalld
systemctl disable firewalld
systemctl stop firewalld
systemctl status firewalld


echo 'TYPE="Ethernet"' > /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'PROXY_METHOD="none"' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'BROWSER_ONLY="no"' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'NAME="eth0"' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'DEVICE="eth0"' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'ONBOOT="yes"' >> /etc/sysconfig/network-scripts/ifcfg-eth0
TYPE=Ethernet

# Static IP Address #
echo "BOOTPROTO=static" >> /etc/sysconfig/network-scripts/ifcfg-eth0
# Server IP #
echo "IPADDR=$ipadd"  >> /etc/sysconfig/network-scripts/ifcfg-eth0
# Netmask #
echo "NETMASK=255.255.255.0" >> /etc/sysconfig/network-scripts/ifcfg-eth0
# Default Gateway IP #
echo "GATEWAY=10.12.2.1" >> /etc/sysconfig/network-scripts/ifcfg-eth0
# DNS Servers #
echo "DNS1=8.8.8.8" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "DEFROUTE=yes" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "IPV4_FAILURE_FATAL=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
# Disable ipv6 #
echo "IPV6INIT=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0

#UUID
