# Miscellaneous scripts, configs and OS tweaks
Install this package as last.

### Scripts
* `apt-check` (not mine, source lost [maybe from ubuntu forum or askubuntu])
* [DEPRECATED] `ntpdate-daemon.sh` -> first wait for internet connection and then synchronize
* `set-zram.sh` -> enable or disable zram swap
* [DEPRECATED] `system-autoupdate.sh` -> run `apt-get update` every `n` hours (default `n`==20)

### Extras
* [DEPRECATED] acpid-mods
* dnsmasq config
* notify-daemon scripts
* rc.local scripts and tweaks

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
