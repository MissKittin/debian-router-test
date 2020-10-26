#!/bin/sh
# resolvconf-updater package
# extras uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='resolvconf-updater'

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

# Uninstall - /usr/local/etc/acpid-suspend
echo -n '[rm] /usr/local/etc/acpid-suspend/pre_suspend.d/resolvconf-updater.rc'
	rm /usr/local/etc/acpid-suspend/pre_suspend.d/*resolvconf-updater.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rm] /usr/local/etc/acpid-suspend/post_suspend.d/resolvconf-updater.rc'
	rm /usr/local/etc/acpid-suspend/post_suspend.d/*resolvconf-updater.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
