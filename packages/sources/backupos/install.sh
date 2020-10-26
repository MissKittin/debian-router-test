#!/bin/sh
# backupos package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='backupos'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if installed
if [ -e /boot/backupos ] || [ -e /usr/local/sbin/boot_to_backupos.sh ]; then
	echo 'Already installed'
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

# Install - /boot
cd /boot
echo -n '[ln] boot/backupos /boot'
	ln -s ${PACKAGE_DIR}/boot/backupos . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/boot_to_backupos.sh /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/boot_to_backupos.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Configure bootloader, see sample-config directory'

echo ''
exit 0
