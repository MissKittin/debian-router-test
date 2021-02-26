#!/bin/sh
# dnsmasq config
# install script

# Debian dependencies: dnsmasq

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='dnsmasq'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check installed packages
if [ ! -e /usr/sbin/dnsmasq ]; then
	echo 'dnsmasq debian package not installed'
	exit 1
fi

# Check environment
if [ -e /usr/local/etc/dnsmasq.d ]; then
	echo 'directory /usr/local/etc/dnsmasq.d not exists'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/dnsmasq.d' ] || [ -e '/etc/dnsmasq.d/dns-cache.conf' ] || [ -e '/etc/dnsmasq.d/pxe.conf' ] || [ -e '/etc/dnsmasq.d/security.conf' ]; then
	echo 'Already installed'
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

# Install - /usr/local/etc/dnsmasq.d
cd /usr/local/etc/dnsmasq.d
for i in dns-cache.conf pxe.conf security.conf; do
	echo -n "[ln] ${i} /usr/local/etc/dnsmasq.d"
		ln -s ${PACKAGE_DIR}/etc/dnsmasq.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc/dnsmasq.d
if cd /etc/dnsmasq.d > /dev/null 2>&1; then
	for i in dns-cache.conf pxe.conf security.conf; do
		echo -n "[ln] /usr/local/etc/dnsmasq.d/${i} /etc/dnsmasq.d"
			ln -s /usr/local/etc/dnsmasq.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	done
else
	echo '[!!] /etc/dnsmasq.d [Fail]'
fi

echo ''
exit 0
