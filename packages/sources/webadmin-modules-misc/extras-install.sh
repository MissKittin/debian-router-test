#!/bin/sh
# webadmin-modules-misc package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='webadmin-modules-misc'
FILES='
	home-plugins/01_splash-info
	lib/console/check-command-stack.sh
	lib/console/update-shebang.php
	lib/opt_htmlheaders
	lib/range_icons
	lib/shell/check-ipv6.rc
	lib/shell/check-service.rc
	lib/shell/path.rc
	lib/shell/public-ipv4.rc
	lib/shell/superuser.sh
	lib/opcache.php
	lib/jquery.js
	lib/jquery-old.js
	login-plugins/01_internet-info
	login-plugins/05_check-dash
	login-plugins/15_check-js
	login-plugins/20_check-https
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
FILES_EXTRAS='
	lib/favicon
	lib/htmlheaders/fadeanimations.php
	lib/htmlheaders/faviconHeader.php
	lib/htmlheaders/js-warning.php
	lib/htmlheaders/mobileview.php
	lib/htmlheaders_min/fadeanimations.php
	lib/htmlheaders_min/mobileview.php
	lib/login/login-themes/material
	lib/themes/bright
	lib/themes/dark
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

# Install - /usr/local/share/webadmin
if cd /usr/local/share/webadmin > /dev/null 2>&1; then
	for i in ${FILES}; do
		echo -n "[ln] webadmin/${i} /usr/local/share/webadmin"
			if [ -e "/usr/local/share/webadmin/${i}" ]; then
				echo ' [EXISTS]'
			else
				ln -s ${PACKAGE_DIR}/webadmin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi
	done
	for i in ${FILES_EXTRAS}; do
		echo -n "[ln] webadmin-extras/${i} /usr/local/share/webadmin"
			if [ -e "/usr/local/share/webadmin/${i}" ]; then
				echo ' [EXISTS]'
			else
				ln -s ${PACKAGE_DIR}/webadmin-extras/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi
	done
	if [ "${1}" = '--install-deprecated' ]; then
		for i in ${FILES_DEPRECATED}; do
			echo -n "[ln] webadmin/${i} /usr/local/share/webadmin"
				if [ -e "/usr/local/share/webadmin/${i}" ]; then
					echo ' [EXISTS]'
				else
					ln -s ${PACKAGE_DIR}/webadmin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
				fi
		done
	fi
else
	echo 'webadmin is not installed'
fi

# Configure
php /usr/local/share/webadmin/lib/console/update-shebang.php
php /usr/local/share/webadmin/lib/console/generate-cache.php

echo ''
exit 0
