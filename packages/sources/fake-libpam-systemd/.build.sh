#!/bin/sh
# fake-libpam-systemd package
# build script
do_chown='false'

PACKAGE_NAME='fake-libpam-systemd'

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
${do_chown} && chown root:root ./etc/apt/sources.list.d
chmod 755 ./etc/apt/sources.list.d
${do_chown} && chown root:root ./etc/apt/sources.list.d/fake-libpam-systemd.list
chmod 644 ./etc/apt/sources.list.d/fake-libpam-systemd.list
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
${do_chown} && chown root:root ./.source
chmod 755 ./.source
${do_chown} && chown root:root ./.source/fake-libpam-systemd
chmod 755 ./.source/fake-libpam-systemd
${do_chown} && chown root:root ./.source/fake-libpam-systemd/DEBIAN
chmod 755 ./.source/fake-libpam-systemd/DEBIAN
${do_chown} && chown root:root ./.source/fake-libpam-systemd/DEBIAN/control
chmod 644 ./.source/fake-libpam-systemd/DEBIAN/control

echo ''
if [ -e './share' ]; then
	echo 'The repository is already built'
	${do_chown} && chown root:root ./share
	chmod 755 ./share
	${do_chown} && chown root:root ./share/fake-libpam-systemd
	chmod 755 ./share/fake-libpam-systemd
	${do_chown} && chown root:root ./share/fake-libpam-systemd/Packages.gz
	chmod 644 ./share/fake-libpam-systemd/Packages.gz
	${do_chown} && chown root:root ./share/fake-libpam-systemd/libpam-systemd.deb
	chmod 644 ./share/fake-libpam-systemd/libpam-systemd.deb
else
	echo 'Building repository...'

	cd ./.source
	dpkg --build fake-libpam-systemd
	cd ..
	mkdir -p ./share/fake-libpam-systemd
	cd ./share/fake-libpam-systemd
	mv ../../.source/fake-libpam-systemd.deb ./libpam-systemd.deb

	print_S1() { echo -n "${1}"; }
	echo 'Package: libpam-systemd' > ./Packages
	echo 'Version: 9999999999' >> ./Packages
	echo 'Architecture: all' >> ./Packages
	echo 'Maintainer: MissKittin@github' >> ./Packages
	echo 'Installed-Size: 0' >> ./Packages
	echo 'Filename: ./libpam-systemd.deb' >> ./Packages
	echo 'Size: 716' >> ./Packages
	echo 'MD5sum: '"$(print_S1 $(md5sum ./libpam-systemd.deb))" >> ./Packages
	echo 'SHA1: '"$(print_S1 $(sha1sum ./libpam-systemd.deb))" >> ./Packages
	echo 'SHA256: '"$(print_S1 $(sha256sum ./libpam-systemd.deb))" >> ./Packages
	echo 'Section: admin' >> ./Packages
	echo 'Priority: standard' >> ./Packages
	echo 'Description: Debian systemd crack' >> ./Packages
	echo ' You installed the fake-libpam-systemd package.' >> ./Packages
	echo ' To remove this, run uninstall.sh from package directory' >> ./Packages
	echo ' and reinstall the package from the official repository.' >> ./Packages
	echo '' >> ./Packages
	gzip -9 ./Packages
	cd ../..

	${do_chown} && chown root:root ./share
	chmod 755 ./share
	${do_chown} && chown root:root ./share/fake-libpam-systemd
	chmod 755 ./share/fake-libpam-systemd
	${do_chown} && chown root:root ./share/fake-libpam-systemd/Packages.gz
	chmod 644 ./share/fake-libpam-systemd/Packages.gz
	${do_chown} && chown root:root ./share/fake-libpam-systemd/libpam-systemd.deb
	chmod 644 ./share/fake-libpam-systemd/libpam-systemd.deb
fi

chmod 644 ./.build.sh
echo ''
exit 0
