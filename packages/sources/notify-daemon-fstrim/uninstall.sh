#!/bin/sh
# notify-daemon-fstrim package
# uninstall script

# Settings
PACKAGE_NAME='notify-daemon-fstrim'

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
if [ ! -e /usr/local/etc/notify-daemon/events.rc.d/fstrim.rc* ] || [ ! -e '/var/local/notify-daemon-fstrim' ]; then
	echo 'Not installed'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc/notify-daemon
echo -n '[rm] /usr/local/etc/notify-daemon/events.rc.d/fstrim.rc'
	rm /usr/local/etc/notify-daemon/events.rc.d/fstrim.rc* > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /var/local
echo -n '[rm] /var/local/notify-daemon-fstrim'
	rm -r -f /var/local/notify-daemon-fstrim > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
