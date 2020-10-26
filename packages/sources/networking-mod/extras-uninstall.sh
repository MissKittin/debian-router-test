#!/bin/sh
# networking-mod tweak
# extras uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='networking-mod'

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

# Uninstall - rc.local package
echo -n '[rm] /usr/local/etc/rc.local.d/compress-networking-log.rc'
	rm /usr/local/etc/rc.local.d/P*_compress-networking-log.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
