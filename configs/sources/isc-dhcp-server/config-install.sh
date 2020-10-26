#!/bin/sh
# isc-dhcp-server config
# install script

# Debian dependencies: isc-dhcp-server

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='isc-dhcp-server'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e '/usr/local/etc/default' ]; then
	echo '/usr/local/etc/default not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ -e '/etc/default/isc-dhcp-server.old' ] || [ -e '/etc/dhcp/dhcpd.conf.old' ]; then
	echo 'Backup files found'
	exit 1
fi

# Check installed packages
if [ ! -e '/etc/init.d/isc-dhcp-server' ]; then
	echo 'isc-dhcp-server debian package not installed'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/etc/dhcp' ] || [ -e '/usr/local/etc/default/isc-dhcp-server' ] || [ -e '/etc/default/isc-dhcp-server.old' ]; then
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

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/dhcp /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/dhcp . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/default
cd /usr/local/etc/default
echo -n '[ln] etc/default/isc-dhcp-server /usr/local/etc/default'
	ln -s ${PACKAGE_DIR}/etc/default/isc-dhcp-server . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/default
cd /etc/default
echo -n '[mv] /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.old'
	mv ./isc-dhcp-server ./isc-dhcp-server.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/default/isc-dhcp-server /etc/default'
	ln -s /usr/local/etc/default/isc-dhcp-server . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/dhcp
cd /etc/dhcp
echo -n '[mv] /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.old'
	mv ./dhcpd.conf ./dhcpd.conf.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/dhcp/dhcpd.conf /etc/dhcp'
	ln -s /usr/local/etc/dhcp/dhcpd.conf . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
