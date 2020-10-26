#!/bin/sh
# resolvconf-updater package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='resolvconf-updater'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/acpid-suspend
echo -n '/usr/local/etc/acpid-suspend/pre_suspend.d/resolvconf-updater.rc'
	if [ -L /usr/local/etc/acpid-suspend/pre_suspend.d/*resolvconf-updater.rc ] && [ -e /usr/local/etc/acpid-suspend/pre_suspend.d/*resolvconf-updater.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi
echo -n '/usr/local/etc/acpid-suspend/post_suspend.d/resolvconf-updater.rc'
	if [ -L /usr/local/etc/acpid-suspend/post_suspend.d/S99resolvconf-updater.rc ] && [ -e /usr/local/etc/acpid-suspend/post_suspend.d/S99resolvconf-updater.rc ]; then
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
