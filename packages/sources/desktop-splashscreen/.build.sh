#!/bin/sh
# desktop-splashscreen package
# build script
do_chown='false'

PACKAGE_NAME='desktop-splashscreen'

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
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/zsplashscreen-stop
chmod 755 ./etc/init.d/zsplashscreen-stop
${do_chown} && chown root:root ./etc/init.d/aasplashscreen-shutdown
chmod 755 ./etc/init.d/aasplashscreen-shutdown
${do_chown} && chown root:root ./etc/init.d/aasplashscreen-boot
chmod 755 ./etc/init.d/aasplashscreen-boot
${do_chown} && chown root:root ./etc/desktop-splashscreen
chmod 755 ./etc/desktop-splashscreen
${do_chown} && chown root:root ./etc/desktop-splashscreen/config.rc
chmod 644 ./etc/desktop-splashscreen/config.rc
${do_chown} && chown root:root ./etc/desktop-splashscreen/splash.png
chmod 644 ./etc/desktop-splashscreen/splash.png
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh

ln -s splash.png ./etc/desktop-splashscreen/boot-splash.png
ln -s splash.png ./etc/desktop-splashscreen/shutdown-splash.png
ln -s splash.png ./etc/desktop-splashscreen/reboot-splash.png

chmod 644 ./.build.sh
echo ''
exit 0
