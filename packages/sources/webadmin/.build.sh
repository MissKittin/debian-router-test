#!/bin/sh
# webadmin package
# build script
do_chown='false'

PACKAGE_NAME='webadmin'

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
${do_chown} && chown root:root ./extras/etc/notify-daemon/journal-manager.rc.d
chmod 755 ./extras/etc/notify-daemon/journal-manager.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/journal-manager.rc.d/www.rc
chmod 644 ./extras/etc/notify-daemon/journal-manager.rc.d/www.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d
chmod 755 ./extras/etc/notify-daemon/events.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/sudoers.d
chmod 755 ./etc/sudoers.d
${do_chown} && chown root:root ./etc/sudoers.d/webadmin
chmod 640 ./etc/sudoers.d/webadmin
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_webadmin.rc
chmod 644 ./etc/rc.local.d/PKx_webadmin.rc
${do_chown} && chown root:root ./etc/authbind
chmod 755 ./etc/authbind
${do_chown} && chown root:root ./etc/authbind/byport
chmod 755 ./etc/authbind/byport
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/webadmin
chmod 755 ./share/webadmin
${do_chown} && chown root:root ./share/webadmin/net-routing
chmod 755 ./share/webadmin/net-routing
${do_chown} && chown root:root ./share/webadmin/net-routing/description.php
chmod 644 ./share/webadmin/net-routing/description.php
${do_chown} && chown root:root ./share/webadmin/net-routing/index.php
chmod 644 ./share/webadmin/net-routing/index.php
${do_chown} && chown root:root ./share/webadmin/net-routing/shell.sh
chmod 755 ./share/webadmin/net-routing/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-bwusage
chmod 755 ./share/webadmin/net-bwusage
${do_chown} && chown root:root ./share/webadmin/net-bwusage/shell.php
chmod 644 ./share/webadmin/net-bwusage/shell.php
${do_chown} && chown root:root ./share/webadmin/net-bwusage/config.rc
chmod 644 ./share/webadmin/net-bwusage/config.rc
${do_chown} && chown root:root ./share/webadmin/net-bwusage/description.php
chmod 644 ./share/webadmin/net-bwusage/description.php
${do_chown} && chown root:root ./share/webadmin/net-bwusage/index.php
chmod 644 ./share/webadmin/net-bwusage/index.php
${do_chown} && chown root:root ./share/webadmin/net-bwusage/script
chmod 755 ./share/webadmin/net-bwusage/script
${do_chown} && chown root:root ./share/webadmin/net-bwusage/script/index.full.php
chmod 644 ./share/webadmin/net-bwusage/script/index.full.php
${do_chown} && chown root:root ./share/webadmin/net-bwusage/script/index.min.php
chmod 644 ./share/webadmin/net-bwusage/script/index.min.php
${do_chown} && chown root:root ./share/webadmin/net-bwusage/shell.sh
chmod 755 ./share/webadmin/net-bwusage/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-bwusage/style
chmod 755 ./share/webadmin/net-bwusage/style
${do_chown} && chown root:root ./share/webadmin/net-bwusage/style/index.full.php
chmod 644 ./share/webadmin/net-bwusage/style/index.full.php
${do_chown} && chown root:root ./share/webadmin/net-bwusage/style/index.min.php
chmod 644 ./share/webadmin/net-bwusage/style/index.min.php
${do_chown} && chown root:root ./share/webadmin/net-vpn
chmod 755 ./share/webadmin/net-vpn
${do_chown} && chown root:root ./share/webadmin/net-vpn/DEPRECATED.TXT
chmod 644 ./share/webadmin/net-vpn/DEPRECATED.TXT
${do_chown} && chown root:root ./share/webadmin/net-vpn/description.php
chmod 644 ./share/webadmin/net-vpn/description.php
${do_chown} && chown root:root ./share/webadmin/net-vpn/index.php
chmod 644 ./share/webadmin/net-vpn/index.php
${do_chown} && chown root:root ./share/webadmin/net-vpn/shell.sh
chmod 755 ./share/webadmin/net-vpn/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-ifaces
chmod 755 ./share/webadmin/net-ifaces
${do_chown} && chown root:root ./share/webadmin/net-ifaces/info.php
chmod 644 ./share/webadmin/net-ifaces/info.php
${do_chown} && chown root:root ./share/webadmin/net-ifaces/description.php
chmod 644 ./share/webadmin/net-ifaces/description.php
${do_chown} && chown root:root ./share/webadmin/net-ifaces/index.php
chmod 644 ./share/webadmin/net-ifaces/index.php
${do_chown} && chown root:root ./share/webadmin/net-ifaces/shell.sh
chmod 755 ./share/webadmin/net-ifaces/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-ap
chmod 755 ./share/webadmin/net-ap
${do_chown} && chown root:root ./share/webadmin/net-ap/DEPRECATED.TXT
chmod 644 ./share/webadmin/net-ap/DEPRECATED.TXT
${do_chown} && chown root:root ./share/webadmin/net-ap/description.php
chmod 644 ./share/webadmin/net-ap/description.php
${do_chown} && chown root:root ./share/webadmin/net-ap/index.php
chmod 644 ./share/webadmin/net-ap/index.php
${do_chown} && chown root:root ./share/webadmin/net-ap/shell.sh
chmod 755 ./share/webadmin/net-ap/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-devices
chmod 755 ./share/webadmin/net-devices
${do_chown} && chown root:root ./share/webadmin/net-devices/description.php
chmod 644 ./share/webadmin/net-devices/description.php
${do_chown} && chown root:root ./share/webadmin/net-devices/index.php
chmod 644 ./share/webadmin/net-devices/index.php
${do_chown} && chown root:root ./share/webadmin/net-devices/shell.sh
chmod 755 ./share/webadmin/net-devices/shell.sh
${do_chown} && chown root:root ./share/webadmin/login-plugins
chmod 755 ./share/webadmin/login-plugins
${do_chown} && chown root:root ./share/webadmin/login-plugins/01_internet-info
chmod 755 ./share/webadmin/login-plugins/01_internet-info
${do_chown} && chown root:root ./share/webadmin/login-plugins/01_internet-info/internet-info.php
chmod 644 ./share/webadmin/login-plugins/01_internet-info/internet-info.php
${do_chown} && chown root:root ./share/webadmin/login-plugins/01_internet-info/config.rc
chmod 644 ./share/webadmin/login-plugins/01_internet-info/config.rc
${do_chown} && chown root:root ./share/webadmin/login-plugins/01_internet-info/shell.sh
chmod 755 ./share/webadmin/login-plugins/01_internet-info/shell.sh
${do_chown} && chown root:root ./share/webadmin/lib
chmod 755 ./share/webadmin/lib
${do_chown} && chown root:root ./share/webadmin/lib/shell
chmod 755 ./share/webadmin/lib/shell
${do_chown} && chown root:root ./share/webadmin/lib/shell/path.rc
chmod 644 ./share/webadmin/lib/shell/path.rc
${do_chown} && chown root:root ./share/webadmin/lib/shell/check-ipv6.rc
chmod 644 ./share/webadmin/lib/shell/check-ipv6.rc
${do_chown} && chown root:root ./share/webadmin/lib/shell/check-service.rc
chmod 644 ./share/webadmin/lib/shell/check-service.rc
${do_chown} && chown root:root ./share/webadmin/lib/shell/net-routing-list.rc
chmod 644 ./share/webadmin/lib/shell/net-routing-list.rc
${do_chown} && chown root:root ./share/webadmin/lib/shell/list-interfaces.rc
chmod 644 ./share/webadmin/lib/shell/list-interfaces.rc
${do_chown} && chown root:root ./share/webadmin/lib/shell/public-ipv4.rc
chmod 644 ./share/webadmin/lib/shell/public-ipv4.rc
${do_chown} && chown root:root ./share/webadmin/lib/shell/superuser.sh
chmod 750 ./share/webadmin/lib/shell/superuser.sh
${do_chown} && chown root:root ./share/webadmin/lib/range_icons
chmod 755 ./share/webadmin/lib/range_icons
${do_chown} && chown root:root ./share/webadmin/lib/range_icons/range_5.png
chmod 644 ./share/webadmin/lib/range_icons/range_5.png
${do_chown} && chown root:root ./share/webadmin/lib/range_icons/range_2.png
chmod 644 ./share/webadmin/lib/range_icons/range_2.png
${do_chown} && chown root:root ./share/webadmin/lib/range_icons/range_4.png
chmod 644 ./share/webadmin/lib/range_icons/range_4.png
${do_chown} && chown root:root ./share/webadmin/lib/range_icons/range_3.png
chmod 644 ./share/webadmin/lib/range_icons/range_3.png
${do_chown} && chown root:root ./share/webadmin/lib/range_icons/range_1.png
chmod 644 ./share/webadmin/lib/range_icons/range_1.png
${do_chown} && chown root:root ./share/webadmin/lib/range_icons/range_0.png
chmod 644 ./share/webadmin/lib/range_icons/range_0.png
${do_chown} && chown root:root ./share/webadmin/lib/opt_htmlheaders
chmod 755 ./share/webadmin/lib/opt_htmlheaders
${do_chown} && chown root:root ./share/webadmin/lib/opt_htmlheaders/jquery.php
chmod 644 ./share/webadmin/lib/opt_htmlheaders/jquery.php
${do_chown} && chown root:root ./share/webadmin/lib/favicon
chmod 755 ./share/webadmin/lib/favicon
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-120x120.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-120x120.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-144x144.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-144x144.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon-128.png
chmod 644 ./share/webadmin/lib/favicon/favicon-128.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-114x114.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-114x114.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon.php
chmod 644 ./share/webadmin/lib/favicon/favicon.php
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-72x72.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-72x72.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-76x76.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-76x76.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-57x57.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-57x57.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/mstile-310x150.png
chmod 644 ./share/webadmin/lib/favicon/mstile-310x150.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/mstile-144x144.png
chmod 644 ./share/webadmin/lib/favicon/mstile-144x144.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon-96x96.png
chmod 644 ./share/webadmin/lib/favicon/favicon-96x96.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-60x60.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-60x60.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/apple-touch-icon-152x152.png
chmod 644 ./share/webadmin/lib/favicon/apple-touch-icon-152x152.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon-196x196.png
chmod 644 ./share/webadmin/lib/favicon/favicon-196x196.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/mstile-150x150.png
chmod 644 ./share/webadmin/lib/favicon/mstile-150x150.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/mstile-310x310.png
chmod 644 ./share/webadmin/lib/favicon/mstile-310x310.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon-32x32.png
chmod 644 ./share/webadmin/lib/favicon/favicon-32x32.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon.ico
chmod 644 ./share/webadmin/lib/favicon/favicon.ico
${do_chown} && chown root:root ./share/webadmin/lib/favicon/favicon-16x16.png
chmod 644 ./share/webadmin/lib/favicon/favicon-16x16.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/source.png
chmod 644 ./share/webadmin/lib/favicon/source.png
${do_chown} && chown root:root ./share/webadmin/lib/favicon/mstile-70x70.png
chmod 644 ./share/webadmin/lib/favicon/mstile-70x70.png
${do_chown} && chown root:root ./share/webadmin/net-wicd
chmod 755 ./share/webadmin/net-wicd
${do_chown} && chown root:root ./share/webadmin/net-wicd/body.php
chmod 644 ./share/webadmin/net-wicd/body.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/theme_default.php
chmod 644 ./share/webadmin/net-wicd/theme_default.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/theme_bright.php
chmod 644 ./share/webadmin/net-wicd/theme_bright.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/shell.php
chmod 644 ./share/webadmin/net-wicd/shell.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/script.php
chmod 644 ./share/webadmin/net-wicd/script.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/description.php
chmod 644 ./share/webadmin/net-wicd/description.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/wicd-config-injection.sh
chmod 755 ./share/webadmin/net-wicd/wicd-config-injection.sh
${do_chown} && chown root:root ./share/webadmin/net-wicd/index.php
chmod 644 ./share/webadmin/net-wicd/index.php
${do_chown} && chown root:root ./share/webadmin/net-wicd/shell.sh
chmod 755 ./share/webadmin/net-wicd/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-wicd/style.php
chmod 644 ./share/webadmin/net-wicd/style.php
${do_chown} && chown root:root ./share/webadmin/sys-daemons
chmod 755 ./share/webadmin/sys-daemons
${do_chown} && chown root:root ./share/webadmin/sys-daemons/description.php
chmod 644 ./share/webadmin/sys-daemons/description.php
${do_chown} && chown root:root ./share/webadmin/sys-daemons/index.php
chmod 644 ./share/webadmin/sys-daemons/index.php
${do_chown} && chown root:root ./share/webadmin/sys-daemons/config.php
chmod 644 ./share/webadmin/sys-daemons/config.php
${do_chown} && chown root:root ./share/webadmin/sys-daemons/shell.sh
chmod 755 ./share/webadmin/sys-daemons/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-wired
chmod 755 ./share/webadmin/net-wired
${do_chown} && chown root:root ./share/webadmin/net-wired/description.php
chmod 644 ./share/webadmin/net-wired/description.php
${do_chown} && chown root:root ./share/webadmin/net-wired/index.php
chmod 644 ./share/webadmin/net-wired/index.php
${do_chown} && chown root:root ./share/webadmin/net-wired/shell.sh
chmod 755 ./share/webadmin/net-wired/shell.sh
${do_chown} && chown root:root ./share/webadmin/sys-updates
chmod 755 ./share/webadmin/sys-updates
${do_chown} && chown root:root ./share/webadmin/sys-updates/shell.php
chmod 644 ./share/webadmin/sys-updates/shell.php
${do_chown} && chown root:root ./share/webadmin/sys-updates/DEPRECATED.TXT
chmod 644 ./share/webadmin/sys-updates/DEPRECATED.TXT
${do_chown} && chown root:root ./share/webadmin/sys-updates/description.php
chmod 644 ./share/webadmin/sys-updates/description.php
${do_chown} && chown root:root ./share/webadmin/sys-updates/index.php
chmod 644 ./share/webadmin/sys-updates/index.php
${do_chown} && chown root:root ./share/webadmin/sys-updates/menu-addon.php
chmod 644 ./share/webadmin/sys-updates/menu-addon.php
${do_chown} && chown root:root ./share/webadmin/sys-updates/shell.sh
chmod 755 ./share/webadmin/sys-updates/shell.sh
${do_chown} && chown root:root ./share/webadmin/net-wifi
chmod 755 ./share/webadmin/net-wifi
${do_chown} && chown root:root ./share/webadmin/net-wifi/shell.php
chmod 644 ./share/webadmin/net-wifi/shell.php
${do_chown} && chown root:root ./share/webadmin/net-wifi/script.php
chmod 644 ./share/webadmin/net-wifi/script.php
${do_chown} && chown root:root ./share/webadmin/net-wifi/DEPRECATED.TXT
chmod 644 ./share/webadmin/net-wifi/DEPRECATED.TXT
${do_chown} && chown root:root ./share/webadmin/net-wifi/description.php
chmod 644 ./share/webadmin/net-wifi/description.php
${do_chown} && chown root:root ./share/webadmin/net-wifi/index.php
chmod 644 ./share/webadmin/net-wifi/index.php
${do_chown} && chown root:root ./share/webadmin/net-wifi/shell.sh
chmod 755 ./share/webadmin/net-wifi/shell.sh
${do_chown} && chown root:root ./share/webadmin/sys-clock
chmod 755 ./share/webadmin/sys-clock
${do_chown} && chown root:root ./share/webadmin/sys-clock/shell.php
chmod 644 ./share/webadmin/sys-clock/shell.php
${do_chown} && chown root:root ./share/webadmin/sys-clock/description.php
chmod 644 ./share/webadmin/sys-clock/description.php
${do_chown} && chown root:root ./share/webadmin/sys-clock/index.php
chmod 644 ./share/webadmin/sys-clock/index.php
${do_chown} && chown root:root ./share/webadmin/sys-clock/shell.sh
chmod 755 ./share/webadmin/sys-clock/shell.sh
${do_chown} && chown root:root ./share/webadmin/sys-users
chmod 755 ./share/webadmin/sys-users
${do_chown} && chown root:root ./share/webadmin/sys-users/description.php
chmod 644 ./share/webadmin/sys-users/description.php
${do_chown} && chown root:root ./share/webadmin/sys-users/index.php
chmod 644 ./share/webadmin/sys-users/index.php
${do_chown} && chown root:root ./share/webadmin/sys-users/shell.sh
chmod 755 ./share/webadmin/sys-users/shell.sh
${do_chown} && chown root:root ./share/webadmin/sys-logs
chmod 755 ./share/webadmin/sys-logs
${do_chown} && chown root:root ./share/webadmin/sys-logs/description.php
chmod 644 ./share/webadmin/sys-logs/description.php
${do_chown} && chown root:root ./share/webadmin/sys-logs/index.php
chmod 644 ./share/webadmin/sys-logs/index.php
${do_chown} && chown root:root ./share/webadmin/sys-logs/config.php
chmod 644 ./share/webadmin/sys-logs/config.php
${do_chown} && chown root:root ./share/webadmin/sys-logs/shell.sh
chmod 755 ./share/webadmin/sys-logs/shell.sh
${do_chown} && chown root:root ./share/webadmin/sys-storage
chmod 755 ./share/webadmin/sys-storage
${do_chown} && chown root:root ./share/webadmin/sys-storage/description.php
chmod 644 ./share/webadmin/sys-storage/description.php
${do_chown} && chown root:root ./share/webadmin/sys-storage/index.php
chmod 644 ./share/webadmin/sys-storage/index.php
${do_chown} && chown root:root ./share/webadmin/sys-storage/script
chmod 755 ./share/webadmin/sys-storage/script
${do_chown} && chown root:root ./share/webadmin/sys-storage/script/index.full.php
chmod 644 ./share/webadmin/sys-storage/script/index.full.php
${do_chown} && chown root:root ./share/webadmin/sys-storage/script/index.min.php
chmod 644 ./share/webadmin/sys-storage/script/index.min.php
${do_chown} && chown root:root ./share/webadmin/sys-storage/config.php
chmod 644 ./share/webadmin/sys-storage/config.php
${do_chown} && chown root:root ./share/webadmin/sys-storage/shell.sh
chmod 755 ./share/webadmin/sys-storage/shell.sh
${do_chown} && chown root:root ./share/webadmin/sys-storage/style
chmod 755 ./share/webadmin/sys-storage/style
${do_chown} && chown root:root ./share/webadmin/sys-storage/style/index.full.php
chmod 644 ./share/webadmin/sys-storage/style/index.full.php
${do_chown} && chown root:root ./share/webadmin/sys-storage/style/index.min.php
chmod 644 ./share/webadmin/sys-storage/style/index.min.php
${do_chown} && chown root:root ./share/webadmin/sys-sensors
chmod 755 ./share/webadmin/sys-sensors
${do_chown} && chown root:root ./share/webadmin/sys-sensors/shell.php
chmod 644 ./share/webadmin/sys-sensors/shell.php
${do_chown} && chown root:root ./share/webadmin/sys-sensors/description.php
chmod 644 ./share/webadmin/sys-sensors/description.php
${do_chown} && chown root:root ./share/webadmin/sys-sensors/index.php
chmod 644 ./share/webadmin/sys-sensors/index.php
${do_chown} && chown root:root ./share/webadmin/sys-sensors/shell.sh
chmod 755 ./share/webadmin/sys-sensors/shell.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/webadmin.sh
chmod 755 ./sbin/webadmin.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

echo -n '' > ./etc/authbind/byport/80
chmod 755 ./etc/authbind/byport/80

[ -x './.build-modules.sh' ] && ./.build-modules.sh

chmod 644 ./.build.sh
echo ''
exit 0
