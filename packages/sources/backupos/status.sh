#!/bin/sh
# backupos package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='backupos'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /boot
echo -n '/boot/backupos'
	if [ -L /boot/backupos ] && [ -e /boot/backupos ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin/boot_to_backupos.sh
echo -n '/usr/local/sbin/boot_to_backupos.sh'
	if [ -L /usr/local/sbin/boot_to_backupos.sh ] && [ -e /usr/local/sbin/boot_to_backupos.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Package is installed'
	exit 0
else
	echo ' Package is not installed'
	exit 1
fi
