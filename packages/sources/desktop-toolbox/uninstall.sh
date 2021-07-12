#!/bin/sh
# desktop-toolbox package
# uninstall script

# Settings
PACKAGE_NAME='desktop-toolbox'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check if installed
for i in bin/alsa-hotkeys bin/gnome-screenshot-hotkey bin/gtk-list-daemons bin/sudo-gtk etc/desktop-toolbox share/desktop-toolbox; do
	if [ ! -e /usr/local/${i} ]; then
		echo 'Not installed'
		exit 1
	fi
done

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# Question
echo -n 'Are you sure? (y/[n]) '
read answer
[ "${answer}" = 'y' ] || exit 0
echo ''

# Uninstall - /usr/local/bin
for i in alsa-hotkeys gnome-screenshot-hotkey gtk-list-daemons sudo-gtk; do
	echo -n "[rm] /usr/local/bin/${i}"
		rm /usr/local/bin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/desktop-toolbox'
	rm /usr/local/etc/desktop-toolbox > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/desktop-toolbox'
	rm /usr/local/share/desktop-toolbox > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
