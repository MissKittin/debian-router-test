#!/bin/sh
# desktop-logout-gui package
# uninstall script

# Settings
PACKAGE_NAME='desktop-logout-gui'

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
if [ ! -e /usr/local/bin/desktop-logout-gui ] || [ ! -e /usr/local/etc/desktop-logout-gui ] || [ ! -e /usr/local/share/desktop-logout-gui ]; then
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

# Uninstall - /usr/local/bin
echo -n '[rm] /usr/local/bin/desktop-logout-gui'
	rm /usr/local/bin/desktop-logout-gui > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/desktop-logout-gui'
	rm /usr/local/etc/desktop-logout-gui > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/desktop-logout-gui'
	rm /usr/local/share/desktop-logout-gui > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
