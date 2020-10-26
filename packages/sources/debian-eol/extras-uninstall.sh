#!/bin/sh
# debian-eol package
# extras uninstall script

# Settings
PACKAGE_NAME='debian-eol'

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

# Uninstall - /usr/local/etc/notify-daemon
for i in debian-eol.rc; do
	echo -n "[rm] /usr/local/etc/notify-daemon/events.rc.d/${i}"
		if [ -e "/usr/local/etc/notify-daemon/events.rc.d/${i}" ]; then
			rm /usr/local/etc/notify-daemon/events.rc.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

echo ''
exit 0
