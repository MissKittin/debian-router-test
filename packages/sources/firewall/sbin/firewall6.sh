#!/bin/bash
### Firewall6 starter
### 29.01.2019, 18.02.2019
### 05.09.2019
### 25.05.2020 added --numeric to speedup listing
### 07.09.2020 'stop' action

# Where am I?
SETTINGS='/usr/local/etc/firewall6'

# Print settings dir
if [ "$1" = 'where-are-you' ]; then
	echo -n "$SETTINGS"
	exit 0
fi

# Import settings
. ${SETTINGS}/settings.rc

# Get firewall status
if [ "$1" = 'status' ]; then
	parse_firewall_line()
	{
		[ "$1" = '' ] && return
		[ "$1" = '#' ] && return
		[[ ${1:0:1} == '#' ]] && return

		[ "$2" = '-A' ] && return
		[ "$3" = 'nat' ] && return

		if [ "$2" = '-P' ]; then
			case $3 in
				'INPUT')
					[ "$INPUT_POLICY" = "$4" ] || touch /tmp/.firewall_not_loaded
				;;
				'OUTPUT')
					[ "$OUTPUT_POLICY" = "$4" ] || touch /tmp/.firewall_not_loaded
				;;
			esac
		fi
	}

	INPUT_POLICY=`$iptables --list --numeric | grep 'Chain' | grep 'INPUT' | awk '{print $4}' | tr -d ')'`
	OUTPUT_POLICY=`$iptables --list --numeric  | grep 'Chain' | grep 'OUTPUT' | awk '{print $4}' | tr -d ')'`

	cat ${status_firewall} | while read line; do
		parse_firewall_line $line
	done

	if [ -e /tmp/.firewall_not_loaded ]; then
		rm /tmp/.firewall_not_loaded
		exit 1
	fi

	exit 0
fi

# Reset iptables
$iptables -t filter -P INPUT ACCEPT
$iptables -t filter -P FORWARD ACCEPT
$iptables -t filter -P OUTPUT ACCEPT
$iptables -t nat -P PREROUTING ACCEPT
$iptables -t nat -P INPUT ACCEPT
$iptables -t nat -P OUTPUT ACCEPT
$iptables -t nat -P POSTROUTING ACCEPT
$iptables -t mangle -P PREROUTING ACCEPT
$iptables -t mangle -P INPUT ACCEPT
$iptables -t mangle -P FORWARD ACCEPT
$iptables -t mangle -P OUTPUT ACCEPT
$iptables -t mangle -P POSTROUTING ACCEPT
$iptables -t raw -P PREROUTING ACCEPT
$iptables -t raw -P OUTPUT ACCEPT
$iptables -t filter -F
$iptables -t nat -F
$iptables -t mangle -F
$iptables -t raw -F
$iptables -t filter -X
$iptables -t nat -X
$iptables -t mangle -X
$iptables -t raw -X

# 'stop' action
[ "${1}" = 'stop' ] && exit 0

# Loopback must be excluded
$iptables -A INPUT -i lo -j ACCEPT
$iptables -A OUTPUT -o lo -j ACCEPT
$iptables -A FORWARD -i lo -j ACCEPT

# Import config files
for i in $config_files; do
	. ${SETTINGS}/$i
done

exit 0
