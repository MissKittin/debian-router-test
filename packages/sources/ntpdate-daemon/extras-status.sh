#!/bin/sh
# ntpdate-daemon package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='ntpdate-daemon'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/acpid-suspend
echo -n '/usr/local/etc/acpid-suspend/post_suspend.d/ntpdate-daemon.rc'
	if [ -L /usr/local/etc/acpid-suspend/post_suspend.d/*ntpdate-daemon.rc ] && [ -e /usr/local/etc/acpid-suspend/post_suspend.d/*ntpdate-daemon.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/ntpdate-daemon.sh'
	if [ -L /usr/local/etc/init.d/ntpdate-daemon.sh ] && [ -e /usr/local/etc/init.d/ntpdate-daemon.sh ]; then
		broken=true
		echo ' [Exists]'
	else
		installed=true
		echo ' [ Not exists - OK ]'
	fi

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc'
	if [ -L /usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc ] && [ -e /usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /etc/init.d
echo -n '/etc/init.d/ntpdate-daemon.sh'
	if [ -L /etc/init.d/ntpdate-daemon.sh ] && [ -e /etc/init.d/ntpdate-daemon.sh ]; then
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
