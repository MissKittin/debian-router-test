#!/bin/sh
# notify-daemon-fstrim package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='notify-daemon-fstrim'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/events.rc.d/fstrim.rc'
	if [ -L '/usr/local/etc/notify-daemon/events.rc.d/fstrim.rc' ] && [ -e '/usr/local/etc/notify-daemon/events.rc.d/fstrim.rc' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/notify-daemon
echo -n '/var/local/notify-daemon-fstrim'
	if [ -d '/var/local/notify-daemon-fstrim' ]; then
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
