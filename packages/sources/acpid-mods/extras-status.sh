#!/bin/sh
# acpid-mods package
# extras status check
broken=false
installed=false

# Settings
PACKAGE_NAME='acpid-mods'

# Splash
echo ''
echo " ${PACKAGE_NAME} - extras"
echo ''

# /usr/local/etc/acpid-autosuspend/checklist.d
for i in iptables.rc ipv4.rc ipv6.rc l2tp.rc pptp.rc proftpd.rc samba.rc users.rc vsftpd.rc xorg.rc; do
	echo -n "/usr/local/etc/acpid-autosuspend/checklist.d/${i}"
		if [ -L /usr/local/etc/acpid-autosuspend/checklist.d/*${i} ] && [ -e /usr/local/etc/acpid-autosuspend/checklist.d/*${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /usr/local/etc/acpid-autosuspend/config.rc.d
for i in ipvx.rc l2tp.rc pptp.rc; do
	echo -n "/usr/local/etc/acpid-autosuspend/config.rc.d/${i}"
		if [ -L /usr/local/etc/acpid-autosuspend/config.rc.d/${i} ] && [ -e /usr/local/etc/acpid-autosuspend/config.rc.d/${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /usr/local/etc/acpid-suspend/pre_suspend.d
for i in dnsmasq.rc hostapd.rc isc-dhcp-server.rc networking.rc pptpd.rc racoon.rc xl2tpd.rc; do
	echo -n "/usr/local/etc/acpid-suspend/pre_suspend.d/${i}"
		if [ -L /usr/local/etc/acpid-suspend/pre_suspend.d/*${i} ] && [ -e /usr/local/etc/acpid-suspend/pre_suspend.d/*${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /usr/local/etc/acpid-suspend/post_suspend.d
for i in dnsmasq.rc hostapd.rc isc-dhcp-server.rc networking.rc pptpd.rc racoon.rc vbetool.rc; do
	echo -n "/usr/local/etc/acpid-suspend/post_suspend.d/${i}"
		if [ -L /usr/local/etc/acpid-suspend/post_suspend.d/*${i} ] && [ -e /usr/local/etc/acpid-suspend/post_suspend.d/*${i} ]; then
			installed=true
			echo ' [ OK ]'
		else
			broken=true
			echo ' [NOT INSTALLED]'
		fi
done

# /usr/local/share/webadmin
for i in power power-autosuspend power-autowakeup; do
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
