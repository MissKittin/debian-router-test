#!/bin/sh
# notify-daemon package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='notify-daemon'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/bin
echo -n '/usr/local/bin/notify-send-mail.sh'
	if [ -L /usr/local/bin/notify-send-mail.sh ] && [ -e /usr/local/bin/notify-send-mail.sh ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /usr/local/etc/notify-daemon
echo -n '/usr/local/etc/notify-daemon/sender.rc.d/mail.rc'
	if [ -L /usr/local/etc/notify-daemon/sender.rc.d/mail.rc ] && [ -e /usr/local/etc/notify-daemon/sender.rc.d/mail.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi
echo -n '/usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc'
	if [ -L /usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc ] && [ -e /usr/local/etc/notify-daemon/sender-config.rc.d/mail.rc ]; then
		installed=true
		echo ' [ OK ]'
	else
		broken=true
		echo ' [NOT INSTALLED]'
	fi

# /usr/local/share/webadmin
for i in sys-notifications home-plugins/*_notifications; do
	echo -n "/usr/local/share/webadmin/${i}"
		if [ -L /usr/local/share/webadmin/${i} ] && [ -e /usr/local/share/webadmin/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

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
