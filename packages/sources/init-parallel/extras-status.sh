#!/bin/sh
# init-parallel package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='init-parallel'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/share/rc.local.d
echo -n '/usr/local/etc/rc.local.d/compress-init-parallel.rc'
	if [ -L /usr/local/etc/rc.local.d/P*_compress-init-parallel.rc ] && [ -e /usr/local/etc/rc.local.d/P*_compress-init-parallel.rc ]; then
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
