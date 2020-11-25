#!/bin/sh
# notify-daemon-fstrim package
# extras uninstall script

# Settings
PACKAGE_NAME='notify-daemon-fstrim'

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

# Uninstall - /usr/local/etc/acpid-autosuspend/checklist.d
echo -n '[rm] /usr/local/etc/acpid-autosuspend/checklist.d/fstrim.rc'
	if [ -e /usr/local/etc/acpid-autosuspend/checklist.d/*fstrim.rc ]; then
		rm /usr/local/etc/acpid-autosuspend/checklist.d/*fstrim.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
	else
		echo ' [NOT EXISTS]'
	fi

echo ''
exit 0
