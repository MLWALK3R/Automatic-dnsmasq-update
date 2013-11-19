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
curl -s URL HERE | bash
```
========================