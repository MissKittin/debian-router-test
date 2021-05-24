#!/bin/sh
# toggle-wakeup-events package
# status check
broken=false
installed=false

# Settings
PACKAGE_NAME='toggle-wakeup-events'

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

for i in /usr/local/etc/toggle-wakeup-events.rc /usr/local/etc/init.d/toggle-wakeup-events /usr/local/sbin/toggle-wakeup-events.sh; do
	echo -n "${i}"
		if [ -L ${i} ] && [ -e ${i} ]; then
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
