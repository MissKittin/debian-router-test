#!/bin/sh
# acpid-mods package
# build script
do_chown='false'

PACKAGE_NAME='acpid-mods'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi

echo ''
echo 'Building...'
cd "$(dirname "$(readlink -f "${0}")")"

${do_chown} && chown root:root .
chmod 755 .
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/acpid-suspend
chmod 755 ./extras/etc/acpid-suspend
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d
chmod 755 ./extras/etc/acpid-suspend/post_suspend.d
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXracoon.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXracoon.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXvbetool.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXvbetool.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXdnsmasq.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXdnsmasq.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXnetworking.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXnetworking.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXhostapd.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXhostapd.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXpptpd.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXpptpd.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/SXisc-dhcp-server.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/SXisc-dhcp-server.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d
chmod 755 ./extras/etc/acpid-suspend/pre_suspend.d
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXracoon.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXracoon.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXdnsmasq.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXdnsmasq.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXxl2tpd.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXxl2tpd.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXnetworking.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXnetworking.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXhostapd.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXhostapd.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXpptpd.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXpptpd.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/SXisc-dhcp-server.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/SXisc-dhcp-server.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend
chmod 755 ./extras/etc/acpid-autosuspend
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d
chmod 755 ./extras/etc/acpid-autosuspend/checklist.d
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXsamba.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXsamba.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXpptp.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXpptp.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXipv4.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXipv4.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXusers.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXusers.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXl2tp.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXl2tp.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXxorg.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXxorg.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXiptables.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXiptables.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXvsftpd.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXvsftpd.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXproftpd.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXproftpd.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/checklist.d/SXipv6.rc
chmod 644 ./extras/etc/acpid-autosuspend/checklist.d/SXipv6.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/config.rc.d
chmod 755 ./extras/etc/acpid-autosuspend/config.rc.d
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/config.rc.d/ipvx.rc
chmod 644 ./extras/etc/acpid-autosuspend/config.rc.d/ipvx.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/config.rc.d/pptp.rc
chmod 644 ./extras/etc/acpid-autosuspend/config.rc.d/pptp.rc
${do_chown} && chown root:root ./extras/etc/acpid-autosuspend/config.rc.d/l2tp.rc
chmod 644 ./extras/etc/acpid-autosuspend/config.rc.d/l2tp.rc
${do_chown} && chown root:root ./webadmin
chmod 755 ./webadmin
${do_chown} && chown root:root ./webadmin/power-autowakeup
chmod 755 ./webadmin/power-autowakeup
${do_chown} && chown root:root ./webadmin/power-autowakeup/description.php
chmod 644 ./webadmin/power-autowakeup/description.php
${do_chown} && chown root:root ./webadmin/power-autowakeup/index.php
chmod 644 ./webadmin/power-autowakeup/index.php
${do_chown} && chown root:root ./webadmin/power-autowakeup/shell.sh
chmod 755 ./webadmin/power-autowakeup/shell.sh
${do_chown} && chown root:root ./webadmin/power-autosuspend
chmod 755 ./webadmin/power-autosuspend
${do_chown} && chown root:root ./webadmin/power-autosuspend/description.php
chmod 644 ./webadmin/power-autosuspend/description.php
${do_chown} && chown root:root ./webadmin/power-autosuspend/index.php
chmod 644 ./webadmin/power-autosuspend/index.php
${do_chown} && chown root:root ./webadmin/power-autosuspend/shell.sh
chmod 755 ./webadmin/power-autosuspend/shell.sh
${do_chown} && chown root:root ./webadmin/power
chmod 755 ./webadmin/power
${do_chown} && chown root:root ./webadmin/power/description.php
chmod 644 ./webadmin/power/description.php
${do_chown} && chown root:root ./webadmin/power/index.php
chmod 644 ./webadmin/power/index.php
${do_chown} && chown root:root ./webadmin/power/menu-addon.php
chmod 644 ./webadmin/power/menu-addon.php
${do_chown} && chown root:root ./webadmin/power/shell.sh
chmod 755 ./webadmin/power/shell.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/acpid-suspend
chmod 755 ./etc/acpid-suspend
${do_chown} && chown root:root ./etc/acpid-suspend/calendar.rc
chmod 644 ./etc/acpid-suspend/calendar.rc
${do_chown} && chown root:root ./etc/acpid-suspend/post_suspend.d
chmod 755 ./etc/acpid-suspend/post_suspend.d
${do_chown} && chown root:root ./etc/acpid-suspend/post_suspend.d/PLACEHOLDER
chmod 644 ./etc/acpid-suspend/post_suspend.d/PLACEHOLDER
${do_chown} && chown root:root ./etc/acpid-suspend/config.rc
chmod 644 ./etc/acpid-suspend/config.rc
${do_chown} && chown root:root ./etc/acpid-suspend/pre_suspend.d
chmod 755 ./etc/acpid-suspend/pre_suspend.d
${do_chown} && chown root:root ./etc/acpid-suspend/pre_suspend.d/S99fs_sync.rc
chmod 644 ./etc/acpid-suspend/pre_suspend.d/S99fs_sync.rc
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_acpid-autosuspend.rc
chmod 644 ./etc/rc.local.d/PKx_acpid-autosuspend.rc
${do_chown} && chown root:root ./etc/acpid-choice.rc
chmod 644 ./etc/acpid-choice.rc
${do_chown} && chown root:root ./etc/acpi
chmod 755 ./etc/acpi
${do_chown} && chown root:root ./etc/acpi/powerbtn.sh
chmod 755 ./etc/acpi/powerbtn.sh
${do_chown} && chown root:root ./etc/acpid-autosuspend
chmod 755 ./etc/acpid-autosuspend
${do_chown} && chown root:root ./etc/acpid-autosuspend/calendar.rc
chmod 644 ./etc/acpid-autosuspend/calendar.rc
${do_chown} && chown root:root ./etc/acpid-autosuspend/config.rc
chmod 644 ./etc/acpid-autosuspend/config.rc
${do_chown} && chown root:root ./etc/acpid-autosuspend/checklist.d
chmod 755 ./etc/acpid-autosuspend/checklist.d
${do_chown} && chown root:root ./etc/acpid-autosuspend/checklist.d/S99temp_disabled.rc
chmod 644 ./etc/acpid-autosuspend/checklist.d/S99temp_disabled.rc
${do_chown} && chown root:root ./etc/acpid-autosuspend/config.rc.d
chmod 755 ./etc/acpid-autosuspend/config.rc.d
${do_chown} && chown root:root ./etc/acpid-autosuspend/config.rc.d/PLACEHOLDER
chmod 644 ./etc/acpid-autosuspend/config.rc.d/PLACEHOLDER
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/acpid-autosuspend.sh
chmod 755 ./etc/init.d/acpid-autosuspend.sh
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/acpid-suspend.sh
chmod 750 ./sbin/acpid-suspend.sh
${do_chown} && chown root:root ./sbin/acpid-choice.sh.old
chmod 640 ./sbin/acpid-choice.sh.old
${do_chown} && chown root:root ./sbin/acpid-choice.sh
chmod 750 ./sbin/acpid-choice.sh
${do_chown} && chown root:root ./sbin/acpid-autosuspend.sh
chmod 750 ./sbin/acpid-autosuspend.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

rm ./etc/acpid-autosuspend/config.rc.d/PLACEHOLDER
rm ./etc/acpid-suspend/post_suspend.d/PLACEHOLDER


chmod 644 ./.build.sh
echo ''
exit 0
