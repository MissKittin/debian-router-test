#!/bin/sh
# webadmin-modules-misc package
# uninstall script

# Settings
PACKAGE_NAME='webadmin-modules-misc'
FILES='
	home-plugins/01_splash-info
	lib/console/check-command-stack.sh
	lib/console/update-shebang.php
	lib/favicon
	lib/htmlheaders/fadeanimations.php
	lib/htmlheaders/faviconHeader.php
	lib/htmlheaders/js-warning.php
	lib/htmlheaders/mobileview.php
	lib/htmlheaders_min
	lib/login/login-themes/material
	lib/opt_htmlheaders
	lib/range_icons
	lib/shell/check-ipv6.rc
	lib/shell/check-service.rc
	lib/shell/path.rc
	lib/shell/public-ipv4.rc
	lib/shell/superuser.sh
	lib/themes/bright
	lib/themes/dark
	lib/opcache.php
	lib/jquery.js
	lib/jquery-old.js
	login-plugins/01_internet-info
	login-plugins/05_check-dash
	login-plugins/15_check-js
	net-bwusage
	net-devices
	net-wicd
	net-wired
	sys-clock
	sys-daemons
	sys-logs
	sys-sensors
	sys-storage
	sys-users
'
FILES_DEPRECATED='
	net-ap
	net-vpn
	net-wifi
	sys-updates
'

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

# Uninstall - /usr/local/share/webadmin
cd /usr/local/share/webadmin
for i in ${FILES} ${FILES_DEPRECATED}; do
	echo -n "[rm] /usr/local/share/webadmin/${i}"
		if [ -e "/usr/local/share/webadmin/${i}" ]; then
			rm /usr/local/share/webadmin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Configure
php /usr/local/share/webadmin/lib/console/generate-cache.php

echo ''
exit 0
