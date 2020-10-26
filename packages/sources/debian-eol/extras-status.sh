#!/bin/sh
# debian-eol package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='debian-eol'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/notify-daemon
for i in debian-eol.rc; do
	echo -n "/usr/local/etc/notify-daemon/events.rc.d/${i}"
		if [ -L /usr/local/etc/notify-daemon/events.rc.d/${i} ] && [ -e /usr/local/etc/notify-daemon/events.rc.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

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
