#!/bin/sh
# misc package
# build script
do_chown='false'

PACKAGE_NAME='misc'

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
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/S99correct-wake-on-lan.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/S99correct-wake-on-lan.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/S99ntpdate-daemon.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/S99ntpdate-daemon.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon
chmod 755 ./extras/etc/notify-daemon
${do_chown} && chown root:root ./extras/etc/notify-daemon/critical-events.rc.d
chmod 755 ./extras/etc/notify-daemon/critical-events.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/critical-events.rc.d/cpu.rc
chmod 644 ./extras/etc/notify-daemon/critical-events.rc.d/cpu.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d
chmod 755 ./extras/etc/notify-daemon/events.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/smart.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/smart.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/system-autoupdate.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/system-autoupdate.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/dpkg_rubbish.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/dpkg_rubbish.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/apt-update.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/apt-update.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/ssh.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/ssh.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/obsolete-kernels.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/obsolete-kernels.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/apt.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/apt.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d
chmod 755 ./extras/etc/rc.local.d
${do_chown} && chown root:root ./extras/etc/rc.local.d/PK99_zz-fs-ssd-tweaks.rc
chmod 644 ./extras/etc/rc.local.d/PK99_zz-fs-ssd-tweaks.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_ntpdate.rc
chmod 644 ./extras/etc/rc.local.d/PKx_ntpdate.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_zram.rc
chmod 644 ./extras/etc/rc.local.d/PKx_zram.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_autoupdate.rc
chmod 644 ./extras/etc/rc.local.d/PKx_autoupdate.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_set-sensors.rc
chmod 644 ./extras/etc/rc.local.d/PKx_set-sensors.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_correct-wake-on-lan.rc
chmod 644 ./extras/etc/rc.local.d/PKx_correct-wake-on-lan.rc
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_cpufreq.rc
chmod 644 ./extras/etc/rc.local.d/PKx_cpufreq.rc
${do_chown} && chown root:root ./extras/etc/dnsmasq.d
chmod 755 ./extras/etc/dnsmasq.d
${do_chown} && chown root:root ./extras/etc/dnsmasq.d/ddns.conf
chmod 644 ./extras/etc/dnsmasq.d/ddns.conf
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/motd
chmod 644 ./etc/motd
${do_chown} && chown root:root ./etc/issue
chmod 644 ./etc/issue
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
${do_chown} && chown root:root ./sbin/set-zram.sh
chmod 750 ./sbin/set-zram.sh
${do_chown} && chown root:root ./sbin/generate-ddns-hosts.sh
chmod 750 ./sbin/generate-ddns-hosts.sh
${do_chown} && chown root:root ./sbin/system-autoupdate.sh
chmod 640 ./sbin/system-autoupdate.sh
${do_chown} && chown root:root ./sbin/correct-wake-on-lan.sh
chmod 640 ./sbin/correct-wake-on-lan.sh
${do_chown} && chown root:root ./sbin/apt-check
chmod 750 ./sbin/apt-check
${do_chown} && chown root:root ./sbin/ntpdate-daemon.sh
chmod 640 ./sbin/ntpdate-daemon.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

chmod 644 ./.build.sh
echo ''
exit 0
