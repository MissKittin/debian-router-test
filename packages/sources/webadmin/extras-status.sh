#!/bin/sh
# webadmin package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='webadmin'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc'
	if [ -L /usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc ] && [ -e /usr/local/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi
echo -n '/usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc'
	if [ -L /usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc ] && [ -e /usr/local/etc/notify-daemon/journal-manager.rc.d/www.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
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
