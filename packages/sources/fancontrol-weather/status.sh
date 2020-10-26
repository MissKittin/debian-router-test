#!/bin/sh
# fancontrol-weather package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='fancontrol-weather'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/fancontrol-weather.rc'
	if [ -L /usr/local/etc/fancontrol-weather.rc ] && [ -e /usr/local/etc/fancontrol-weather.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/fancontrol-weather.sh'
	if [ -L /usr/local/etc/init.d/fancontrol-weather.sh ] && [ -e /usr/local/etc/init.d/fancontrol-weather.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/fancontrol-weather.sh'
	if [ -L /usr/local/sbin/fancontrol-weather.sh ] && [ -e /usr/local/sbin/fancontrol-weather.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/share
echo -n '/usr/local/share/fancontrol-weather'
	if [ -L /usr/local/share/fancontrol-weather ] && [ -e /usr/local/share/fancontrol-weather ]; then
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
