#!/bin/sh
# fancontrol-weather package
# uninstall script

# Settings
PACKAGE_NAME='fancontrol-weather'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
if [ ! -e /usr/local/etc/fancontrol-weather.rc ] || [ ! -e /usr/local/etc/init.d/fancontrol-weather.sh ] || [ ! -e /usr/local/sbin/fancontrol-weather.sh ] || [ ! -e /usr/local/share/fancontrol-weather ]; then
	echo 'Not installed'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/fancontrol-weather.rc'
	rm /usr/local/etc/fancontrol-weather.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/fancontrol-weather.sh'
	rm /usr/local/etc/init.d/fancontrol-weather.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/fancontrol-weather.sh'
	rm /usr/local/sbin/fancontrol-weather.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/fancontrol-weather'
	rm /usr/local/share/fancontrol-weather > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/fancontrol-weather.sh'
	rm /etc/init.d/fancontrol-weather.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/fancontrol-weather.sh from /etc/rc*.d'

echo ''
exit 0
