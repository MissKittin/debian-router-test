#!/bin/sh
# desktop-logout-gui package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='desktop-logout-gui'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

for i in '/usr/local/bin/desktop-logout-gui-helper' '/usr/local/etc/desktop-logout-gui-helper' '/usr/local/etc/sudoers.d/z-desktop-logout-gui-helper' '/etc/sudoers.d/z-desktop-logout-gui-helper'; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
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
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
