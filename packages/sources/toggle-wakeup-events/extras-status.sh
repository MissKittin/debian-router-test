#!/bin/sh
# toggle-wakeup-events package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='toggle-wakeup-events'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/share/rc.local.d
echo -n '/usr/local/etc/rc.local.d/toggle-wakeup-events.rc'
	if [ -L /usr/local/etc/rc.local.d/P*_toggle-wakeup-events.rc ] && [ -e /usr/local/etc/rc.local.d/P*_toggle-wakeup-events.rc ]; then
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
