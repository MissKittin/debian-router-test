#!/bin/sh
# hostapd config
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='hostapd'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/hostapd'
	if [ -L '/usr/local/etc/hostapd' ] && [ -e '/usr/local/etc/hostapd' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/default
echo -n '/usr/local/etc/default/hostapd'
	if [ -L '/usr/local/etc/default/hostapd' ] && [ -e '/usr/local/etc/default/hostapd' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/default
echo -n '/etc/default/hostapd'
	if [ -L '/etc/default/hostapd' ] && [ -e '/etc/default/hostapd' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/hostapd
echo -n '/etc/hostapd/hostapd.conf'
	if [ -L '/etc/hostapd/hostapd.conf' ] && [ -e '/etc/hostapd/hostapd.conf' ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Config package is broken'
	exit 2
elif ! $broken && $installed; then
	echo ' Config package is installed'
	exit 0
else
	echo ' Config package is not installed'
	exit 1
fi
