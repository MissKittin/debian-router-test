#!/bin/sh
# isc-dhcp-ddns package
# extras install script

# Settings
PACKAGE_NAME='isc-dhcp-ddns'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc/dnsmasq.d
for i in ddns4.conf ddns6.conf; do
	echo -n "[rm] /usr/local/etc/dnsmasq.d/${i}"
		rm /usr/local/etc/dnsmasq.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/dnsmasq.d
for i in ddns4.conf ddns6.conf; do
	echo -n "[rm] /etc/dnsmasq.d/${i}"
		rm /etc/dnsmasq.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
