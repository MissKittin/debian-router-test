#!/bin/sh
# resolvconf-updater package
# uninstall script

# Settings
PACKAGE_NAME='resolvconf-updater' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /usr/local/etc/resolvconf-updater.d ] || [ ! -e /usr/local/sbin/resolvconf-updater.sh ]; then
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

# Uninstall - rc.local package
#echo -n '[rm] /usr/local/etc/rc.local.d/resolvconf-updater'
#	rm /usr/local/etc/rc.local.d/P*_resolvconf-updater.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/resolvconf-updater.d'
	rm /usr/local/etc/resolvconf-updater.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/resolvconf-updater.sh'
	rm /usr/local/etc/init.d/resolvconf-updater.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/resolvconf-updater.sh'
	rm /usr/local/sbin/resolvconf-updater.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
echo -n '[rm] /etc/init.d/resolvconf-updater.sh'
	rm /etc/init.d/resolvconf-updater.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/resolvconf-updater.sh from /etc/rc*.d'

echo ''
exit 0
