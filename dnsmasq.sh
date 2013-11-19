#!/bin/sh
echo -e "\E[33;40m[*] Checking if dnsmasq is installed.\e[0m"
if [ -f /etc/dnsmasq.conf ];  then
	echo -e "\E[32;40m dnsmasq is installed!!! \e[0m"
	sleep 1
	echo -e "\E[32;40m Checking the dnsmasq config \e[0m"
	TEST=`grep ads.dnsmasq.conf /etc/dnsmasq.conf`
	if [ "$TEST" != "conf-file=/etc/ads.dnsmasq.conf" ]; then
		echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -o  /etc/ads.dnsmasq.conf  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext"
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m Done! \e[0m"
		exit 1
	else 
		echo -e "\E[32;40m[*] This is your first time running this script! [*]\e[0m"
		echo "conf-file=/etc/ads.dnsmasq.conf" >> /etc/dnsmasq.conf
		sleep 1
		echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -o  /etc/ads.dnsmasq.conf  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext"
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m Done! \e[0m"
		exit 1
else 
	echo -e "\e[0;31m dnsmasq is not installed or missing \e[0m"
	exit 1
fi
