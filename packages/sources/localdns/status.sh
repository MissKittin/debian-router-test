#!/bin/sh
# localdns package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='localdns'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/hosts.d'
	if [ -L /usr/local/etc/hosts.d ] && [ -e /usr/local/etc/hosts.d ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/dc_dnsmasq-hosts-build'
	if [ -L /usr/local/etc/init.d/dc_dnsmasq-hosts-build ] && [ -e /usr/local/etc/init.d/dc_dnsmasq-hosts-build ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/dc_dnsmasq-hosts-build'
	if [ -L /etc/init.d/dc_dnsmasq-hosts-build ] && [ -e /etc/init.d/dc_dnsmasq-hosts-build ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/generate-dns-hosts.sh'
	if [ -L /usr/local/sbin/generate-dns-hosts.sh ] && [ -e /usr/local/sbin/generate-dns-hosts.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
