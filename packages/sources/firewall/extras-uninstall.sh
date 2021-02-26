#!/bin/sh
# firewall package
# extras uninstall script

# Settings
PACKAGE_NAME='firewall'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Uninstall - /usr/local/etc/notify-daemon
#for i in firewall.rc firewall6.rc default_gateway.rc routing.rc; do
#	echo -n "[rm] /usr/local/etc/notify-daemon/events.rc.d/${i}"
#		if [ -e "/usr/local/etc/notify-daemon/events.rc.d/${i}" ]; then
#			rm /usr/local/etc/notify-daemon/events.rc.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
#		else
#			echo ' [NOT EXISTS]'
#		fi
#done

# Uninstall - /usr/local/share/webadmin
for lib in list-interfaces.rc net-routing-list.rc; do
	echo -n "[rm] /usr/local/share/webadmin/lib/shell/${lib}"
		if [ -e "/usr/local/share/webadmin/lib/shell/${lib}" ]; then
			rm /usr/local/share/webadmin/lib/shell/${lib} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done
for module in net-ifaces net-routing; do
	echo -n "[rm] /usr/local/share/webadmin/${module}"
		if [ -e "/usr/local/share/webadmin/${module}" ]; then
			rm /usr/local/share/webadmin/${module} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

echo ''
exit 0
