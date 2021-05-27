#!/bin/sh
# desktop-logout-gui package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='desktop-logout-gui'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
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

# Install - /usr/local/bin
cd /usr/local/bin
echo -n '[ln] bin/desktop-logout-gui-helper /usr/local/bin'
	if [ -e '/usr/local/bin/desktop-logout-gui-helper' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/bin/desktop-logout-gui-helper . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/desktop-logout-gui-helper /usr/local/etc'
	if [ -e '/usr/local/etc/desktop-logout-gui-helper' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/etc/desktop-logout-gui-helper . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi

# Install - /usr/local/etc/sudoers.d /etc/sudoers.d
if cd /usr/local/etc/sudoers.d > /dev/null 2>&1; then
	echo -n '[ln] etc/sudoers.d/z-desktop-logout-gui-helper /usr/local/etc/sudoers.d'
		if [ -e '/usr/local/etc/sudoers.d/z-desktop-logout-gui-helper' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/etc/sudoers.d/z-desktop-logout-gui-helper . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
	if cd /etc/sudoers.d > /dev/null 2>&1; then
		echo -n '[ln] /usr/local/etc/sudoers.d/z-desktop-logout-gui-helper /etc/sudoers.d'
			if [ -e '/etc/sudoers.d/z-desktop-logout-gui-helper' ]; then
				echo ' [EXISTS]'
			else
				ln -s /usr/local/etc/sudoers.d/z-desktop-logout-gui-helper . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi

	else
		echo '[ln] /usr/local/etc/sudoers.d/z-desktop-logout-gui-helper /etc/sudoers.d [Fail]'
	fi
else
	echo '[ln] etc/sudoers.d/z-desktop-logout-gui-helper /usr/local/etc/sudoers.d [Fail]'
fi

# Notification
echo ''
echo ' ! Configure /etc/sudoers.d/z-desktop-logout-gui-helper'

echo ''
exit 0
