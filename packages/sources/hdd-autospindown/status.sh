#!/bin/sh
# hdd-autospindown package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='hdd-autospindown'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/init.d
echo -n '/usr/local/etc/init.d/hdd-autospindown.sh'
	if [ -L /usr/local/etc/init.d/hdd-autospindown.sh ] && [ -e /usr/local/etc/init.d/hdd-autospindown.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /usr/local/etc
for i in hdd-autospindown.d hdd-autospindown.rc; do
	echo -n "/usr/local/etc/${i}"
		if [ -L /usr/local/sbin/${i} ] && [ -e /usr/local/sbin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [Broken]'
		fi
done

# /usr/local/sbin
echo -n '/usr/local/sbin/hdd-autospindown.sh'
	if [ -L /usr/local/sbin/hdd-autospindown.sh ] && [ -e /usr/local/sbin/hdd-autospindown.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
echo -n '/etc/init.d/hdd-autospindown.sh'
	if [ -L /etc/init.d/hdd-autospindown.sh ] && [ -e /etc/init.d/hdd-autospindown.sh ]; then
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
