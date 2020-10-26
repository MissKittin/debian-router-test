#!/bin/sh
# init-log-kmsg package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='init-log-kmsg'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/sbin
echo -n '/usr/local/sbin/init-log-kmsg.sh'
	if [ -L /usr/local/sbin/init-log-kmsg.sh ] && [ -e /usr/local/sbin/init-log-kmsg.sh ]; then
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
