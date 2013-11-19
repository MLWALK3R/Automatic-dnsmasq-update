Automatic-dnsmasq-update
========================

Automatic-dnsmasq-update


This script will auto update your list for pgl.yoyo.org.

========================
Make sure you are running as root & have curl installed.

========================

This will add the list to your dnsmasq config so it can start hijacking the address.
```bash
echo "conf-file=/etc/ads.dnsmasq.conf" >> /etc/dnsmasq.conf
```

```bash
curl -o  dnsmasq.sh  https://raw.github.com/MLWALK3R/Automatic-dnsmasq-update/master/dnsmasq.sh  | chmod +x dnsmasq.sh | ./dnsmasq.sh
```
========================

```bash
nano /etc/cron.d/bindupdate
```

This will run it every monday every week until the END!!!


```bash
#minute (0-59)
#|   hour (0-23)
#|   |    day of the month (1-31)
#|   |    |   month of the year (1-12 or Jan-Dec)
#|   |    |   |   day of the week (0-6 with 0=Sun or Sun-Sat)
#|   |    |   |   |   commands
#|   |    |   |   |   |
#### refresh bind anti-ad server list
 15   7   *  *   1   /3 /etc/bind/bindupdate.sh>> /dev/null 2>&1
 ```
