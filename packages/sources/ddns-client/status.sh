#!/bin/sh
# ddns-client package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='ddns-client'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/ddns-client.rc'
	if [ -L /usr/local/etc/ddns-client.rc ] && [ -e /usr/local/etc/ddns-client.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/ddns-client.sh'
	if [ -L /usr/local/etc/init.d/ddns-client.sh ] && [ -e /usr/local/etc/init.d/ddns-client.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/bin
echo -n '/usr/local/bin/ddns-client.sh'
	if [ -L /usr/local/bin/ddns-client.sh ] && [ -e /usr/local/bin/ddns-client.sh ]; then
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
