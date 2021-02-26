#!/bin/sh
# misc package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='misc'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc
for i in issue motd; do
	echo -n "/usr/local/etc/${i}"
		if [ -L /usr/local/etc/${i} ] && [ -e /usr/local/etc/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /etc
for i in issue motd; do
	echo -n "/etc/${i}"
		if [ -L /etc/${i} ] && [ -e /etc/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /usr/local/sbin
for i in apt-check set-zram.sh; do
	echo -n "/usr/local/sbin/${i}"
		if [ -L /usr/local/sbin/${i} ] && [ -e /usr/local/sbin/${i} ]; then
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
