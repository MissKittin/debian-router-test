# Miscellaneous scripts, configs and OS tweaks
Install this package as last.

### Scripts
* apt-check (not mine, source lost [maybe from ubuntu forum or askubuntu])
* generate-ddns-hosts.sh -> bridge beetwen isc-dhcp-server and dnsmasq's dns
* [DEPRECATED] ntpdate-daemon.sh -> first wait for internet connection and then synchronize
* set-zram.sh -> enable or disable zram swap
* [DEPRECATED] system-autoupdate.sh -> run `apt-get update` every `n` hours (default `n`==20)

### Extras
* [DEPRECATED] acpid-mods
* dnsmasq config
* notify-daemon scripts
* rc.local scripts and tweaks

## generate-ddns-hosts.sh
add to `dhcpd.conf`:
```
on commit {
	set ClientNum = binary-to-ascii(10, 8, ".", leased-address);
	set ClientMac = binary-to-ascii(16, 8, ":", substring(hardware, 1, 6));
	set ClientHost = pick-first-value( 
		host-decl-name,
		option fqdn.hostname,
		option host-name,
		"none");
	execute("/usr/local/sbin/generate-ddns-hosts.sh", "ddns_hosts_file=/var/tmp/.ddns-hosts", "lan_domain=.local", "action=commit", "ip=",ClientNum, "mac=",ClientMac, "hostname=",ClientHost);
}
```
add to dnsmasq config (or install extras):
```
# LAN DDNS configuration
addn-hosts=/var/tmp/.ddns-hosts
```

## Deprecated files
* sbin/ntpdate-daemon.sh
* extras/etc/acpid-suspend/post_suspend.d/S99ntpdate-daemon.rc
* extras/etc/rc.local.d/PKx_ntpdate.rc
* sbin/system-autoupdate.sh
* extras/etc/notify-daemon/events.rc.d/apt.rc
* extras/etc/notify-daemon/events.rc.d/system-autoupdate.rc
* extras/etc/rc.local.d/PKx_autoupdate.rc
* sbin/correct-wake-on-lan.sh
* extras/etc/acpid-suspend/post_suspend.d/S99correct-wake-on-lan.rc
* extras/etc/rc.local.d/PKx_correct-wake-on-lan.rc
