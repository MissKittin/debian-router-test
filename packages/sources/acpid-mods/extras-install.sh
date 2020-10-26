#!/bin/sh
# acpid-mods package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='acpid-mods'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
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

# Install - /usr/local/etc/acpid-autosuspend/checklist.d
for i in iptables.rc ipv4.rc ipv6.rc l2tp.rc pptp.rc proftpd.rc samba.rc users.rc vsftpd.rc xorg.rc; do
	echo -n "[ln] extras/acpid-autosuspend/checklist.d/${i} /usr/local/etc/acpid-autosuspend/checklist.d"
		if [ -e /usr/local/etc/acpid-autosuspend/checklist.d/*${i} ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/acpid-autosuspend/checklist.d/SX${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
done

# Install - /usr/local/etc/acpid-autosuspend/config.rc.d
for i in ipvx.rc l2tp.rc pptp.rc; do
	echo -n "[ln] extras/acpid-autosuspend/config.rc.d/${i} /usr/local/etc/acpid-autosuspend/config.rc.d"
		if [ -e "/usr/local/etc/acpid-autosuspend/config.rc.d/${i}" ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/acpid-autosuspend/config.rc.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
done

# Install - /usr/local/etc/acpid-suspend/pre_suspend.d
for i in dnsmasq.rc hostapd.rc isc-dhcp-server.rc networking.rc pptpd.rc racoon.rc xl2tpd.rc; do
	echo -n "[ln] extras/acpid-suspend/pre_suspend.d/${i} /usr/local/etc/acpid-suspend/pre_suspend.d"
		if [ -e /usr/local/etc/acpid-suspend/pre_suspend.d/*${i} ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/acpid-suspend/pre_suspend.d/SX${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
done

# Install - /usr/local/etc/acpid-suspend/post_suspend.d
for i in dnsmasq.rc hostapd.rc isc-dhcp-server.rc networking.rc pptpd.rc racoon.rc vbetool.rc; do
	echo -n "[ln] extras/acpid-suspend/post_suspend.d/${i} /usr/local/etc/acpid-suspend/post_suspend.d"
		if [ -e /usr/local/etc/acpid-suspend/post_suspend.d/*${i} ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/acpid-suspend/post_suspend.d/SX${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
done

# Install - /usr/local/share/webadmin
if cd /usr/local/share/webadmin > /dev/null 2>&1; then
	for i in power power-autosuspend power-autowakeup; do
		echo -n "[ln] webadmin/${i} /usr/local/share/webadmin"
			if [ -e "/usr/local/share/webadmin/${i}" ]; then
				echo ' [EXISTS]'
			else
				ln -s ${PACKAGE_DIR}/webadmin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
			fi
	done
else
	echo 'webadmin is not installed'
fi

# Notification
echo ''
echo ' ! Configure /usr/local/etc/acpid-autosuspend/checklist.d queue'

echo ''
exit 0
