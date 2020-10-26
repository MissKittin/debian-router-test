#!/bin/sh
# notify-daemon package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='notify-daemon'

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

# Install - /usr/local/bin
cd /usr/local/bin
echo -n '[ln] extras/bin/notify-send-mail.sh /usr/local/bin'
	if [ -e '/usr/local/bin/notify-send-mail.sh' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/bin/notify-send-mail.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

	fi

# Install - /usr/local/etc/notify-daemon
cd /usr/local/etc/notify-daemon/sender.rc.d
echo -n '[ln] extras/etc/notify-daemon/sender.rc.d/mail.rc /usr/local/etc/notify-daemon/sender.rc.d'
	if [ -e '/usr/local/etc/notify-daemon/sender.rc.d/mail.rc' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/sender.rc.d/mail.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi
cd /usr/local/etc/notify-daemon/sender-config.rc.d
echo -n '[ln] extras/etc/notify-daemon/sender-config.rc.d/mail.rc /usr/local/etc/notify-daemon/sender-config.rc.d'
	if [ -e '/usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc' ]; then
		echo ' [EXISTS]'
	else
		ln -s ${PACKAGE_DIR}/extras/etc/notify-daemon/sender-config.rc.d/mail.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	fi

# Install - /usr/local/share/webadmin
if cd /usr/local/share/webadmin > /dev/null 2>&1; then
	echo -n '[ln] webadmin/sys-notifications /usr/local/share/webadmin'
		if [ -e '/usr/local/share/webadmin/sys-notifications' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/webadmin/sys-notifications . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
	cd ./home-plugins
	echo -n '[ln] webadmin/home-plugins/notifications /usr/local/share/webadmin/home-plugins'
		if [ -e "/usr/local/share/webadmin/home-plugins/*_notifications" ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/webadmin/home-plugins/x_notifications . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo 'webadmin is not installed'
fi

# Notification
echo ''
echo 'Configure /usr/local/share/webadmin/home-plugins queue'

echo ''
exit 0
