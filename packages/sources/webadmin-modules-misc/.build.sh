#!/bin/sh
# webadmin-modules-misc package
# build script
do_chown='false'

PACKAGE_NAME='webadmin-modules-misc'

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
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./webadmin
chmod 755 ./webadmin
${do_chown} && chown root:root ./webadmin/net-devices
chmod 755 ./webadmin/net-devices
${do_chown} && chown root:root ./webadmin/net-devices/description.php
chmod 644 ./webadmin/net-devices/description.php
${do_chown} && chown root:root ./webadmin/net-devices/config.rc
chmod 644 ./webadmin/net-devices/config.rc
${do_chown} && chown root:root ./webadmin/net-devices/shell.sh
chmod 755 ./webadmin/net-devices/shell.sh
${do_chown} && chown root:root ./webadmin/net-devices/index.php
chmod 644 ./webadmin/net-devices/index.php
${do_chown} && chown root:root ./webadmin/net-bwusage
chmod 755 ./webadmin/net-bwusage
${do_chown} && chown root:root ./webadmin/net-bwusage/api
chmod 755 ./webadmin/net-bwusage/api
${do_chown} && chown root:root ./webadmin/net-bwusage/api/shell.sh
chmod 755 ./webadmin/net-bwusage/api/shell.sh
${do_chown} && chown root:root ./webadmin/net-bwusage/api/index.php
chmod 644 ./webadmin/net-bwusage/api/index.php
${do_chown} && chown root:root ./webadmin/net-bwusage/config.rc
chmod 644 ./webadmin/net-bwusage/config.rc
${do_chown} && chown root:root ./webadmin/net-bwusage/style
chmod 755 ./webadmin/net-bwusage/style
${do_chown} && chown root:root ./webadmin/net-bwusage/style/index.min.php
chmod 644 ./webadmin/net-bwusage/style/index.min.php
${do_chown} && chown root:root ./webadmin/net-bwusage/style/index.full.php
chmod 644 ./webadmin/net-bwusage/style/index.full.php
${do_chown} && chown root:root ./webadmin/net-bwusage/description.php
chmod 644 ./webadmin/net-bwusage/description.php
${do_chown} && chown root:root ./webadmin/net-bwusage/index.php
chmod 644 ./webadmin/net-bwusage/index.php
${do_chown} && chown root:root ./webadmin/net-bwusage/script
chmod 755 ./webadmin/net-bwusage/script
${do_chown} && chown root:root ./webadmin/net-bwusage/script/index.min.php
chmod 644 ./webadmin/net-bwusage/script/index.min.php
${do_chown} && chown root:root ./webadmin/net-bwusage/script/index.full.php
chmod 644 ./webadmin/net-bwusage/script/index.full.php
${do_chown} && chown root:root ./webadmin/sys-logs
chmod 755 ./webadmin/sys-logs
${do_chown} && chown root:root ./webadmin/sys-logs/config.php
chmod 644 ./webadmin/sys-logs/config.php
${do_chown} && chown root:root ./webadmin/sys-logs/description.php
chmod 644 ./webadmin/sys-logs/description.php
${do_chown} && chown root:root ./webadmin/sys-logs/shell.sh
chmod 755 ./webadmin/sys-logs/shell.sh
${do_chown} && chown root:root ./webadmin/sys-logs/index.php
chmod 644 ./webadmin/sys-logs/index.php
${do_chown} && chown root:root ./webadmin/net-wicd
chmod 755 ./webadmin/net-wicd
${do_chown} && chown root:root ./webadmin/net-wicd/README.TXT
chmod 644 ./webadmin/net-wicd/README.TXT
${do_chown} && chown root:root ./webadmin/net-wicd/js
chmod 755 ./webadmin/net-wicd/js
${do_chown} && chown root:root ./webadmin/net-wicd/js/index.min.php
chmod 644 ./webadmin/net-wicd/js/index.min.php
${do_chown} && chown root:root ./webadmin/net-wicd/js/index.full.php
chmod 644 ./webadmin/net-wicd/js/index.full.php
${do_chown} && chown root:root ./webadmin/net-wicd/remove-webadmin-code.sh
chmod 644 ./webadmin/net-wicd/remove-webadmin-code.sh
${do_chown} && chown root:root ./webadmin/net-wicd/css
chmod 755 ./webadmin/net-wicd/css
${do_chown} && chown root:root ./webadmin/net-wicd/css/index.min.php
chmod 644 ./webadmin/net-wicd/css/index.min.php
${do_chown} && chown root:root ./webadmin/net-wicd/css/index.full.php
chmod 644 ./webadmin/net-wicd/css/index.full.php
${do_chown} && chown root:root ./webadmin/net-wicd/themes
chmod 755 ./webadmin/net-wicd/themes
${do_chown} && chown root:root ./webadmin/net-wicd/themes/default
chmod 755 ./webadmin/net-wicd/themes/default
${do_chown} && chown root:root ./webadmin/net-wicd/themes/default/theme.full.php
chmod 644 ./webadmin/net-wicd/themes/default/theme.full.php
${do_chown} && chown root:root ./webadmin/net-wicd/themes/default/theme.min.php
chmod 644 ./webadmin/net-wicd/themes/default/theme.min.php
${do_chown} && chown root:root ./webadmin/net-wicd/themes/bright
chmod 755 ./webadmin/net-wicd/themes/bright
${do_chown} && chown root:root ./webadmin/net-wicd/themes/bright/theme.full.php
chmod 644 ./webadmin/net-wicd/themes/bright/theme.full.php
${do_chown} && chown root:root ./webadmin/net-wicd/themes/bright/theme.min.php
chmod 644 ./webadmin/net-wicd/themes/bright/theme.min.php
${do_chown} && chown root:root ./webadmin/net-wicd/api
chmod 755 ./webadmin/net-wicd/api
${do_chown} && chown root:root ./webadmin/net-wicd/api/wicd-config-injection.sh
chmod 755 ./webadmin/net-wicd/api/wicd-config-injection.sh
${do_chown} && chown root:root ./webadmin/net-wicd/api/shell.sh
chmod 755 ./webadmin/net-wicd/api/shell.sh
${do_chown} && chown root:root ./webadmin/net-wicd/api/index.php
chmod 644 ./webadmin/net-wicd/api/index.php
${do_chown} && chown root:root ./webadmin/net-wicd/description.php
chmod 644 ./webadmin/net-wicd/description.php
${do_chown} && chown root:root ./webadmin/net-wicd/index.php
chmod 644 ./webadmin/net-wicd/index.php
${do_chown} && chown root:root ./webadmin/net-wicd/body.php
chmod 644 ./webadmin/net-wicd/body.php
${do_chown} && chown root:root ./webadmin/sys-daemons
chmod 755 ./webadmin/sys-daemons
${do_chown} && chown root:root ./webadmin/sys-daemons/config.php
chmod 644 ./webadmin/sys-daemons/config.php
${do_chown} && chown root:root ./webadmin/sys-daemons/description.php
chmod 644 ./webadmin/sys-daemons/description.php
${do_chown} && chown root:root ./webadmin/sys-daemons/shell.sh
chmod 755 ./webadmin/sys-daemons/shell.sh
${do_chown} && chown root:root ./webadmin/sys-daemons/index.php
chmod 644 ./webadmin/sys-daemons/index.php
${do_chown} && chown root:root ./webadmin/sys-storage
chmod 755 ./webadmin/sys-storage
${do_chown} && chown root:root ./webadmin/sys-storage/config.php
chmod 644 ./webadmin/sys-storage/config.php
${do_chown} && chown root:root ./webadmin/sys-storage/style
chmod 755 ./webadmin/sys-storage/style
${do_chown} && chown root:root ./webadmin/sys-storage/style/index.min.php
chmod 644 ./webadmin/sys-storage/style/index.min.php
${do_chown} && chown root:root ./webadmin/sys-storage/style/index.full.php
chmod 644 ./webadmin/sys-storage/style/index.full.php
${do_chown} && chown root:root ./webadmin/sys-storage/description.php
chmod 644 ./webadmin/sys-storage/description.php
${do_chown} && chown root:root ./webadmin/sys-storage/shell.sh
chmod 755 ./webadmin/sys-storage/shell.sh
${do_chown} && chown root:root ./webadmin/sys-storage/index.php
chmod 644 ./webadmin/sys-storage/index.php
${do_chown} && chown root:root ./webadmin/sys-storage/script
chmod 755 ./webadmin/sys-storage/script
${do_chown} && chown root:root ./webadmin/sys-storage/script/index.min.php
chmod 644 ./webadmin/sys-storage/script/index.min.php
${do_chown} && chown root:root ./webadmin/sys-storage/script/index.full.php
chmod 644 ./webadmin/sys-storage/script/index.full.php
${do_chown} && chown root:root ./webadmin/net-wired
chmod 755 ./webadmin/net-wired
${do_chown} && chown root:root ./webadmin/net-wired/config.rc
chmod 644 ./webadmin/net-wired/config.rc
${do_chown} && chown root:root ./webadmin/net-wired/description.php
chmod 644 ./webadmin/net-wired/description.php
${do_chown} && chown root:root ./webadmin/net-wired/shell.sh
chmod 755 ./webadmin/net-wired/shell.sh
${do_chown} && chown root:root ./webadmin/net-wired/index.php
chmod 644 ./webadmin/net-wired/index.php
${do_chown} && chown root:root ./webadmin/sys-sensors
chmod 755 ./webadmin/sys-sensors
${do_chown} && chown root:root ./webadmin/sys-sensors/shell.php
chmod 644 ./webadmin/sys-sensors/shell.php
${do_chown} && chown root:root ./webadmin/sys-sensors/description.php
chmod 644 ./webadmin/sys-sensors/description.php
${do_chown} && chown root:root ./webadmin/sys-sensors/shell.sh
chmod 755 ./webadmin/sys-sensors/shell.sh
${do_chown} && chown root:root ./webadmin/sys-sensors/index.php
chmod 644 ./webadmin/sys-sensors/index.php
${do_chown} && chown root:root ./webadmin/login-plugins
chmod 755 ./webadmin/login-plugins
${do_chown} && chown root:root ./webadmin/login-plugins/05_check-dash
chmod 755 ./webadmin/login-plugins/05_check-dash
${do_chown} && chown root:root ./webadmin/login-plugins/05_check-dash/check-dash.php
chmod 644 ./webadmin/login-plugins/05_check-dash/check-dash.php
${do_chown} && chown root:root ./webadmin/login-plugins/05_check-dash/shell.sh
chmod 755 ./webadmin/login-plugins/05_check-dash/shell.sh
${do_chown} && chown root:root ./webadmin/login-plugins/01_internet-info
chmod 755 ./webadmin/login-plugins/01_internet-info
${do_chown} && chown root:root ./webadmin/login-plugins/01_internet-info/config.rc
chmod 644 ./webadmin/login-plugins/01_internet-info/config.rc
${do_chown} && chown root:root ./webadmin/login-plugins/01_internet-info/internet-info.php
chmod 644 ./webadmin/login-plugins/01_internet-info/internet-info.php
${do_chown} && chown root:root ./webadmin/login-plugins/01_internet-info/shell.sh
chmod 755 ./webadmin/login-plugins/01_internet-info/shell.sh
${do_chown} && chown root:root ./webadmin/login-plugins/15_check-js
chmod 755 ./webadmin/login-plugins/15_check-js
${do_chown} && chown root:root ./webadmin/login-plugins/15_check-js/check-js.php
chmod 644 ./webadmin/login-plugins/15_check-js/check-js.php
${do_chown} && chown root:root ./webadmin/sys-clock
chmod 755 ./webadmin/sys-clock
${do_chown} && chown root:root ./webadmin/sys-clock/shell.php
chmod 644 ./webadmin/sys-clock/shell.php
${do_chown} && chown root:root ./webadmin/sys-clock/description.php
chmod 644 ./webadmin/sys-clock/description.php
${do_chown} && chown root:root ./webadmin/sys-clock/shell.sh
chmod 755 ./webadmin/sys-clock/shell.sh
${do_chown} && chown root:root ./webadmin/sys-clock/index.php
chmod 644 ./webadmin/sys-clock/index.php
${do_chown} && chown root:root ./webadmin/lib
chmod 755 ./webadmin/lib
${do_chown} && chown root:root ./webadmin/lib/shell
chmod 755 ./webadmin/lib/shell
${do_chown} && chown root:root ./webadmin/lib/shell/superuser.sh
chmod 750 ./webadmin/lib/shell/superuser.sh
${do_chown} && chown root:root ./webadmin/lib/shell/path.rc
chmod 644 ./webadmin/lib/shell/path.rc
${do_chown} && chown root:root ./webadmin/lib/shell/public-ipv4.rc
chmod 644 ./webadmin/lib/shell/public-ipv4.rc
${do_chown} && chown root:root ./webadmin/lib/shell/check-service.rc
chmod 644 ./webadmin/lib/shell/check-service.rc
${do_chown} && chown root:root ./webadmin/lib/shell/check-ipv6.rc
chmod 644 ./webadmin/lib/shell/check-ipv6.rc
${do_chown} && chown root:root ./webadmin/lib/opcache.php
chmod 644 ./webadmin/lib/opcache.php
${do_chown} && chown root:root ./webadmin/lib/opt_htmlheaders
chmod 755 ./webadmin/lib/opt_htmlheaders
${do_chown} && chown root:root ./webadmin/lib/opt_htmlheaders/jquery.php
chmod 644 ./webadmin/lib/opt_htmlheaders/jquery.php
${do_chown} && chown root:root ./webadmin/lib/range_icons
chmod 755 ./webadmin/lib/range_icons
${do_chown} && chown root:root ./webadmin/lib/range_icons/range_4.png
chmod 644 ./webadmin/lib/range_icons/range_4.png
${do_chown} && chown root:root ./webadmin/lib/range_icons/range_3.png
chmod 644 ./webadmin/lib/range_icons/range_3.png
${do_chown} && chown root:root ./webadmin/lib/range_icons/range_1.png
chmod 644 ./webadmin/lib/range_icons/range_1.png
${do_chown} && chown root:root ./webadmin/lib/range_icons/range_5.png
chmod 644 ./webadmin/lib/range_icons/range_5.png
${do_chown} && chown root:root ./webadmin/lib/range_icons/range_2.png
chmod 644 ./webadmin/lib/range_icons/range_2.png
${do_chown} && chown root:root ./webadmin/lib/range_icons/range_0.png
chmod 644 ./webadmin/lib/range_icons/range_0.png
${do_chown} && chown root:root ./webadmin/lib/console
chmod 755 ./webadmin/lib/console
${do_chown} && chown root:root ./webadmin/lib/console/update-shebang.php
chmod 644 ./webadmin/lib/console/update-shebang.php
${do_chown} && chown root:root ./webadmin/lib/console/check-command-stack.sh
chmod 755 ./webadmin/lib/console/check-command-stack.sh
${do_chown} && chown root:root ./webadmin/sys-users
chmod 755 ./webadmin/sys-users
${do_chown} && chown root:root ./webadmin/sys-users/description.php
chmod 644 ./webadmin/sys-users/description.php
${do_chown} && chown root:root ./webadmin/sys-users/shell.sh
chmod 755 ./webadmin/sys-users/shell.sh
${do_chown} && chown root:root ./webadmin/sys-users/index.php
chmod 644 ./webadmin/sys-users/index.php
${do_chown} && chown root:root ./webadmin/home-plugins
chmod 755 ./webadmin/home-plugins
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info
chmod 755 ./webadmin/home-plugins/01_splash-info
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules
chmod 755 ./webadmin/home-plugins/01_splash-info/modules
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/00_functions.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/00_functions.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/50_ipv4.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/50_ipv4.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/10_header.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/10_header.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/50_defaultgw.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/50_defaultgw.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/50_ipv6.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/50_ipv6.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/25_cpufan.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/25_cpufan.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/modules/20_uptime.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/modules/20_uptime.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/mkcache.sh
chmod 755 ./webadmin/home-plugins/01_splash-info/mkcache.sh
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/config.rc
chmod 644 ./webadmin/home-plugins/01_splash-info/config.rc
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/shell.sh
chmod 755 ./webadmin/home-plugins/01_splash-info/shell.sh
${do_chown} && chown root:root ./webadmin/home-plugins/01_splash-info/splash-info.php
chmod 644 ./webadmin/home-plugins/01_splash-info/splash-info.php
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./.config-files.txt
chmod 644 ./.config-files.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./webadmin-deprecated
chmod 755 ./webadmin-deprecated
${do_chown} && chown root:root ./webadmin-deprecated/net-ap
chmod 755 ./webadmin-deprecated/net-ap
${do_chown} && chown root:root ./webadmin-deprecated/net-ap/description.php
chmod 644 ./webadmin-deprecated/net-ap/description.php
${do_chown} && chown root:root ./webadmin-deprecated/net-ap/shell.sh
chmod 755 ./webadmin-deprecated/net-ap/shell.sh
${do_chown} && chown root:root ./webadmin-deprecated/net-ap/DEPRECATED.TXT
chmod 644 ./webadmin-deprecated/net-ap/DEPRECATED.TXT
${do_chown} && chown root:root ./webadmin-deprecated/net-ap/index.php
chmod 644 ./webadmin-deprecated/net-ap/index.php
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi
chmod 755 ./webadmin-deprecated/net-wifi
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi/shell.php
chmod 644 ./webadmin-deprecated/net-wifi/shell.php
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi/description.php
chmod 644 ./webadmin-deprecated/net-wifi/description.php
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi/shell.sh
chmod 755 ./webadmin-deprecated/net-wifi/shell.sh
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi/DEPRECATED.TXT
chmod 644 ./webadmin-deprecated/net-wifi/DEPRECATED.TXT
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi/index.php
chmod 644 ./webadmin-deprecated/net-wifi/index.php
${do_chown} && chown root:root ./webadmin-deprecated/net-wifi/script.php
chmod 644 ./webadmin-deprecated/net-wifi/script.php
${do_chown} && chown root:root ./webadmin-deprecated/net-vpn
chmod 755 ./webadmin-deprecated/net-vpn
${do_chown} && chown root:root ./webadmin-deprecated/net-vpn/description.php
chmod 644 ./webadmin-deprecated/net-vpn/description.php
${do_chown} && chown root:root ./webadmin-deprecated/net-vpn/shell.sh
chmod 755 ./webadmin-deprecated/net-vpn/shell.sh
${do_chown} && chown root:root ./webadmin-deprecated/net-vpn/DEPRECATED.TXT
chmod 644 ./webadmin-deprecated/net-vpn/DEPRECATED.TXT
${do_chown} && chown root:root ./webadmin-deprecated/net-vpn/index.php
chmod 644 ./webadmin-deprecated/net-vpn/index.php
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates
chmod 755 ./webadmin-deprecated/sys-updates
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates/menu-addon.php
chmod 644 ./webadmin-deprecated/sys-updates/menu-addon.php
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates/shell.php
chmod 644 ./webadmin-deprecated/sys-updates/shell.php
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates/description.php
chmod 644 ./webadmin-deprecated/sys-updates/description.php
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates/shell.sh
chmod 755 ./webadmin-deprecated/sys-updates/shell.sh
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates/DEPRECATED.TXT
chmod 644 ./webadmin-deprecated/sys-updates/DEPRECATED.TXT
${do_chown} && chown root:root ./webadmin-deprecated/sys-updates/index.php
chmod 644 ./webadmin-deprecated/sys-updates/index.php
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders
chmod 755 ./webadmin-extras/lib/htmlheaders
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders/mobileview.php
chmod 644 ./webadmin-extras/lib/htmlheaders/mobileview.php
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders/js-warning.php
chmod 644 ./webadmin-extras/lib/htmlheaders/js-warning.php
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders/faviconHeader.php
chmod 644 ./webadmin-extras/lib/htmlheaders/faviconHeader.php
${do_chown} && chown root:root ./webadmin-extras/lib/favicon
chmod 755 ./webadmin-extras/lib/favicon
${do_chown} && chown root:root ./webadmin-extras/lib/favicon/favicon.php
chmod 644 ./webadmin-extras/lib/favicon/favicon.php
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders_min
chmod 755 ./webadmin-extras/lib/htmlheaders_min
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders_min/mobileview.php
chmod 644 ./webadmin-extras/lib/htmlheaders_min/mobileview.php
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders/fadeanimations.php
chmod 644 ./webadmin-extras/lib/htmlheaders/fadeanimations.php
${do_chown} && chown root:root ./webadmin-extras/lib/htmlheaders_min/fadeanimations.php
chmod 644 ./webadmin-extras/lib/htmlheaders_min/fadeanimations.php
${do_chown} && chown root:root ./webadmin-extras/lib/login
chmod 755 ./webadmin-extras/lib/login
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes
chmod 755 ./webadmin-extras/lib/login/login-themes
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes/material
chmod 755 ./webadmin-extras/lib/login/login-themes/material
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes/material/reload.php
chmod 644 ./webadmin-extras/lib/login/login-themes/material/reload.php
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes/material/form.php
chmod 644 ./webadmin-extras/lib/login/login-themes/material/form.php
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes/material/css
chmod 755 ./webadmin-extras/lib/login/login-themes/material/css
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes/material/css/index.min.php
chmod 644 ./webadmin-extras/lib/login/login-themes/material/css/index.min.php
${do_chown} && chown root:root ./webadmin-extras/lib/login/login-themes/material/css/index.full.php
chmod 644 ./webadmin-extras/lib/login/login-themes/material/css/index.full.php
${do_chown} && chown root:root ./webadmin-extras/lib/themes
chmod 755 ./webadmin-extras/lib/themes
${do_chown} && chown root:root ./webadmin-extras/lib/themes/dark
chmod 755 ./webadmin-extras/lib/themes/dark
${do_chown} && chown root:root ./webadmin-extras/lib/themes/dark/index.min.php
chmod 644 ./webadmin-extras/lib/themes/dark/index.min.php
${do_chown} && chown root:root ./webadmin-extras/lib/themes/dark/index.full.php
chmod 644 ./webadmin-extras/lib/themes/dark/index.full.php
${do_chown} && chown root:root ./webadmin-extras/lib/themes/bright
chmod 755 ./webadmin-extras/lib/themes/bright
${do_chown} && chown root:root ./webadmin-extras/lib/themes/bright/index.min.php
chmod 644 ./webadmin-extras/lib/themes/bright/index.min.php
${do_chown} && chown root:root ./webadmin-extras/lib/themes/bright/index.full.php
chmod 644 ./webadmin-extras/lib/themes/bright/index.full.php
${do_chown} && chown root:root ./.build-jquery.sh
chmod 755 ./.build-jquery.sh

