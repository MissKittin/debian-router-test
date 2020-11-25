#!/bin/sh
# notify-daemon-fstrim package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='notify-daemon-fstrim'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/acpid-autosuspend/checklist.d
echo -n '/usr/local/etc/acpid-autosuspend/checklist.d/fstrim.rc'
	if [ -L /usr/local/etc/acpid-autosuspend/checklist.d/*fstrim.rc ] && [ -e /usr/local/etc/acpid-autosuspend/checklist.d/*fstrim.rc ]; then
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
