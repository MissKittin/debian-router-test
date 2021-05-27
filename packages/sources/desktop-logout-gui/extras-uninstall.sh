#!/bin/sh
# desktop-logout-gui package
# extras uninstall script

# Settings
PACKAGE_NAME='desktop-logout-gui'

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

# Uninstall - /usr/local/bin
echo -n '[rm] /usr/local/bin/desktop-logout-gui-helper'
	if [ -e '/usr/local/bin/desktop-logout-gui-helper' ]; then
		rm /usr/local/bin/desktop-logout-gui-helper > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/desktop-logout-gui-helper'
	if [ -e '/usr/local/etc/desktop-logout-gui-helper' ]; then
		rm /usr/local/etc/desktop-logout-gui-helper > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /etc/sudoers.d
echo -n '[rm] /etc/sudoers.d/z-desktop-logout-gui-helper'
	if [ -e '/etc/sudoers.d/z-desktop-logout-gui-helper' ]; then
		rm /etc/sudoers.d/z-desktop-logout-gui-helper > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Uninstall - /usr/local/etc/sudoers.d
echo -n '[rm] /usr/local/etc/sudoers.d/z-desktop-logout-gui-helper'
	if [ -e '/usr/local/etc/sudoers.d/z-desktop-logout-gui-helper' ]; then
		rm /usr/local/etc/sudoers.d/z-desktop-logout-gui-helper > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

echo ''
exit 0
