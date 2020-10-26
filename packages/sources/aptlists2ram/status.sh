#!/bin/sh
# aptlists2ram package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='aptlists2ram'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/rc.local.d
echo -n '/usr/local/etc/rc.local.d/aptlists2ram.rc'
	if [ -L /usr/local/etc/rc.local.d/P*_aptlists2ram.rc ] && [ -e /usr/local/etc/rc.local.d/P*_aptlists2ram.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/rcdown.local.d
echo -n '/usr/local/etc/rcdown.local.d/aptlists2ram.rc'
	if [ -L /usr/local/etc/rcdown.local.d/*_aptlists2ram.rc ] && [ -e /usr/local/etc/rcdown.local.d/*_aptlists2ram.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/apt/apt.conf.d
echo -n '/usr/local/etc/apt/apt.conf.d/aptlists2ram-compress-indexes'
	if [ -L /usr/local/etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ] && [ -e /usr/local/etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/apt/apt.conf.d
echo -n '/etc/apt/apt.conf.d/aptlists2ram-compress-indexes'
	if [ -L /etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ] && [ -e /etc/apt/apt.conf.d/*aptlists2ram-compress-indexes ]; then
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
