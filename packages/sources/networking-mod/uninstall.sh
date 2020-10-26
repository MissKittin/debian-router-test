#!/bin/sh
# networking-mod tweak
# uninstall script

# Settings
PACKAGE_NAME='networking-mod' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /usr/local/etc/init.d/networking ]; then
	echo 'Not installed'
	exit 1
fi

# Check backup
if [ ! -e /etc/init.d/networking.old ]; then
	echo 'Backup files not found'
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

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/networking'
	rm /usr/local/etc/init.d/networking > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/networking'
	rm /etc/init.d/networking > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/init.d/networking.old networking'
	mv /etc/init.d/networking.old /etc/init.d/networking > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
