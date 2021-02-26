#!/bin/sh
# localdns package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='localdns'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/dnsmasq.d
echo -n '/usr/local/etc/dnsmasq.d/localdns.conf'
	if [ -L /usr/local/etc/dnsmasq.d/localdns.conf ] && [ -e /usr/local/etc/dnsmasq.d/localdns.conf ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /etc/dnsmasq.d
echo -n '/etc/dnsmasq.d/localdns.conf'
	if [ -L /etc/dnsmasq.d/localdns.conf ] && [ -e /etc/dnsmasq.d/localdns.conf ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
