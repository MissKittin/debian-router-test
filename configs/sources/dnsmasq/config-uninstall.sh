#!/bin/sh
# dnsmasq config
# uninstall script

# Settings
PACKAGE_NAME='dnsmasq'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if installed
if [ ! -e '/usr/local/etc/dnsmasq' ] || [ ! -e '/etc/dnsmasq.d/dns-cache.conf' ] || [ ! -e '/etc/dnsmasq.d/pxe.conf' ] || [ ! -e '/etc/dnsmasq.d/security.conf' ]; then
	echo 'Not installed'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc/dnsmasq.d
for i in dns-cache.conf pxe.conf security.conf; do
	echo -n "[rm] /usr/local/etc/dnsmasq.d/${i}"
		rm /usr/local/etc/dnsmasq.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/dnsmasq.d
for i in dns-cache.conf pxe.conf security.conf; do
	echo -n "[rm] /etc/dnsmasq.d/${i}"
		rm /etc/dnsmasq.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

echo ''
exit 0
