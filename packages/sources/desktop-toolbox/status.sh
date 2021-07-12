#!/bin/sh
# desktop-toolbox package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='desktop-toolbox'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local
for i in bin/alsa-hotkeys bin/gnome-screenshot-hotkey bin/gtk-list-daemons bin/sudo-gtk etc/desktop-toolbox share/desktop-toolbox; do
	echo -n "/usr/local/${i}"
		if [ -L /usr/local/${i} ] && [ -e /usr/local/${i} ]; then
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
