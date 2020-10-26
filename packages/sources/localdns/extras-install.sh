#!/bin/sh
# localdns package
# extras install script

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

# Install - /usr/local/etc/dnsmasq.d
if cd /usr/local/etc/dnsmasq.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/dnsmasq.d/dns.conf /usr/local/etc/dnsmasq.d'
		ln -s ${PACKAGE_DIR}/extras/etc/dnsmasq.d/dns.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

	# Install - /etc/dnsmasq.d
	if cd /etc/dnsmasq.d > /dev/null 2>&1; then
		echo -n '[ln] /usr/local/etc/dnsmasq.d/dns.conf /etc/dnsmasq.d'
			ln -s /usr/local/etc/dnsmasq.d/dns.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo 'Install dnsmasq'
	fi
else
	echo 'Create /usr/local/etc/dnsmasq.d directory'
fi

echo ''
exit 0
