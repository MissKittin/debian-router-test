#!/bin/sh
# isc-dhcp-ddns package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='isc-dhcp-ddns'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/dnsmasq.d
for i in ddns4.conf ddns6.conf; do
	echo -n "/usr/local/etc/dnsmasq.d/${i}"
		if [ -L /usr/local/etc/dnsmasq.d/${i} ] && [ -e /usr/local/etc/dnsmasq.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /etc/dnsmasq.d
for i in ddns4.conf ddns6.conf; do
	echo -n "/etc/dnsmasq.d/${i}"
		if [ -L /etc/dnsmasq.d/${i} ] && [ -e /etc/dnsmasq.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

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
