#!/bin/sh
# dnsmasq config
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='dnsmasq'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/dnsmasq.d'
	if [ -L '/usr/local/etc/dnsmasq.d' ] && [ -e '/usr/local/etc/dnsmasq.d' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/dnsmasq.d
for i in dns-cache.conf pxe.conf security.conf; do
	echo -n "/etc/dnsmasq.d/${i}"
		if [ -L "/etc/dnsmasq.d/${i}" ] && [ -e "/etc/dnsmasq.d/${i}" ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# Notify
echo ''
if $broken && $installed; then
	echo ' Config package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Config package is installed'
	exit 0
else
	echo ' Config package is not installed'
	exit 1
fi
