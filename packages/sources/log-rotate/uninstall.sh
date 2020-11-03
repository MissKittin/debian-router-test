#!/bin/sh
# log-rotate package
# uninstall script

# Settings
PACKAGE_NAME='log-rotate'

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
if [ ! -e '/usr/local/etc/log-rotate.rc' ] || [ ! -e '/usr/local/sbin/log-rotate.sh' ]; then
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

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/log-rotate.rc'
	rm /usr/local/etc/log-rotate.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/notify-daemon
echo -n '[rm] /usr/local/etc/notify-daemon/events.rc.d/log-rotate.rc'
	rm /usr/local/etc/notify-daemon/events.rc.d/log-rotate.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/log-rotate.sh'
	rm /usr/local/sbin/log-rotate.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
