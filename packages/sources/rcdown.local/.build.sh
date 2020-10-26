#!/bin/sh
# rcdown.local package
# build script
do_chown='false'

PACKAGE_NAME='rcdown.local'

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
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/rcdown.local
chmod 755 ./etc/rcdown.local
${do_chown} && chown root:root ./etc/rcdown.local.d
chmod 755 ./etc/rcdown.local.d
${do_chown} && chown root:root ./etc/rcdown.local.d/S11_rcdown-queue.rc
chmod 644 ./etc/rcdown.local.d/S11_rcdown-queue.rc
${do_chown} && chown root:root ./etc/rcdown.local.d/README.TXT
chmod 644 ./etc/rcdown.local.d/README.TXT
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/arcdown.local
chmod 755 ./etc/init.d/arcdown.local
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

chmod 644 ./.build.sh
echo ''
exit 0
