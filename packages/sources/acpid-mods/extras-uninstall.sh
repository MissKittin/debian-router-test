#!/bin/sh
# acpid-mods package
# extras uninstall script

# Settings
PACKAGE_NAME='acpid-mods'

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

# Uninstall - /usr/local/etc/acpid-autosuspend/checklist.d
for i in iptables.rc ipv4.rc ipv6.rc l2tp.rc pptp.rc proftpd.rc samba.rc users.rc vsftpd.rc xorg.rc; do
	echo -n "[rm] /usr/local/etc/acpid-autosuspend/checklist.d/${i}"
		if [ -e /usr/local/etc/acpid-autosuspend/checklist.d/*${i} ]; then
			rm /usr/local/etc/acpid-autosuspend/checklist.d/*${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /usr/local/etc/acpid-autosuspend/config.rc.d
for i in ipvx.rc l2tp.rc pptp.rc; do
	echo -n "[rm] /usr/local/etc/acpid-autosuspend/config.rc.d/${i}"
		if [ -e "/usr/local/etc/acpid-autosuspend/config.rc.d/${i}" ]; then
			rm /usr/local/etc/acpid-autosuspend/config.rc.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /usr/local/etc/acpid-suspend/pre_suspend.d
for i in dnsmasq.rc hostapd.rc isc-dhcp-server.rc networking.rc pptpd.rc racoon.rc xl2tpd.rc; do
	echo -n "[rm] /usr/local/etc/acpid-suspend/pre_suspend.d/${i}"
		if [ -e /usr/local/etc/acpid-suspend/pre_suspend.d/*${i} ]; then
			rm /usr/local/etc/acpid-suspend/pre_suspend.d/*${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /usr/local/etc/acpid-suspend/post_suspend.d
for i in dnsmasq.rc hostapd.rc isc-dhcp-server.rc networking.rc pptpd.rc racoon.rc vbetool.rc; do
	echo -n "[rm] /usr/local/etc/acpid-suspend/post_suspend.d/${i}"
		if [ -e /usr/local/etc/acpid-suspend/post_suspend.d/*${i} ]; then
			rm /usr/local/etc/acpid-suspend/post_suspend.d/*${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

# Uninstall - /usr/local/share/webadmin
cd /usr/local/share/webadmin
for i in power power-autosuspend power-autowakeup; do
	echo -n "[rm] /usr/local/share/webadmin/${i}"
		if [ -e "/usr/local/share/webadmin/${i}" ]; then
			rm /usr/local/share/webadmin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		else
			echo ' [NOT EXISTS]'
		fi
done

echo ''
exit 0
