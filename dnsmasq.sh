#!/bin/sh
	echo -e "\E[33;40m[*] Checking if dnsmasq is installed.\e[0m"
	if [ -f /etc/dnsmasq.conf ]; then
	echo -e "\E[32;40m dnsmasq is installed \e[0m"
	sleep 1
	echo -e "\E[33;40m[*] Checking the dnsmasq.d folder [*]\e[0m"
    if [ -f /etc/dnsmasq.d/ads.dnsmasq.conf  ];  then
    	echo -e "\E[32;40m[*] Check done [*]\e[0m" 
		echo -e "\E[33;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -s "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext" > /etc/dnsmasq.d/ads.dnsmasq.conf
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m[*] updated ad list [*]\e[0m"
	else 
		echo -e "\E[32;40m[*] Check done [*]\e[0m" 
		echo -e "\E[32;40m[*] This is your first time running this script! [*]\e[0m"
		sleep 1
		echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -s "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext" > /etc/dnsmasq.d/ads.dnsmasq.conf
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m[*] Update done [*]\e[0m"
		
		fi
else 
	echo -e "\e[0;31m dnsmasq is not installed or missing \e[0m"
	exit 1
	fi

if [ -f /etc/cron.d/dnsmasq.cron ]; then
	echo -e "\E[32;40m Cron already installed \e[0m"
	echo -e "\E[32;40m Finished Script \e[0m"
else
	read -p "Add to Cron? . (y/n) " REPLY
	if [ "$REPLY" = "y" ]; then
		echo -e "\E[33;40m[*] Adding Cron task [*]\e[0m"
		curl -s "https://raw.githubusercontent.com/MLWALK3R/Automatic-dnsmasq-update/master/dnsmasq.cron" > /etc/cron.d/dnsmasq.cron
		echo -e "\E[32;40m[*] Done [*]\e[0m"
		exit 1
 	else
		echo -e "\E[32;40m Ok have it your way \e[0m"
		exit 1

  fi
fi
