#!/bin/sh
# notify-daemon-v2 package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='notify-daemon-v2'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/share/webadmin
for i in home-plugins/*_notifications; do
	echo -n "/usr/local/share/webadmin/${i}"
		if [ -L /usr/local/share/webadmin/${i} ] && [ -e /usr/local/share/webadmin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/journal.rc.d/www.rc'
	if [ -L /usr/local/etc/notify-daemon/journal.rc.d/www.rc ] && [ -e /usr/local/etc/notify-daemon/journal.rc.d/www.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# Notify
echo ''
if $broken && $installed; then
	echo ' Extras partially installed'
	exit 2
elif ! $broken && $installed; then
	echo ' Extras installed'
	exit 0
else
	echo ' Extras not installed'
	exit 1
fi
