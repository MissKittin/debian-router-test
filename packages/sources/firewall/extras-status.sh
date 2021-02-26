#!/bin/sh
# firewall package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='firewall'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/notify-daemon
#for i in firewall.rc firewall6.rc default_gateway.rc routing.rc; do
#	echo -n "/usr/local/etc/notify-daemon/events.rc.d/${i}"
#		if [ -L /usr/local/etc/notify-daemon/events.rc.d/${i} ] && [ -e /usr/local/etc/notify-daemon/events.rc.d/${i} ]; then
#			installed=true
#			echo ' [ OK ]'
#		else
#			broken=true
#			echo ' [NOT INSTALLED]'
#		fi
#done

# /usr/local/share/webadmin
for lib in list-interfaces.rc net-routing-list.rc; do
	echo -n "/usr/local/share/webadmin/lib/shell/${lib}"
		if [ -L /usr/local/share/webadmin/lib/shell/${lib} ] && [ -e /usr/local/share/webadmin/lib/shell/${lib} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done
for module in net-ifaces net-routing; do
	echo -n "/usr/local/share/webadmin/${module}"
		if [ -L /usr/local/share/webadmin/${module} ] && [ -e /usr/local/share/webadmin/${module} ]; then
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
