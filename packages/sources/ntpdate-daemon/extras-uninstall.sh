#!/bin/sh
# ntpdate-daemon package
# extras uninstall script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='ntpdate-daemon'

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
echo -n '[rm] /usr/local/etc/acpid-suspend/post_suspend.d/ntpdate-daemon.rc'
	rm /usr/local/etc/acpid-suspend/post_suspend.d/*ntpdate-daemon.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
if [ ! -e '/usr/local/etc/init.d/ntpdate-daemon.sh' ]; then
	cd /usr/local/etc/init.d
	echo -n '[ln] etc/init.d/ntpdate-daemon.sh /usr/local/etc/init.d'
		ln -s ${PACKAGE_DIR}/etc/init.d/ntpdate-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
fi

# Uninstall - /usr/local/etc/notify-daemon
echo -n '[rm] /usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc'
	if [ -e '/usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc' ]; then
		rm /usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

# Install - /etc/init.d
if [ ! -e '/etc/init.d/ntpdate-daemon.sh' ]; then
	cd /etc/init.d
	echo -n '[ln] /usr/local/etc/init.d/ntpdate-daemon.sh /etc/init.d'
		ln -s /usr/local/etc/init.d/ntpdate-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
fi

# Notification
echo ''
echo ' ! Insserv ntpdate-daemon.sh'

echo ''
exit 0