./webadmin/home-plugins/01_splash-info/mkcache.sh
./.build-jquery.sh

ln -s index.min.php ./webadmin/net-bwusage/style/index.php
ln -s index.min.php ./webadmin/net-bwusage/script/index.php
ln -s index.min.php ./webadmin/net-wicd/js/index.php
ln -s index.min.php ./webadmin/net-wicd/css/index.php
ln -s theme.min.php ./webadmin/net-wicd/themes/default/theme.php
ln -s ../../../lib/prevent-index.php ./webadmin/net-wicd/themes/default/index.php
ln -s theme.min.php ./webadmin/net-wicd/themes/bright/theme.php
ln -s ../../../lib/prevent-index.php ./webadmin/net-wicd/themes/bright/index.php
ln -s ../../lib/prevent-index.php ./webadmin/net-wicd/themes/index.php
ln -s index.min.php ./webadmin/sys-storage/style/index.php
ln -s index.min.php ./webadmin/sys-storage/script/index.php
ln -s ../../lib/prevent-index.php ./webadmin/login-plugins/05_check-dash/index.php
ln -s ../../lib/prevent-index.php ./webadmin/login-plugins/01_internet-info/index.php
ln -s ../../lib/prevent-index.php ./webadmin/login-plugins/15_check-js/index.php
ln -s ../prevent-index.php ./webadmin-extras/lib/favicon/index.php
ln -s ../prevent-index.php ./webadmin/lib/opt_htmlheaders/index.php
ln -s index.min.php ./webadmin-extras/lib/themes/dark/index.php
ln -s index.min.php ./webadmin-extras/lib/themes/bright/index.php
ln -s ../prevent-index.php ./webadmin/lib/range_icons/index.php
ln -s index.min.php ./webadmin-extras/lib/login/login-themes/material/css/index.php
ln -s ../../../prevent-index.php ./webadmin-extras/lib/login/login-themes/material/index.php
ln -s /usr/local/share/webadmin/lib/prevent-index.php ./webadmin/lib/prevent-index.php
ln -s /usr/local/share/webadmin/lib/prevent-index.php ./webadmin-extras/lib/prevent-index.php
ln -s ../config.rc ./webadmin/home-plugins/01_splash-info/modules/00_config.rc
ln -s ../../../lib/prevent-index.php ./webadmin/home-plugins/01_splash-info/modules/index.php
ln -s ../../lib/prevent-index.php ./webadmin/home-plugins/01_splash-info/index.php
ln -s extras-install.sh install.sh
ln -s extras-uninstall.sh uninstall.sh

gzip -9 ./.config-files.txt

chmod 644 ./.build.sh
echo ''
exit 0
