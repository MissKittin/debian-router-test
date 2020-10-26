#!/bin/sh
# correct-wol package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='correct-wol'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/acpid-suspend
echo -n '/usr/local/etc/acpid-suspend/post_suspend.d/correct-wol.rc'
	if [ -L /usr/local/etc/acpid-suspend/post_suspend.d/*correct-wol.rc ] && [ -e /usr/local/etc/acpid-suspend/post_suspend.d/*correct-wol.rc ]; then
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
