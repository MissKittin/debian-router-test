#!/bin/sh
# correct-wol package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='correct-wol'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
echo -n '/usr/local/etc/correct-wol.rc'
	if [ -L /usr/local/etc/correct-wol.rc ] && [ -e /usr/local/etc/correct-wol.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/correct-wol.sh'
	if [ -L /usr/local/etc/init.d/correct-wol.sh ] && [ -e /usr/local/etc/init.d/correct-wol.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/sbin
echo -n '/usr/local/sbin/correct-wol.sh'
	if [ -L /usr/local/sbin/correct-wol.sh ] && [ -e /usr/local/sbin/correct-wol.sh ]; then
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
