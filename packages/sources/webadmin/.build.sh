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
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/webadmin.sh
chmod 644 ./sbin/webadmin.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/default
chmod 755 ./etc/default
${do_chown} && chown root:root ./etc/default/webadmin
chmod 644 ./etc/default/webadmin
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/webadmin
chmod 755 ./etc/init.d/webadmin
${do_chown} && chown root:root ./etc/webadmin.php.ini
chmod 644 ./etc/webadmin.php.ini
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_webadmin.rc
chmod 644 ./etc/rc.local.d/PKx_webadmin.rc
${do_chown} && chown root:root ./etc/sudoers.d
chmod 755 ./etc/sudoers.d
${do_chown} && chown root:root ./etc/sudoers.d/webadmin
chmod 640 ./etc/sudoers.d/webadmin
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/notify-daemon
chmod 755 ./extras/etc/notify-daemon
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d
chmod 755 ./extras/etc/notify-daemon/events.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/webadmin-session-cleaner.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/journal-manager.rc.d
chmod 755 ./extras/etc/notify-daemon/journal-manager.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/journal-manager.rc.d/www.rc
chmod 644 ./extras/etc/notify-daemon/journal-manager.rc.d/www.rc
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/webadmin
chmod 755 ./share/webadmin
${do_chown} && chown root:root ./share/webadmin/router.php
chmod 644 ./share/webadmin/router.php
${do_chown} && chown root:root ./share/webadmin/sample-module
chmod 755 ./share/webadmin/sample-module
${do_chown} && chown root:root ./share/webadmin/sample-module/README.TXT
chmod 644 ./share/webadmin/sample-module/README.TXT
${do_chown} && chown root:root ./share/webadmin/sample-module/description.php
chmod 644 ./share/webadmin/sample-module/description.php
${do_chown} && chown root:root ./share/webadmin/sample-module/index.php
chmod 644 ./share/webadmin/sample-module/index.php
${do_chown} && chown root:root ./share/webadmin/README.TXT
chmod 644 ./share/webadmin/README.TXT
${do_chown} && chown root:root ./share/webadmin/sample-menu-addon
chmod 755 ./share/webadmin/sample-menu-addon
${do_chown} && chown root:root ./share/webadmin/sample-menu-addon/README.TXT
chmod 644 ./share/webadmin/sample-menu-addon/README.TXT
${do_chown} && chown root:root ./share/webadmin/sample-menu-addon/menu-addon.php
chmod 644 ./share/webadmin/sample-menu-addon/menu-addon.php
${do_chown} && chown root:root ./share/webadmin/sample-menu-addon/description.php
chmod 644 ./share/webadmin/sample-menu-addon/description.php
${do_chown} && chown root:root ./share/webadmin/sample-menu-addon/index.php
chmod 644 ./share/webadmin/sample-menu-addon/index.php
${do_chown} && chown root:root ./share/webadmin/login-plugins
chmod 755 ./share/webadmin/login-plugins
${do_chown} && chown root:root ./share/webadmin/login-plugins/99_sample-widget
chmod 755 ./share/webadmin/login-plugins/99_sample-widget
${do_chown} && chown root:root ./share/webadmin/login-plugins/99_sample-widget/README.TXT
chmod 644 ./share/webadmin/login-plugins/99_sample-widget/README.TXT
${do_chown} && chown root:root ./share/webadmin/login-plugins/99_sample-widget/sample-widget.php
chmod 644 ./share/webadmin/login-plugins/99_sample-widget/sample-widget.php
${do_chown} && chown root:root ./share/webadmin/login-plugins/10_check-cookies
chmod 755 ./share/webadmin/login-plugins/10_check-cookies
${do_chown} && chown root:root ./share/webadmin/login-plugins/10_check-cookies/check-cookies.php
chmod 644 ./share/webadmin/login-plugins/10_check-cookies/check-cookies.php
${do_chown} && chown root:root ./share/webadmin/lib
chmod 755 ./share/webadmin/lib
${do_chown} && chown root:root ./share/webadmin/lib/htmlheaders
chmod 755 ./share/webadmin/lib/htmlheaders
${do_chown} && chown root:root ./share/webadmin/lib/htmlheaders/charset.php
chmod 644 ./share/webadmin/lib/htmlheaders/charset.php
${do_chown} && chown root:root ./share/webadmin/lib/htmlheaders/theme.php
chmod 644 ./share/webadmin/lib/htmlheaders/theme.php
${do_chown} && chown root:root ./share/webadmin/lib/sec_csrf.php
chmod 644 ./share/webadmin/lib/sec_csrf.php
${do_chown} && chown root:root ./share/webadmin/lib/htmlheaders.php
chmod 644 ./share/webadmin/lib/htmlheaders.php
${do_chown} && chown root:root ./share/webadmin/lib/prevent-direct.php
chmod 644 ./share/webadmin/lib/prevent-direct.php
${do_chown} && chown root:root ./share/webadmin/lib/header.php
chmod 644 ./share/webadmin/lib/header.php
${do_chown} && chown root:root ./share/webadmin/lib/themes
chmod 755 ./share/webadmin/lib/themes
${do_chown} && chown root:root ./share/webadmin/lib/themes/default
chmod 755 ./share/webadmin/lib/themes/default
${do_chown} && chown root:root ./share/webadmin/lib/themes/default/index.min.php
chmod 644 ./share/webadmin/lib/themes/default/index.min.php
${do_chown} && chown root:root ./share/webadmin/lib/themes/default/index.full.php
chmod 644 ./share/webadmin/lib/themes/default/index.full.php
${do_chown} && chown root:root ./share/webadmin/lib/home.php
chmod 644 ./share/webadmin/lib/home.php
${do_chown} && chown root:root ./share/webadmin/lib/menu
chmod 755 ./share/webadmin/lib/menu
${do_chown} && chown root:root ./share/webadmin/lib/menu/default
chmod 755 ./share/webadmin/lib/menu/default
${do_chown} && chown root:root ./share/webadmin/lib/menu/default/menu.php
chmod 644 ./share/webadmin/lib/menu/default/menu.php
${do_chown} && chown root:root ./share/webadmin/lib/menu/default/theme
chmod 755 ./share/webadmin/lib/menu/default/theme
${do_chown} && chown root:root ./share/webadmin/lib/menu/default/theme/index.min.php
chmod 644 ./share/webadmin/lib/menu/default/theme/index.min.php
${do_chown} && chown root:root ./share/webadmin/lib/menu/default/theme/index.full.php
chmod 644 ./share/webadmin/lib/menu/default/theme/index.full.php
${do_chown} && chown root:root ./share/webadmin/lib/menu/menu.php
chmod 644 ./share/webadmin/lib/menu/menu.php
${do_chown} && chown root:root ./share/webadmin/lib/login
chmod 755 ./share/webadmin/lib/login
${do_chown} && chown root:root ./share/webadmin/lib/login/login.php
chmod 644 ./share/webadmin/lib/login/login.php
${do_chown} && chown root:root ./share/webadmin/lib/login/login-config.php
chmod 640 ./share/webadmin/lib/login/login-config.php
${do_chown} && chown root:root ./share/webadmin/lib/login/login-themes
chmod 755 ./share/webadmin/lib/login/login-themes
${do_chown} && chown root:root ./share/webadmin/lib/login/login-themes/default
chmod 755 ./share/webadmin/lib/login/login-themes/default
${do_chown} && chown root:root ./share/webadmin/lib/login/login-themes/default/reload.php
chmod 644 ./share/webadmin/lib/login/login-themes/default/reload.php
${do_chown} && chown root:root ./share/webadmin/lib/login/login-themes/default/form.php
chmod 644 ./share/webadmin/lib/login/login-themes/default/form.php
${do_chown} && chown root:root ./share/webadmin/lib/console
chmod 755 ./share/webadmin/lib/console
${do_chown} && chown root:root ./share/webadmin/lib/console/passwdhash.php
chmod 644 ./share/webadmin/lib/console/passwdhash.php
${do_chown} && chown root:root ./share/webadmin/lib/console/generate-cache.php
chmod 644 ./share/webadmin/lib/console/generate-cache.php
${do_chown} && chown root:root ./share/webadmin/lib/prevent-index.php
chmod 644 ./share/webadmin/lib/prevent-index.php
${do_chown} && chown root:root ./share/webadmin/home-plugins
chmod 755 ./share/webadmin/home-plugins
${do_chown} && chown root:root ./share/webadmin/home-plugins/99_sample-widget
chmod 755 ./share/webadmin/home-plugins/99_sample-widget
${do_chown} && chown root:root ./share/webadmin/home-plugins/99_sample-widget/README.TXT
chmod 644 ./share/webadmin/home-plugins/99_sample-widget/README.TXT
${do_chown} && chown root:root ./share/webadmin/home-plugins/99_sample-widget/sample-widget.php
chmod 644 ./share/webadmin/home-plugins/99_sample-widget/sample-widget.php
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

