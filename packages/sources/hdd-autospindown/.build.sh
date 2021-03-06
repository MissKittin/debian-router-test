#!/bin/sh
# hdd-autospindown package
# build script
do_chown='false'

PACKAGE_NAME='hdd-autospindown'

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
${do_chown} && chown root:root ./sbin/hdd-autospindown.sh
chmod 750 ./sbin/hdd-autospindown.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/hdd-autospindown.sh
chmod 755 ./etc/init.d/hdd-autospindown.sh
${do_chown} && chown root:root ./etc/hdd-autospindown.rc
chmod 644 ./etc/hdd-autospindown.rc
${do_chown} && chown root:root ./etc/hdd-autospindown.d
chmod 755 ./etc/hdd-autospindown.d
${do_chown} && chown root:root ./etc/hdd-autospindown.d/TEMPLATE
chmod 644 ./etc/hdd-autospindown.d/TEMPLATE
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
