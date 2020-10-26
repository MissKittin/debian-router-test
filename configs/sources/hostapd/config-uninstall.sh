#!/bin/sh
# hostapd config
# uninstall script

# Settings
PACKAGE_NAME='hostapd'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e '/etc/default/hostapd.old' ]; then
	echo 'Backup files not found'
	echo '/etc/default/hostapd.old not exists'
	exit 1
fi

# Check if installed
if [ ! -e '/usr/local/etc/hostapd' ] || [ ! -e '/usr/local/etc/default/hostapd' ] || [ ! -e '/etc/hostapd/hostapd.conf' ] || [ ! -e '/etc/default/hostapd.old' ]; then
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
echo -n '[rm] /usr/local/etc/hostapd'
	rm /usr/local/etc/hostapd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/default
echo -n '[rm] /usr/local/etc/default/hostapd'
	rm /usr/local/etc/default/hostapd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/default
echo -n '[rm] /etc/default/hostapd'
	rm /etc/default/hostapd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/default/hostapd.old /etc/default/hostapd'
	mv /etc/default/hostapd.old /etc/default/hostapd > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/hostapd
echo -n '[rm] /etc/hostapd/hostapd.conf'
	rm /etc/hostapd/hostapd.conf > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
