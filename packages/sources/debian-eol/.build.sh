#!/bin/sh
# debian-eol package
# build script
do_chown='false'

PACKAGE_NAME='debian-eol'

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
${do_chown} && chown root:root ./php_lib
chmod 755 ./php_lib
${do_chown} && chown root:root ./php_lib/simple_html_dom-patched
chmod 755 ./php_lib/simple_html_dom-patched
${do_chown} && chown root:root ./php_lib/simple_html_dom-patched/LICENSE
chmod 644 ./php_lib/simple_html_dom-patched/LICENSE
${do_chown} && chown root:root ./php_lib/simple_html_dom-patched/README.txt
chmod 644 ./php_lib/simple_html_dom-patched/README.txt
${do_chown} && chown root:root ./php_lib/simple_html_dom-patched/simple_html_dom-patched.php
chmod 644 ./php_lib/simple_html_dom-patched/simple_html_dom-patched.php
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
${do_chown} && chown root:root ./extras/etc/notify-daemon/events.rc.d/debian-eol.rc
chmod 644 ./extras/etc/notify-daemon/events.rc.d/debian-eol.rc
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./bin
chmod 755 ./bin
${do_chown} && chown root:root ./bin/debian-eol.php
chmod 755 ./bin/debian-eol.php
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
