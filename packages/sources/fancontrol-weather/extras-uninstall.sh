#!/bin/sh
# fancontrol-weather package
# extras uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='fancontrol-weather'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc/rc.local.d
echo -n '[rm] /usr/local/etc/rc.local.d/fancontrol-weather.rc'
	rm /usr/local/etc/rc.local.d/P*_fancontrol-weather.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/fancontrol-weather.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/fancontrol-weather.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Insserv fancontrol-weather.sh'

echo ''
exit 0
