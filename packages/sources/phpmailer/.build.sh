#!/bin/sh
# phpmailer package
# build script
do_chown='false'

PACKAGE_NAME='phpmailer'

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
${do_chown} && chown root:root ./sbin/phpmailer.sh
chmod 750 ./sbin/phpmailer.sh
${do_chown} && chown root:root ./phpmailer
chmod 755 ./phpmailer
${do_chown} && chown root:root ./phpmailer/.htaccess
chmod 644 ./phpmailer/.htaccess
${do_chown} && chown root:root ./phpmailer/settings.php
chmod 644 ./phpmailer/settings.php
${do_chown} && chown root:root ./phpmailer/index.php
chmod 644 ./phpmailer/index.php
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/phpmailer.rc
chmod 640 ./etc/phpmailer.rc
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/notify-daemon
chmod 755 ./extras/etc/notify-daemon
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender.rc.d
chmod 755 ./extras/etc/notify-daemon/sender.rc.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender.rc.d/phpmailer.rc
chmod 644 ./extras/etc/notify-daemon/sender.rc.d/phpmailer.rc
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender.rc.cfg.d
chmod 755 ./extras/etc/notify-daemon/sender.rc.cfg.d
${do_chown} && chown root:root ./extras/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc
chmod 644 ./extras/etc/notify-daemon/sender.rc.cfg.d/phpmailer.rc
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
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
