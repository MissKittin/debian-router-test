#!/bin/sh
# isc-dhcp-server config
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='isc-dhcp-server'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/dhcp'
	if [ -L '/usr/local/etc/dhcp' ] && [ -e '/usr/local/etc/dhcp' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/default
echo -n '/usr/local/etc/default/isc-dhcp-server'
	if [ -L '/usr/local/etc/default/isc-dhcp-server' ] && [ -e '/usr/local/etc/default/isc-dhcp-server' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/default
echo -n '/etc/default/isc-dhcp-server'
	if [ -L '/etc/default/isc-dhcp-server' ] && [ -e '/etc/default/isc-dhcp-server' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/dhcp
echo -n '/etc/dhcp/dhcpd.conf'
	if [ -L '/etc/dhcp/dhcpd.conf' ] && [ -e '/etc/dhcp/dhcpd.conf' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Config package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Config package is installed'
	exit 0
else
	echo ' Config package is not installed'
	exit 1
fi
