#!/bin/sh
# notify-daemon package
# uninstall script

# Settings
PACKAGE_NAME='notify-daemon' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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
if [ ! -e /usr/local/etc/notify-daemon ] || [ -e /usr/local/share/notify-daemon ] || [ ! -e /usr/local/sbin/notify-daemon-state.sh ] || [ ! -e /usr/local/sbin/notify-daemon.sh ]; then
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
echo -n '[rm] /usr/local/etc/rc.local.d/notify-daemon.rc'
	rm /usr/local/etc/rc.local.d/P*_notify-daemon.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/notify-daemon'
	rm /usr/local/etc/notify-daemon > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
for i in notify-daemon-state.sh notify-daemon.sh; do
	echo -n '[rm] /usr/local/sbin/'"${i}"
		rm /usr/local/sbin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/share
cd /usr/local/share
echo -n '[rm] /usr/local/share/notify-daemon'
	rm /usr/local/share/notify-daemon > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
