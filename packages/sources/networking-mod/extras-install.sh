#!/bin/sh
# networking-mod tweak
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='networking-mod'

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

# Install - /usr/local/etc/rc.local.d
if cd /usr/local/etc/rc.local.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/rc.local.d/compress-networking-log.rc /usr/local/etc/rc.local.d'
		ln -s ${PACKAGE_DIR}/extras/etc/rc.local.d/PKx_compress-networking-log.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
else
	echo 'rc.local is not installed'
fi

# Notification
echo ''
echo ' ! Configure /usr/local/etc/rc.local.d'

echo ''
exit 0
