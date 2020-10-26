#!/bin/sh
# fancontrol-weather package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='fancontrol-weather'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/share/rc.local.d
echo -n '/usr/local/etc/rc.local.d/fancontrol-weather.rc'
	if [ -L /usr/local/etc/rc.local.d/P*_fancontrol-weather.rc ] && [ -e /usr/local/etc/rc.local.d/P*_fancontrol-weather.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /etc/init.d
echo -n '/etc/init.d/fancontrol-weather.sh'
	if [ -L /etc/init.d/fancontrol-weather.sh ] && [ -e /etc/init.d/fancontrol-weather.sh ]; then
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