mkdir ./share/webadmin/lib/htmlheaders_min
mkdir ./share/webadmin/lib/shell
ln -s ../lib/prevent-index.php ./share/webadmin/home-plugins/index.php
ln -s ../../lib/prevent-index.php ./share/webadmin/home-plugins/99_sample-widget/index.php
ln -s ./lib/home.php ./share/webadmin/index.php
ln -s ../prevent-index.php ./share/webadmin/lib/console/index.php
ln -s ./prevent-index.php ./share/webadmin/lib/index.php
ln -s ../prevent-index.php ./share/webadmin/lib/login/index.php
ln -s ../../prevent-index.php ./share/webadmin/lib/login/login-themes/index.php
ln -s ../../../prevent-index.php ./share/webadmin/lib/login/login-themes/default/index.php
ln -s ../prevent-index.php ./share/webadmin/lib/menu/index.php
ln -s ../../prevent-index.php ./share/webadmin/lib/menu/default/index.php
ln -s index.min.php ./share/webadmin/lib/menu/default/theme/index.php
ln -s ../prevent-index.php ./share/webadmin/lib/themes/index.php
ln -s index.min.php ./share/webadmin/lib/themes/default/index.php
ln -s ../prevent-index.php ./share/webadmin/lib/shell/index.php
ln -s ../lib/prevent-index.php ./share/webadmin/login-plugins/index.php
ln -s ../../lib/prevent-index.php ./share/webadmin/login-plugins/10_check-cookies/index.php
ln -s ../../lib/prevent-index.php ./share/webadmin/login-plugins/99_sample-widget/index.php
touch ./share/webadmin/home-plugins/99_sample-widget/disabled
touch ./share/webadmin/sample-menu-addon/disabled
touch ./share/webadmin/login-plugins/99_sample-widget/disabled
touch ./share/webadmin/sample-module/disabled
mkdir -p ./etc/authbind/byport
echo -n '' > ./etc/authbind/byport/80
chmod 755 ./etc/authbind/byport/80

chmod 644 ./.build.sh
echo ''
exit 0
