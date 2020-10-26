#!/bin/sh
# isc-dhcp-server config
# uninstall script

# Settings
PACKAGE_NAME='isc-dhcp-server'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e '/etc/default/isc-dhcp-server.old' ] || [ ! -e '/etc/dhcp/dhcpd.conf.old' ]; then
	echo 'Backup files not found'
	exit 1
fi

# Check if installed
if [ ! -e '/usr/local/etc/dhcp' ] || [ ! -e '/usr/local/etc/default/isc-dhcp-server' ] || [ ! -e '/etc/default/isc-dhcp-server.old' ]; then
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

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/dhcp'
	rm /usr/local/etc/dhcp > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/default
echo -n '[rm] /usr/local/etc/default/isc-dhcp-server'
	rm /usr/local/etc/default/isc-dhcp-server > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/default
echo -n '[rm] /etc/default/isc-dhcp-server'
	rm /etc/default/isc-dhcp-server > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/default/isc-dhcp-server.old /etc/default/isc-dhcp-server'
	mv /etc/default/isc-dhcp-server.old /etc/default/isc-dhcp-server > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/dhcp
echo -n '[rm] /etc/dhcp/dhcpd.conf'
	rm /etc/dhcp/dhcpd.conf > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/dhcp/dhcpd.conf.old /etc/dhcp/dhcpd.conf'
	mv /etc/dhcp/dhcpd.conf.old /etc/dhcp/dhcpd.conf > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
