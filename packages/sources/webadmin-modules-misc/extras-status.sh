#!/bin/sh
# webadmin-modules-misc package
# status check
broken=false
installed=false

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
	lib/htmlheaders_min/fadeanimations.php
	lib/htmlheaders_min/mobileview.php
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

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/share/webadmin
for i in ${FILES} ${FILES_EXTRAS} ${FILES_DEPRECATED}; do
	echo -n "/usr/local/share/webadmin/${i}"
		if [ -L /usr/local/share/webadmin/${i} ] && [ -e /usr/local/share/webadmin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# Notify
echo ''
if $broken && $installed; then
	echo ' Package partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Package installed'
	exit 0
else
	echo ' Package not installed'
	exit 1
fi
