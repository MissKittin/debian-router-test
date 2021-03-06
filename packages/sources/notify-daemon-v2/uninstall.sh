#!/bin/sh
# notify-daemon-v2 package
# uninstall script

# Conflicts: notify-daemon

# Settings
PACKAGE_NAME='notify-daemon-v2'

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
if [ ! -e '/usr/local/bin/notify-daemon.sh' ] || [ ! -e '/usr/local/etc/notify-daemon' ] || [ ! -e '/usr/local/etc/init.d/notify-daemon.sh' ] || [ ! -e '/usr/local/share/notify-daemon' ] || [ ! -e '/etc/init.d/notify-daemon.sh' ]; then
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
echo -n '[rm] /usr/local/bin/notify-daemon.sh'
	rm /usr/local/bin/notify-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/notify-daemon'
	rm /usr/local/etc/notify-daemon > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
echo -n '[rm] /usr/local/etc/init.d/notify-daemon.sh'
	rm /usr/local/etc/init.d/notify-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/notify-daemon'
	rm /usr/local/share/notify-daemon > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
echo -n '[rm] /etc/init.d/notify-daemon.sh'
	rm /etc/init.d/notify-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Remove insserved /etc/init.d/notify-daemon.sh from /etc/rc*.d'

echo ''
exit 0