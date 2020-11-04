#!/bin/sh
# pxe-nas-installer package
# build script
do_chown='false'

PACKAGE_NAME='pxe-nas-installer'

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
chmod 750 ./sbin
${do_chown} && chown root:root ./sbin/pxe-nas-installer
chmod 700 ./sbin/pxe-nas-installer
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/pxe-nas-installer
chmod 750 ./share/pxe-nas-installer
${do_chown} && chown root:root ./share/pxe-nas-installer/modules
chmod 755 ./share/pxe-nas-installer/modules
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_samba
chmod 755 ./share/pxe-nas-installer/modules/E_samba
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_samba/action.rc
chmod 644 ./share/pxe-nas-installer/modules/E_samba/action.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_samba/title.txt
chmod 644 ./share/pxe-nas-installer/modules/E_samba/title.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_samba/config.tar.gz
chmod 644 ./share/pxe-nas-installer/modules/E_samba/config.tar.gz
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_samba/description.txt
chmod 644 ./share/pxe-nas-installer/modules/E_samba/description.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_locales
chmod 755 ./share/pxe-nas-installer/modules/E_locales
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_locales/action.rc
chmod 644 ./share/pxe-nas-installer/modules/E_locales/action.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_locales/title.txt
chmod 644 ./share/pxe-nas-installer/modules/E_locales/title.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_locales/description.txt
chmod 644 ./share/pxe-nas-installer/modules/E_locales/description.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_ssh
chmod 755 ./share/pxe-nas-installer/modules/E_ssh
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_ssh/sshd_config.gz
chmod 644 ./share/pxe-nas-installer/modules/E_ssh/sshd_config.gz
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_ssh/action.rc
chmod 644 ./share/pxe-nas-installer/modules/E_ssh/action.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_ssh/title.txt
chmod 644 ./share/pxe-nas-installer/modules/E_ssh/title.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_ssh/description.txt
chmod 644 ./share/pxe-nas-installer/modules/E_ssh/description.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_xfce4
chmod 755 ./share/pxe-nas-installer/modules/E_xfce4
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_xfce4/action.rc
chmod 644 ./share/pxe-nas-installer/modules/E_xfce4/action.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_xfce4/title.txt
chmod 644 ./share/pxe-nas-installer/modules/E_xfce4/title.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_xfce4/config.tar.gz
chmod 644 ./share/pxe-nas-installer/modules/E_xfce4/config.tar.gz
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_xfce4/description.txt
chmod 644 ./share/pxe-nas-installer/modules/E_xfce4/description.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_z-exit
chmod 755 ./share/pxe-nas-installer/modules/E_z-exit
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_z-exit/action.rc
chmod 644 ./share/pxe-nas-installer/modules/E_z-exit/action.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_z-exit/title.txt
chmod 644 ./share/pxe-nas-installer/modules/E_z-exit/title.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/modules/E_z-exit/description.txt
chmod 644 ./share/pxe-nas-installer/modules/E_z-exit/description.txt
${do_chown} && chown root:root ./share/pxe-nas-installer/lib
chmod 755 ./share/pxe-nas-installer/lib
${do_chown} && chown root:root ./share/pxe-nas-installer/lib/splash.rc
chmod 644 ./share/pxe-nas-installer/lib/splash.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/lib/menu.rc
chmod 644 ./share/pxe-nas-installer/lib/menu.rc
${do_chown} && chown root:root ./share/pxe-nas-installer/lib/modules.rc
chmod 644 ./share/pxe-nas-installer/lib/modules.rc
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
