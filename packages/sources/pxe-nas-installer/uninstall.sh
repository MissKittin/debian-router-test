#!/bin/sh
# pxe-nas-installer package
# uninstall script

# Settings
PACKAGE_NAME='pxe-nas-installer'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
if [ ! -e '/usr/local/sbin/pxe-nas-installer' ] || [ ! -e '/usr/local/share/pxe-nas-installer' ]; then
	echo 'Not installed'
	exit 1
fi

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# Question
echo -n 'Are you sure? (y/[n]) '
read answer
[ "${answer}" = 'y' ] || exit 0
echo ''

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/pxe-nas-installer'
	rm /usr/local/sbin/pxe-nas-installer > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/pxe-nas-installer'
	rm /usr/local/share/pxe-nas-installer > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
