#!/bin/sh
# firewall package
# build script
do_chown='false'

PACKAGE_NAME='firewall'

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
${do_chown} && chown root:root ./extras/etc/notify-daemon
chmod 755 ./extras/etc/notify-daemon
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d
chmod 755 ./extras/etc/notify-daemon/events.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/firewall6.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/firewall6.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/routing.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/routing.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/firewall.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/firewall.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/default_gateway.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/default_gateway.rc
${do_chown} && chown root:root ./webadmin
chmod 755 ./webadmin
${do_chown} && chown root:root ./webadmin/lib
chmod 755 ./webadmin/lib
${do_chown} && chown root:root ./webadmin/lib/shell
chmod 755 ./webadmin/lib/shell
${do_chown} && chown root:root ./webadmin/lib/shell/list-iptables-settings.rc
chmod 644 ./webadmin/lib/shell/list-iptables-settings.rc
${do_chown} && chown root:root ./webadmin/net-forwarding
chmod 755 ./webadmin/net-forwarding
${do_chown} && chown root:root ./webadmin/net-forwarding/description.php
chmod 644 ./webadmin/net-forwarding/description.php
${do_chown} && chown root:root ./webadmin/net-forwarding/index.php
chmod 644 ./webadmin/net-forwarding/index.php
${do_chown} && chown root:root ./webadmin/net-forwarding/shell.sh
chmod 755 ./webadmin/net-forwarding/shell.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_permanently-banned.rc
chmod 644 ./etc/rc.local.d/PKx_permanently-banned.rc
${do_chown} && chown root:root ./etc/firewall
chmod 755 ./etc/firewall
${do_chown} && chown root:root ./etc/firewall/firewall.rc.cfg.d
chmod 755 ./etc/firewall/firewall.rc.cfg.d
${do_chown} && chown root:root ./etc/firewall/firewall.rc.cfg.d/permanently-banned.rc
chmod 644 ./etc/firewall/firewall.rc.cfg.d/permanently-banned.rc
${do_chown} && chown root:root ./etc/firewall/firewall.rc.cfg.d/ip-blacklist.rc
chmod 644 ./etc/firewall/firewall.rc.cfg.d/ip-blacklist.rc
${do_chown} && chown root:root ./etc/firewall/routing.rc
chmod 644 ./etc/firewall/routing.rc
${do_chown} && chown root:root ./etc/firewall/networks.rc
chmod 644 ./etc/firewall/networks.rc
${do_chown} && chown root:root ./etc/firewall/firewall.rc
chmod 644 ./etc/firewall/firewall.rc
${do_chown} && chown root:root ./etc/firewall/firewall.rc.d
chmod 755 ./etc/firewall/firewall.rc.d
${do_chown} && chown root:root ./etc/firewall/firewall.rc.d/permanently-banned.rc
chmod 644 ./etc/firewall/firewall.rc.d/permanently-banned.rc
${do_chown} && chown root:root ./etc/firewall/firewall.rc.d/ip-blacklist.rc
chmod 644 ./etc/firewall/firewall.rc.d/ip-blacklist.rc
${do_chown} && chown root:root ./etc/firewall/firewall.rc.d/ddos.rc
chmod 644 ./etc/firewall/firewall.rc.d/ddos.rc
${do_chown} && chown root:root ./etc/firewall/forwarding.rc
chmod 644 ./etc/firewall/forwarding.rc
${do_chown} && chown root:root ./etc/firewall/settings.rc
chmod 644 ./etc/firewall/settings.rc
${do_chown} && chown root:root ./etc/firewall6
chmod 755 ./etc/firewall6
${do_chown} && chown root:root ./etc/firewall6/routing.rc
chmod 644 ./etc/firewall6/routing.rc
${do_chown} && chown root:root ./etc/firewall6/firewall.rc
chmod 644 ./etc/firewall6/firewall.rc
${do_chown} && chown root:root ./etc/firewall6/forwarding.rc
chmod 644 ./etc/firewall6/forwarding.rc
${do_chown} && chown root:root ./etc/firewall6/settings.rc
chmod 644 ./etc/firewall6/settings.rc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/firewall
chmod 755 ./etc/init.d/firewall
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
${do_chown} && chown root:root ./sbin/permanently-banned.sh
chmod 644 ./sbin/permanently-banned.sh
${do_chown} && chown root:root ./sbin/firewall.sh
chmod 750 ./sbin/firewall.sh
${do_chown} && chown root:root ./sbin/firewall6.sh
chmod 750 ./sbin/firewall6.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

ln -s ../firewall/networks.rc ./etc/firewall6/networks.rc

chmod 644 ./.build.sh
echo ''
exit 0
