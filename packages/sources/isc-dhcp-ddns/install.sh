#!/bin/sh
# isc-dhcp-ddns package
# install script

# Debian recommended: dnsmasq

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='isc-dhcp-ddns'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if installed
if [ -e /usr/local/sbin/isc-dhcp-ddns4.sh ] || [ -e /usr/local/sbin/isc-dhcp-ddns6.sh ]; then
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

# Install - /usr/local/sbin
cd /usr/local/sbin
for i in isc-dhcp-ddns4.sh isc-dhcp-ddns6.sh; do
	echo -n '[ln] sbin/'"${i}"' /usr/local/sbin'
		ln -s ${PACKAGE_DIR}/sbin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Notification
echo ''
echo ' ! Configure isc-dhcp-server events'

echo ''
exit 0
