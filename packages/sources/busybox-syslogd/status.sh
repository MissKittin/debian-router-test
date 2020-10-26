#!/bin/sh
# busybox-syslogd package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='busybox-syslogd'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/busybox-syslogd'
	if [ -L /usr/local/etc/init.d/busybox-syslogd ] && [ -e /usr/local/etc/init.d/busybox-syslogd ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/busybox-syslogd'
	if [ -L /etc/init.d/busybox-syslogd ] && [ -e /etc/init.d/busybox-syslogd ]; then
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
