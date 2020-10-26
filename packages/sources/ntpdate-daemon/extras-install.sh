#!/bin/sh
# ntpdate-daemon package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='ntpdate-daemon'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
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

# Install - /usr/local/etc/acpid-suspend
if cd /usr/local/etc/acpid-suspend/post_suspend.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/acpid-suspend/post_suspend.d/ntpdate-daemon.rc /usr/local/etc/acpid-suspend/post_suspend.d'
		ln -s ${PACKAGE_DIR}/extras/etc/acpid-suspend/post_suspend.d/S99ntpdate-daemon.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

else
	echo 'acpid-mods are not installed'
fi

# Install - /usr/local/etc/notify-daemon
if cd /usr/local/etc/notify-daemon/events.rc.d > /dev/null 2>&1; then
	# Uninstall - /etc/init.d
	echo -n '[rm] /etc/init.d/ntpdate-daemon.sh'
		rm /etc/init.d/ntpdate-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

	# Uninstall - /usr/local/etc/init.d
	echo -n '[rm] /usr/local/etc/init.d/ntpdate-daemon.sh'
		rm /usr/local/etc/init.d/ntpdate-daemon.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

	echo -n '[ln] extras/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc /usr/local/etc/notify-daemon/events.rc.d'
		if [ -e '/usr/local/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/events.rc.d/ntpdate-daemon.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo 'notify-daemon is not installed'
fi

echo ''
exit 0
