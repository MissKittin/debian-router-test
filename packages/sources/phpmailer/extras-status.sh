#!/bin/sh
# phpmailer package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='phpmailer'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/sender.rc.d/phpmailer.rc'
	if [ -L /usr/local/etc/notify-daemon/sender.rc.d/phpmailer.rc ] && [ -e /usr/local/etc/notify-daemon/sender.rc.d/phpmailer.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi
echo -n '/usr/local/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc'
	if [ -L /usr/local/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc ] && [ -e /usr/local/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
