#!/bin/sh
# package-manager
# build script
do_chown='false'

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
${do_chown} && chown root:root ./modules
chmod 755 ./modules
${do_chown} && chown root:root ./modules/uninstall
chmod 755 ./modules/uninstall
${do_chown} && chown root:root ./modules/check-updates
chmod 755 ./modules/check-updates
${do_chown} && chown root:root ./modules/add-package
chmod 755 ./modules/add-package
${do_chown} && chown root:root ./modules/check-status
chmod 755 ./modules/check-status
${do_chown} && chown root:root ./modules/install
chmod 755 ./modules/install
${do_chown} && chown root:root ./modules/remove-package
chmod 755 ./modules/remove-package
${do_chown} && chown root:root ./modules/check-extras-status
chmod 755 ./modules/check-extras-status
${do_chown} && chown root:root ./dev-tools
chmod 755 ./dev-tools
${do_chown} && chown root:root ./dev-tools/dumpmods.sh
chmod 755 ./dev-tools/dumpmods.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./bin
chmod 755 ./bin
${do_chown} && chown root:root ./bin/package-manager.sh
chmod 755 ./bin/package-manager.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./build.sh
echo ''
exit 0
