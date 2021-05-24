#!/bin/sh
# toggle-wakeup-events package
# uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='toggle-wakeup-events'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if installed
if [ ! -e /usr/local/etc/toggle-wakeup-events.rc ] || [ ! -e /usr/local/etc/init.d/toggle-wakeup-events ] || [ ! -e /usr/local/sbin/toggle-wakeup-events.sh ] || [ ! -e /etc/init.d/toggle-wakeup-events ]; then
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
echo -n '[rm] /usr/local/etc/toggle-wakeup-events.rc'
	rm /usr/local/etc/toggle-wakeup-events.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/toggle-wakeup-events'
	rm /usr/local/etc/init.d/toggle-wakeup-events > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/toggle-wakeup-events.sh'
	rm /usr/local/sbin/toggle-wakeup-events.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/toggle-wakeup-events'
	rm /etc/init.d/toggle-wakeup-events > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/toggle-wakeup-events from /etc/rc*.d'

echo ''
exit 0
