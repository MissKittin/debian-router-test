#!/bin/sh
# desktop-toolbox package
# build script
do_chown='false'

PACKAGE_NAME='desktop-toolbox'

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
${do_chown} && chown root:root ./bin/desktop-toolbox
chmod 755 ./bin/desktop-toolbox
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/bin
chmod 755 ./extras/bin
${do_chown} && chown root:root ./extras/bin/apt-check
chmod 755 ./extras/bin/apt-check
${do_chown} && chown root:root ./extras/sbin
chmod 755 ./extras/sbin
${do_chown} && chown root:root ./extras/sbin/apt-updaterd
chmod 755 ./extras/sbin/apt-updaterd
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/init.d
chmod 755 ./extras/etc/init.d
${do_chown} && chown root:root ./extras/etc/init.d/apt-updaterd
chmod 755 ./extras/etc/init.d/apt-updaterd
${do_chown} && chown root:root ./extras/etc/apt-updaterd.rc
chmod 644 ./extras/etc/apt-updaterd.rc
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/desktop-toolbox
chmod 755 ./share/desktop-toolbox
${do_chown} && chown root:root ./share/desktop-toolbox/lib_module-header.rc
chmod 644 ./share/desktop-toolbox/lib_module-header.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_alsa-hotkeys.rc
chmod 644 ./share/desktop-toolbox/mod_alsa-hotkeys.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_gnome-screenshot-hotkey.rc
chmod 644 ./share/desktop-toolbox/mod_gnome-screenshot-hotkey.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d
chmod 755 ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d
${do_chown} && chown root:root ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d/pl_PL.UTF-8.rc
chmod 644 ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d/pl_PL.UTF-8.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d/en_US.rc
chmod 644 ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d/en_US.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_sudo-gtk.rc
chmod 644 ./share/desktop-toolbox/mod_sudo-gtk.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_gtk-list-daemons.rc
chmod 644 ./share/desktop-toolbox/mod_gtk-list-daemons.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_sudo-gtk.lang.d
chmod 755 ./share/desktop-toolbox/mod_sudo-gtk.lang.d
${do_chown} && chown root:root ./share/desktop-toolbox/mod_sudo-gtk.lang.d/pl_PL.UTF-8.rc
chmod 644 ./share/desktop-toolbox/mod_sudo-gtk.lang.d/pl_PL.UTF-8.rc
${do_chown} && chown root:root ./share/desktop-toolbox/mod_sudo-gtk.lang.d/en_US.rc
chmod 644 ./share/desktop-toolbox/mod_sudo-gtk.lang.d/en_US.rc
${do_chown} && chown root:root ./extras/share/applications
chmod 755 ./extras/share/applications
${do_chown} && chown root:root ./extras/share/applications/daemons.desktop
chmod 644 ./extras/share/applications/daemons.desktop
${do_chown} && chown root:root ./extras/share/desktop-toolbox/mod_apt-updater.lang.d
chmod 755 ./extras/share/desktop-toolbox/mod_apt-updater.lang.d
${do_chown} && chown root:root ./extras/share/desktop-toolbox/mod_apt-updater.lang.d/pl_PL.UTF-8.rc
chmod 644 ./extras/share/desktop-toolbox/mod_apt-updater.lang.d/pl_PL.UTF-8.rc
${do_chown} && chown root:root ./extras/share/desktop-toolbox/mod_apt-updater.lang.d/en_US.rc
chmod 644 ./extras/share/desktop-toolbox/mod_apt-updater.lang.d/en_US.rc
${do_chown} && chown root:root ./extras/share/desktop-toolbox/mod_apt-updater.rc
chmod 644 ./extras/share/desktop-toolbox/mod_apt-updater.rc
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/desktop-toolbox
chmod 755 ./etc/desktop-toolbox
${do_chown} && chown root:root ./etc/desktop-toolbox/mod_alsa-hotkeys.rc
chmod 644 ./etc/desktop-toolbox/mod_alsa-hotkeys.rc
${do_chown} && chown root:root ./etc/desktop-toolbox/mod_gnome-screenshot-hotkey.rc
chmod 644 ./etc/desktop-toolbox/mod_gnome-screenshot-hotkey.rc
${do_chown} && chown root:root ./etc/desktop-toolbox/mod_gtk-list-daemons.rc.d
chmod 755 ./etc/desktop-toolbox/mod_gtk-list-daemons.rc.d
${do_chown} && chown root:root ./etc/desktop-toolbox/mod_gtk-list-daemons.rc.d/TEMPLATE
chmod 644 ./etc/desktop-toolbox/mod_gtk-list-daemons.rc.d/TEMPLATE
${do_chown} && chown root:root ./etc/desktop-toolbox/mod_sudo-gtk.rc
chmod 644 ./etc/desktop-toolbox/mod_sudo-gtk.rc
${do_chown} && chown root:root ./etc/desktop-toolbox/mod_gtk-list-daemons.rc
chmod 644 ./etc/desktop-toolbox/mod_gtk-list-daemons.rc
${do_chown} && chown root:root ./extras/etc/desktop-toolbox/mod_apt-updater.rc
chmod 644 ./extras/etc/desktop-toolbox/mod_apt-updater.rc
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

ln -s desktop-toolbox ./bin/sudo-gtk
ln -s desktop-toolbox ./bin/alsa-hotkeys
ln -s desktop-toolbox ./bin/gnome-screenshot-hotkey
ln -s ../../desktop-toolbox ./extras/bin/apt-updater
ln -s desktop-toolbox ./bin/gtk-list-daemons
ln -s en_US.rc ./share/desktop-toolbox/mod_gtk-list-daemons.lang.d/default.rc
ln -s en_US.rc ./share/desktop-toolbox/mod_sudo-gtk.lang.d/default.rc
ln -s en_US.rc ./extras/share/desktop-toolbox/mod_apt-updater.lang.d/default.rc

chmod 644 ./.build.sh
echo ''
exit 0
