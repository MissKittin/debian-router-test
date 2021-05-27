#!/bin/sh
# desktop-logout-gui package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='desktop-logout-gui'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

for i in '/usr/local/bin/desktop-logout-gui' '/usr/local/etc/desktop-logout-gui' '/usr/local/share/desktop-logout-gui'; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

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
