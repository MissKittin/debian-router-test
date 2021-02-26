#!/bin/sh
# isc-dhcp-ddns package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='isc-dhcp-ddns'

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
	for i in ddns4.conf ddns6.conf; do
		echo -n "[ln] extras/etc/dnsmasq.d/${i} /usr/local/etc/dnsmasq.d"
			ln -s ${PACKAGE_DIR}/extras/etc/dnsmasq.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	done

	# Install - /etc/dnsmasq.d
	if cd /etc/dnsmasq.d > /dev/null 2>&1; then
		for i in ddns4.conf ddns6.conf; do
			echo -n "[ln] /usr/local/etc/dnsmasq.d/${i} /etc/dnsmasq.d"
				ln -s /usr/local/etc/dnsmasq.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		done
	else
		echo 'Install dnsmasq'
	fi
else
	echo 'Create /usr/local/etc/dnsmasq.d directory'
fi

echo ''
exit 0
