#!/bin/sh
# fancontrol-weather package
# build script
do_chown='false'

PACKAGE_NAME='fancontrol-weather'

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
${do_chown} && chown root:root ./sbin/fancontrol-weather.sh
chmod 750 ./sbin/fancontrol-weather.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/fancontrol-weather.sh
chmod 755 ./etc/init.d/fancontrol-weather.sh
${do_chown} && chown root:root ./etc/fancontrol-weather.rc
chmod 644 ./etc/fancontrol-weather.rc
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/rc.local.d
chmod 755 ./extras/etc/rc.local.d
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_fancontrol-weather.rc
chmod 644 ./extras/etc/rc.local.d/PKx_fancontrol-weather.rc
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/fancontrol-weather
chmod 755 ./share/fancontrol-weather
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com
chmod 755 ./share/fancontrol-weather/timeanddate_com
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/scrapper
chmod 755 ./share/fancontrol-weather/timeanddate_com/scrapper
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/php_lib
chmod 755 ./share/fancontrol-weather/timeanddate_com/php_lib
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched
chmod 755 ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched/LICENSE
chmod 644 ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched/LICENSE
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched/README.txt
chmod 644 ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched/README.txt
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched/simple_html_dom-patched.php
chmod 644 ./share/fancontrol-weather/timeanddate_com/php_lib/simple_html_dom-patched/simple_html_dom-patched.php
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/.htaccess
chmod 644 ./share/fancontrol-weather/timeanddate_com/.htaccess
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/scrapper.rc
chmod 644 ./share/fancontrol-weather/timeanddate_com/scrapper.rc
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/README.txt
chmod 644 ./share/fancontrol-weather/timeanddate_com/README.txt
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/VERSION.txt
chmod 644 ./share/fancontrol-weather/timeanddate_com/VERSION.txt
${do_chown} && chown root:root ./share/fancontrol-weather/timeanddate_com/index.php
chmod 644 ./share/fancontrol-weather/timeanddate_com/index.php
${do_chown} && chown root:root ./share/fancontrol-weather/README.txt
chmod 644 ./share/fancontrol-weather/README.txt
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

chmod 644 ./.build.sh
echo ''
exit 0
