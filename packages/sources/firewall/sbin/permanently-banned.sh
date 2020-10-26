#!/bin/sh
# Auto perm ban
# 10.08.2019
# Insert mode 26.05.2020
# Removed iptables 02.06.2020
# This script is not used anymore

CONFIG='/usr/local/etc/permanently-banned.rc'
#iptables='iptables'
#ip6tables='ip6tables'
ebtables='ebtables'

insert_mode='-I'
[ "$2" = '--mode=append' ] && insert_mode='-A'
print_S1()
{
	echo -n "$1"
}

case $1 in
	'enable')
		cat $CONFIG | while read line; do
			if [ ! $(print_S1 $line) = '#' ]; then
#				# WAN & Router IPv4
#				$iptables $insert_mode INPUT -m mac --mac-source $(print_S1 $line) -j REJECT
#				$iptables $insert_mode FORWARD -m mac --mac-source $(print_S1 $line) -j REJECT
#				# WAN & Router IPv6
#				$ip6tables $insert_mode INPUT -m mac --mac-source $(print_S1 $line) -j REJECT
#				$ip6tables $insert_mode FORWARD -m mac --mac-source $(print_S1 $line) -j REJECT
				# LAN
				$ebtables $insert_mode FORWARD -s $(print_S1 $line) -j DROP
				$ebtables $insert_mode INPUT -s $(print_S1 $line) -j DROP # replaces iptables rules
			fi
		done
	;;
	'disable')
		cat $CONFIG | while read line; do
			if [ ! $(print_S1 $line) = '#' ]; then
#				# WAN & Router IPv4
#				$iptables -D INPUT -m mac --mac-source $(print_S1 $line) -j REJECT
#				$iptables -D FORWARD -m mac --mac-source $(print_S1 $line) -j REJECT
#				# WAN & Router IPv6
#				$ip6tables -D INPUT -m mac --mac-source $(print_S1 $line) -j REJECT
#				$ip6tables -D FORWARD -m mac --mac-source $(print_S1 $line) -j REJECT
				# LAN
				$ebtables -D FORWARD -s $(print_S1 $line) -j DROP
				$ebtables -D INPUT -s $(print_S1 $line) -j DROP # replaces iptables rules
			fi
		done
	;;
	'flush-ebtables')
		$ebtables -t filter -P INPUT ACCEPT
		$ebtables -t filter -P FORWARD ACCEPT
		$ebtables -t filter -P OUTPUT ACCEPT
		$ebtables -t nat -P PREROUTING ACCEPT
		$ebtables -t nat -P OUTPUT ACCEPT
		$ebtables -t nat -P POSTROUTING ACCEPT
		$ebtables -t broute -P BROUTING ACCEPT
		$ebtables -t filter -F
		$ebtables -t nat -F
		$ebtables -t broute -F
		$ebtables -t filter -X
		$ebtables -t nat -X
		$ebtables -t broute -X
	;;
	*)
		echo 'Auto perm ban'
		echo " Config file: $CONFIG"
		echo " usage: $0 enable | disable"
	;;
esac

exit 0
##################################################################
### etc/firewall/firewall.rc.d/permanently-banned.rc:
# Flush ebtables
/usr/local/sbin/permanently-banned.sh flush-ebtables

# Exec permanently-banned.sh from firewall.sh
/usr/local/sbin/permanently-banned.sh enable --mode=append
