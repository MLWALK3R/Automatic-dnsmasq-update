#!/bin/sh
echo -e "\E[33;40m[*] Checking if you're running an Edgemax device.\e[0m"
if [ -f /config/config.boot ]; then
	echo -e "Edge router detected"
	echo -e "\E[33;40m[*] Checking if dnsmasq is installed.\e[0m"
    TEST=` find /etc/dnsmasq.d `
if [ "$TEST" != "/etc/dnsmasq.d" ]; then
	echo -e "Installed/found"
        sleep 1
		echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -o -s /etc/dnsmasq.d/ads.dnsmasq.conf  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext"
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m Done! \e[0m"
		exit 1
		 else
	echo -e "\e[0;31m dnsmasq is not installed or missing \e[0m"
	exit 1
	fi
	else

echo -e "\E[33;40m[*] Checking if dnsmasq is installed.\e[0m"
 if [ -f /etc/dnsmasq.conf ]; then
	echo -e "\E[32;40m dnsmasq is installed \e[0m"
	sleep 1
	echo -e "\E[33;40m[*] Checking the dnsmasq config [*]\e[0m"
	TEST=`grep ads.dnsmasq.conf /etc/dnsmasq.conf`
	if [ "$TEST" != "conf-file=/etc/ads.dnsmasq.conf" ]; then
		echo -e "\E[32;40m[*] This is your first time running this script! [*]\e[0m"
		echo "conf-file=/etc/ads.dnsmasq.conf" >> /etc/dnsmasq.conf
		sleep 1
		echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -o -s /etc/ads.dnsmasq.conf  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext"
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m Done! \e[0m"
	else 
		echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
		sleep 2
		curl -o -s /etc/ads.dnsmasq.conf  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro0&mimetype=plaintext"
		echo -e "reloading dnsmasq"
		/etc/init.d/dnsmasq restart
		echo -e "\E[32;40m updated ad list \e[0m"
		fi
else 
	echo -e "\e[0;31m dnsmasq is not installed or missing \e[0m"
	exit 1
	fi

if [ -f /etc/cron.d/dnsmasq.cron ]; then
	echo -e "\E[32;40m Already added to Cron \e[0m"
	echo -e "\E[32;40m Finished Script \e[0m"
else
	read -p "Add to Cron? . (y/n) " REPLY
	if [ $REPLY = "y" ]; then
		echo -e "\E[33;40m[*] Adding Cron task [*]\e[0m"
		touch /etc/cron.d/dnsmasq.cron
		curl -o -s /etc/cron.d/dnsmasq.cron "https://raw.github.com/MLWALK3R/Automatic-dnsmasq-update/master/dnsmasq.cron"
		exit 1
	else
		echo -e "\E[32;40m Ok have it your way \e[0m"
		exit 1
  fi
fi
fi