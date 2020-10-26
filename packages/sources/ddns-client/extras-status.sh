#!/bin/sh
# ddns-client package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='ddns-client'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/share/rc.local.d
echo -n '/usr/local/etc/rc.local.d/ddns-client.rc'
	if [ -L /usr/local/etc/rc.local.d/P*_ddns-client.rc ] && [ -e /usr/local/etc/rc.local.d/P*_ddns-client.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /etc/init.d
echo -n '/etc/init.d/ddns-client.sh'
	if [ -L /etc/init.d/ddns-client.sh ] && [ -e /etc/init.d/ddns-client.sh ]; then
		broken=true
		echo ' [Exists]'
	else
		installed=true
		echo ' [ Not exists - OK ]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
