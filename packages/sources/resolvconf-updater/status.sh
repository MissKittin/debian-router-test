#!/bin/sh
# resolvconf-updater package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='resolvconf-updater'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/rc.local.d
#echo -n '/usr/local/etc/rc.local.d/resolvconf-updater.rc'
#	if [ -L /usr/local/etc/rc.local.d/P*_resolvconf-updater.rc ] && [ -e /usr/local/etc/rc.local.d/P*_resolvconf-updater.rc ]; then
#		installed=true
#		echo ' [ OK ]'
#	else
#		broken=true
#		echo ' [Broken]'
#	fi

# /usr/local/etc
echo -n '/usr/local/etc/resolvconf-updater.d'
	if [ -L /usr/local/etc/resolvconf-updater.d ] && [ -e /usr/local/etc/resolvconf-updater.d ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/resolvconf-updater.sh'
	if [ -L /usr/local/etc/init.d/resolvconf-updater.sh ] && [ -e /usr/local/etc/init.d/resolvconf-updater.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/resolvconf-updater.sh'
	if [ -L /usr/local/sbin/resolvconf-updater.sh ] && [ -e /usr/local/sbin/resolvconf-updater.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/resolvconf-updater.sh'
	if [ -L /etc/init.d/resolvconf-updater.sh ] && [ -e /etc/init.d/resolvconf-updater.sh ]; then
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
