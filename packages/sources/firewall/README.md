# firewall
Simple wrapper for *tables.  
  
Functions:
* IPv4 iptables firewall/port forwarding/routing
* IPv6 ip6tables firewall/routing

Extensions:
* IP ipset blacklist
* MAC ebtables banlist

Extras:
* Status checking rule for notify-daemon (deprecated)
* Webadmin modules

### Configuration files
* `firewall.rc.d` -> extensions imported by `firewall.rc` for default rules/ruleset automation
* `firewall.rc.cfg.d` -> extensions configs
* `firewall.rc` -> define input/output rules
* `forwarding.rc` -> define forwarded ports
* `networks.rc` -> assign interfaces to variables
* `routing.rc` -> define routing rules
* `settings.rc` -> paths, firewall.sh config etc

### Deprecated files
* sbin/permanently-banned.sh
* etc/rc.local.d/PKx_permanently-banned.rc
* extras/etc/notify-daemon/events.rc.d/firewall.rc
* extras/etc/notify-daemon/events.rc.d/firewall6.rc
* extras/etc/notify-daemon/events.rc.d/default_gateway.rc
* extras/etc/notify-daemon/events.rc.d/routing.rc
* webadmin/net-forwarding
* webadmin/lib/shell/list-iptables-settings.rc
