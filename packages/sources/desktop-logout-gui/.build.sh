#!/bin/sh
# desktop-logout-gui package
# build script
do_chown='false'

PACKAGE_NAME='desktop-logout-gui'

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
${do_chown} && chown root:root ./bin
chmod 755 ./bin
${do_chown} && chown root:root ./bin/desktop-logout-gui
chmod 755 ./bin/desktop-logout-gui
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/desktop-logout-gui
chmod 755 ./share/desktop-logout-gui
${do_chown} && chown root:root ./share/desktop-logout-gui/general-config.rc
chmod 644 ./share/desktop-logout-gui/general-config.rc
${do_chown} && chown root:root ./share/desktop-logout-gui/lang.d
chmod 755 ./share/desktop-logout-gui/lang.d
${do_chown} && chown root:root ./share/desktop-logout-gui/lang.d/pl.rc
chmod 644 ./share/desktop-logout-gui/lang.d/pl.rc
${do_chown} && chown root:root ./share/desktop-logout-gui/lang.d/en.rc
chmod 644 ./share/desktop-logout-gui/lang.d/en.rc
${do_chown} && chown root:root ./share/desktop-logout-gui/lang.rc
chmod 644 ./share/desktop-logout-gui/lang.rc
${do_chown} && chown root:root ./share/desktop-logout-gui/methods.rc
chmod 644 ./share/desktop-logout-gui/methods.rc
${do_chown} && chown root:root ./share/desktop-logout-gui/gui.rc
chmod 644 ./share/desktop-logout-gui/gui.rc
${do_chown} && chown root:root ./share/desktop-logout-gui/methods-enabled.rc
chmod 644 ./share/desktop-logout-gui/methods-enabled.rc
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/desktop-logout-gui
chmod 755 ./etc/desktop-logout-gui
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/desktop-logout-gui-helper
chmod 755 ./extras/etc/desktop-logout-gui-helper
${do_chown} && chown root:root ./extras/etc/desktop-logout-gui-helper/hybrid-suspend.rc
chmod 644 ./extras/etc/desktop-logout-gui-helper/hybrid-suspend.rc
${do_chown} && chown root:root ./extras/etc/desktop-logout-gui-helper/shutdown.rc
chmod 644 ./extras/etc/desktop-logout-gui-helper/shutdown.rc
${do_chown} && chown root:root ./extras/etc/desktop-logout-gui-helper/suspend.rc
chmod 644 ./extras/etc/desktop-logout-gui-helper/suspend.rc
${do_chown} && chown root:root ./extras/etc/desktop-logout-gui-helper/reboot.rc
chmod 644 ./extras/etc/desktop-logout-gui-helper/reboot.rc
${do_chown} && chown root:root ./extras/etc/desktop-logout-gui-helper/hibernate.rc
chmod 644 ./extras/etc/desktop-logout-gui-helper/hibernate.rc
${do_chown} && chown root:root ./extras/etc/sudoers.d
chmod 755 ./extras/etc/sudoers.d
${do_chown} && chown root:root ./extras/etc/sudoers.d/z-desktop-logout-gui-helper
chmod 640 ./extras/etc/sudoers.d/z-desktop-logout-gui-helper
${do_chown} && chown root:root ./extras/bin
chmod 755 ./extras/bin
${do_chown} && chown root:root ./extras/bin/desktop-logout-gui-helper
chmod 755 ./extras/bin/desktop-logout-gui-helper
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh

mkdir ./etc
mkdir ./etc/desktop-logout-gui

ln -s pl.rc ./share/desktop-logout-gui/lang.d/pl_PL.UTF-8.rc
ln -s en.rc ./share/desktop-logout-gui/lang.d/default.rc
ln -s ../../share/desktop-logout-gui/general-config.rc ./etc/desktop-logout-gui/general-config.rc
ln -s ../../share/desktop-logout-gui/lang.rc ./etc/desktop-logout-gui/lang.rc
ln -s ../../share/desktop-logout-gui/methods.rc ./etc/desktop-logout-gui/methods.rc
ln -s ../../share/desktop-logout-gui/methods-enabled.rc ./etc/desktop-logout-gui/methods-enabled.rc

chmod 644 ./.build.sh
echo ''
exit 0
