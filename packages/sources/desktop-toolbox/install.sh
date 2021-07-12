#!/bin/sh
# desktop-toolbox package
# install script

# Debian dependencies: gtkdialog

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='desktop-toolbox'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/bin/gtkdialog ] && [ ! -e /usr/local/bin/gtkdialog ]; then
	echo 'gtkdialog debian package not installed'
	exit 1
fi

# Check if installed
for i in bin/alsa-hotkeys bin/gnome-screenshot-hotkey bin/gtk-list-daemons bin/sudo-gtk etc/desktop-toolbox share/desktop-toolbox; do
	if [ -e /usr/local/${i} ]; then
		echo 'Already installed'
		exit 1
	fi
done

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/bin
cd /usr/local/bin
for i in alsa-hotkeys gnome-screenshot-hotkey gtk-list-daemons sudo-gtk; do
	echo -n "[ln] bin/${i} /usr/local/bin"
		ln -s ${PACKAGE_DIR}/bin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/desktop-toolbox /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/desktop-toolbox . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/desktop-toolbox /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/desktop-toolbox . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
