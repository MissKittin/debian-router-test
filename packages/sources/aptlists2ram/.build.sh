#!/bin/sh
# aptlists2ram package
# build script
do_chown='false'

PACKAGE_NAME='aptlists2ram'

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
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/apt
chmod 755 ./etc/apt
${do_chown} && chown root:root ./etc/apt/apt.conf.d
chmod 755 ./etc/apt/apt.conf.d
${do_chown} && chown root:root ./etc/apt/apt.conf.d/aptlists2ram-compress-indexes
chmod 644 ./etc/apt/apt.conf.d/aptlists2ram-compress-indexes
${do_chown} && chown root:root ./etc/rcdown.local.d
chmod 755 ./etc/rcdown.local.d
${do_chown} && chown root:root ./etc/rcdown.local.d/Sx_aptlists2ram.rc
chmod 644 ./etc/rcdown.local.d/Sx_aptlists2ram.rc
${do_chown} && chown root:root ./etc/rc.local.d
chmod 755 ./etc/rc.local.d
${do_chown} && chown root:root ./etc/rc.local.d/PKx_aptlists2ram.rc
chmod 644 ./etc/rc.local.d/PKx_aptlists2ram.rc
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
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
