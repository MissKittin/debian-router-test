#!/bin/sh
# fake-systemd package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='fake-systemd'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/apt
echo -n '/usr/local/etc/apt/sources.list.d/fake-systemd.list'
	if [ -L /usr/local/etc/apt/sources.list.d/fake-systemd.list ] && [ -e /usr/local/etc/apt/sources.list.d/fake-systemd.list ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/share
echo -n '/usr/local/share/fake-systemd'
	if [ -L /usr/local/share/fake-systemd ] && [ -e /usr/local/share/fake-systemd ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/apt
echo -n '/etc/apt/sources.list.d/fake-systemd.list'
	if [ -L /etc/apt/sources.list.d/fake-systemd.list ] && [ -e /etc/apt/sources.list.d/fake-systemd.list ]; then
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
