#!/bin/sh
# busybox-syslogd package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='busybox-syslogd'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/insserv.conf.d
echo -n '/usr/local/etc/insserv.conf.d/busybox-syslogd'
	if [ -L /usr/local/etc/insserv.conf.d/busybox-syslogd ] && [ -e /usr/local/etc/insserv.conf.d/busybox-syslogd ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /etc/insserv.conf.d
echo -n '/etc/insserv.conf.d/busybox-syslogd'
	if [ -L /etc/insserv.conf.d/busybox-syslogd ] && [ -e /etc/insserv.conf.d/busybox-syslogd ]; then
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
