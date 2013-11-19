Automatic-dnsmasq-update
========================

Automatic-dnsmasq-update

This script will auto update your list for pgl.yoyo.org.

If you find any errors, please submit a pull request so we can get it sorted out.

========================
Make sure you are running as root & have curl installed, this script will install a cron to run every monday.

========================

without downloading # Prefered method.
```bash
curl -s https://raw.github.com/MLWALK3R/Automatic-dnsmasq-update/master/dnsmasq.sh  | bash
```

Download * You will need to set permissions to run it. 

```bash
curl -o  dnsmasq.sh  https://raw.github.com/MLWALK3R/Automatic-dnsmasq-update/master/dnsmasq.sh
```
