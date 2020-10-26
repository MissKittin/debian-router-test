#!/bin/sh
# resolvconf-updater package
# build script
do_chown='false'

PACKAGE_NAME='resolvconf-updater'

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
${do_chown} && chown root:root ./extras/etc/acpid-suspend/post_suspend.d/S99resolvconf-updater.rc
chmod 644 ./extras/etc/acpid-suspend/post_suspend.d/S99resolvconf-updater.rc
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d
chmod 755 ./extras/etc/acpid-suspend/pre_suspend.d
${do_chown} && chown root:root ./extras/etc/acpid-suspend/pre_suspend.d/S00resolvconf-updater.rc
chmod 644 ./extras/etc/acpid-suspend/pre_suspend.d/S00resolvconf-updater.rc
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_resolvconf-updater.rc
chmod 644 ./etc/rc.local.d/PKx_resolvconf-updater.rc
${do_chown} && chown root:root ./etc/resolvconf-updater.d
chmod 755 ./etc/resolvconf-updater.d
${do_chown} && chown root:root ./etc/resolvconf-updater.d/99_local.top.conf
chmod 644 ./etc/resolvconf-updater.d/99_local.top.conf
${do_chown} && chown root:root ./etc/resolvconf-updater.d/README
chmod 644 ./etc/resolvconf-updater.d/README
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/resolvconf-updater.sh
chmod 755 ./etc/init.d/resolvconf-updater.sh
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
${do_chown} && chown root:root ./sbin/resolvconf-updater.sh
chmod 755 ./sbin/resolvconf-updater.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

chmod 644 ./.build.sh
echo ''
exit 0
