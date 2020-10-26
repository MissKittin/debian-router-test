#!/bin/sh
# fancontrol config
# uninstall script

# Settings
PACKAGE_NAME='fancontrol'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if installed
if [ ! -e '/usr/local/etc/fancontrol' ] || [ ! -e '/etc/fancontrol' ]; then
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
echo -n '[rm] /usr/local/etc/fancontrol'
	rm /usr/local/etc/fancontrol > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc
echo -n '[rm] /etc/fancontrol'
	rm /etc/fancontrol > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
