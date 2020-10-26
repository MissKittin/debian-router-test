#!/bin/sh
# ddns-client package
# build script
do_chown='false'

PACKAGE_NAME='ddns-client'

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
${do_chown} && chown root:root ./ip-info
chmod 755 ./ip-info
${do_chown} && chown root:root ./ip-info/.htaccess
chmod 644 ./ip-info/.htaccess
${do_chown} && chown root:root ./ip-info/README.txt
chmod 644 ./ip-info/README.txt
${do_chown} && chown root:root ./ip-info/index.php
chmod 644 ./ip-info/index.php
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/ddns-client.rc
chmod 644 ./etc/ddns-client.rc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/ddns-client.sh
chmod 755 ./etc/init.d/ddns-client.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/rc.local.d
chmod 755 ./extras/etc/rc.local.d
${do_chown} && chown root:root ./extras/etc/rc.local.d/PKx_ddns-client.rc
chmod 644 ./extras/etc/rc.local.d/PKx_ddns-client.rc
${do_chown} && chown root:root ./ddns-server
chmod 755 ./ddns-server
${do_chown} && chown root:root ./ddns-server/.htaccess
chmod 644 ./ddns-server/.htaccess
${do_chown} && chown root:root ./ddns-server/README.txt
chmod 644 ./ddns-server/README.txt
${do_chown} && chown root:root ./ddns-server/settings.php
chmod 644 ./ddns-server/settings.php
${do_chown} && chown root:root ./ddns-server/index.php
chmod 644 ./ddns-server/index.php
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
${do_chown} && chown root:root ./bin/ddns-client.sh
chmod 755 ./bin/ddns-client.sh
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
