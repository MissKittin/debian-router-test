#!/bin/sh
# log-rotate package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='log-rotate'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/log-rotate.rc'
	if [ -L /usr/local/etc/log-rotate.rc ] && [ -e /usr/local/etc/log-rotate.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/events.rc.d/log-rotate.rc'
	if [ -L /usr/local/etc/notify-daemon/events.rc.d/log-rotate.rc ] && [ -e /usr/local/etc/notify-daemon/events.rc.d/log-rotate.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/log-rotate.sh'
	if [ -L /usr/local/sbin/log-rotate.sh ] && [ -e /usr/local/sbin/log-rotate.sh ]; then
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
