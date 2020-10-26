#!/bin/sh
# notify-daemon package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='notify-daemon'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/rc.local.d
echo -n '/usr/local/etc/rc.local.d/notify-daemon.rc'
	if [ -L /usr/local/etc/rc.local.d/P*_notify-daemon.rc ] && [ -e /usr/local/etc/rc.local.d/P*_notify-daemon.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc
echo -n '/usr/local/etc/notify-daemon'
	if [ -L /usr/local/etc/notify-daemon ] && [ -e /usr/local/etc/notify-daemon ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
for i in notify-daemon-state.sh notify-daemon.sh; do
	echo -n "/usr/local/sbin/${i}"
		if [ -L /usr/local/sbin/${i} ] && [ -e /usr/local/sbin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /usr/local/share
echo -n '/usr/local/share/notify-daemon'
	if [ -L /usr/local/share/notify-daemon ] && [ -e /usr/local/share/notify-daemon ]; then
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
