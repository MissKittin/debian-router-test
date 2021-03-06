#!/bin/sh
# localdns package
# extras uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='localdns'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
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
echo -n '[rm] /usr/local/etc/dnsmasq.d/localdns.conf'
	rm /usr/local/etc/dnsmasq.d/localdns.conf > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/dnsmasq.d
echo -n '[rm] /etc/dnsmasq.d/localdns.conf'
	rm /etc/dnsmasq.d/localdns.conf > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
