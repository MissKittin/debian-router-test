#!/bin/sh
# resolvconf-updater package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='resolvconf-updater'

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

# Install - /usr/local/etc/acpid-suspend
if cd /usr/local/etc/acpid-suspend > /dev/null 2>&1; then
	cd ./pre_suspend.d
	echo -n '[ln] extras/etc/acpid-suspend/pre_suspend.d/resolvconf-updater.rc /usr/local/etc/acpid-suspend/pre_suspend.d'
		ln -s ${PACKAGE_DIR}/extras/etc/acpid-suspend/pre_suspend.d/S00resolvconf-updater.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	cd ../post_suspend.d
	echo -n '[ln] extras/etc/acpid-suspend/post_suspend.d/resolvconf-updater.rc /usr/local/etc/acpid-suspend/post_suspend.d'
		ln -s ${PACKAGE_DIR}/extras/etc/acpid-suspend/post_suspend.d/S99resolvconf-updater.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

else
	echo 'acpid-mods are not installed'
fi

echo ''
exit 0
