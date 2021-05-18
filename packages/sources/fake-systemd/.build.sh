#!/bin/sh
# fake-systemd package
# build script
do_chown='false'

PACKAGE_NAME='fake-systemd'
SOURCE_PACKAGES='libpam-systemd systemd systemd-sysv'
[ "${1}" = '--build-systemd-shim' ] && SOURCE_PACKAGES='libpam-systemd systemd systemd-shim systemd-sysv'

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
${do_chown} && chown root:root ./etc/apt/sources.list.d/fake-systemd.list
chmod 644 ./etc/apt/sources.list.d/fake-systemd.list
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

for i in ${SOURCE_PACKAGES}; do
	${do_chown} && chown root:root ./.source/${i}
	chmod 755 ./.source/${i}
	${do_chown} && chown root:root ./.source/${i}/DEBIAN
	chmod 755 ./.source/${i}/DEBIAN
	${do_chown} && chown root:root ./.source/${i}/DEBIAN/control
	chmod 644 ./.source/${i}/DEBIAN/control
done

echo ''
if [ ! -e './share' ]; then
	echo 'Building repository...'

	print_S1() { echo -n "${1}"; }
	mkdir -p './share/fake-systemd'
	echo -n '' > './share/fake-systemd/Packages'
	cd './.source'

	for i in ${SOURCE_PACKAGES}; do
		dpkg --build ${i}
		mv "${i}.deb" "../share/fake-systemd/${i}.deb"

		echo "Package: ${i}" >> '../share/fake-systemd/Packages'
		echo 'Version: 9999999999' >> '../share/fake-systemd/Packages'
		echo 'Architecture: all' >> '../share/fake-systemd/Packages'
		echo 'Maintainer: MissKittin@github' >> '../share/fake-systemd/Packages'
		echo 'Installed-Size: 0' >> '../share/fake-systemd/Packages'
		echo "Filename: ./${i}.deb" >> '../share/fake-systemd/Packages'
		echo 'Size: '"$(stat -c '%s' ../share/fake-systemd/${i}.deb)" >> '../share/fake-systemd/Packages'
		echo 'MD5sum: '"$(print_S1 $(md5sum ../share/fake-systemd/${i}.deb))" >> '../share/fake-systemd/Packages'
		echo 'SHA1: '"$(print_S1 $(sha1sum ../share/fake-systemd/${i}.deb))" >> '../share/fake-systemd/Packages'
		echo 'SHA256: '"$(print_S1 $(sha256sum ../share/fake-systemd/${i}.deb))" >> '../share/fake-systemd/Packages'
		echo 'Section: admin' >> '../share/fake-systemd/Packages'
		echo 'Priority: standard' >> '../share/fake-systemd/Packages'
		echo 'Description: Debian systemd crack' >> '../share/fake-systemd/Packages'
		echo ' You installed the fake-systemd package.' >> '../share/fake-systemd/Packages'
		echo ' To remove this, run uninstall.sh from package directory' >> '../share/fake-systemd/Packages'
		echo ' and reinstall the package from the official repository.' >> '../share/fake-systemd/Packages'
		echo '' >> '../share/fake-systemd/Packages'
	done

	gzip -9 '../share/fake-systemd/Packages'
	cd ..
fi

chmod 644 ./.build.sh
echo ''
exit 0
