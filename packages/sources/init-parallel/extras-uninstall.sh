#!/bin/sh
# init-parallel package
# extras uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='init-parallel'

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
echo -n '[rm] /usr/local/etc/rc.local.d/compress-init-parallel.rc'
	rm /usr/local/etc/rc.local.d/P*_compress-init-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
