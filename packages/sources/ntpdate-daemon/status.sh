#!/bin/sh
# ntpdate-daemon package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='ntpdate-daemon'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/ntpdate-daemon.rc'
	if [ -L /usr/local/etc/ntpdate-daemon.rc ] && [ -e /usr/local/etc/ntpdate-daemon.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
#echo -n '/usr/local/etc/init.d/ntpdate-daemon.sh'
#	if [ -L /usr/local/etc/init.d/ntpdate-daemon.sh ] && [ -e /usr/local/etc/init.d/ntpdate-daemon.sh ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/ntpdate-daemon.sh'
	if [ -L /usr/local/sbin/ntpdate-daemon.sh ] && [ -e /usr/local/sbin/ntpdate-daemon.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
#echo -n '/etc/init.d/ntpdate-daemon.sh'
#	if [ -L /etc/init.d/ntpdate-daemon.sh ] && [ -e /etc/init.d/ntpdate-daemon.sh ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

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
