#!/bin/sh
# networking-mod tweak
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='networking-mod'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# /usr/local/etc/init.d
echo -n "/usr/local/etc/init.d/${i}"
	if [ -L /usr/local/etc/init.d/networking ] && [ -e /usr/local/etc/init.d/networking ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [Broken]'
	fi

# /etc/init.d
for i in networking.old networking; do
	echo -n "/etc/init.d/${i}"
		if [ -L /etc/init.d/${i} ] && [ -e /etc/init.d/${i} ]; then
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
