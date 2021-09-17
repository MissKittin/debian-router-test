#!/bin/sh
# remove-initramfs-fsck package
# build script
do_chown='false'

PACKAGE_NAME='remove-initramfs-fsck'

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
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/remove-initramfs-fsck2.sh
chmod 755 ./etc/init.d/remove-initramfs-fsck2.sh
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
${do_chown} && chown root:root ./.source/sbin
chmod 755 ./.source/sbin
${do_chown} && chown root:root ./.source/sbin/fsck.ext4
chmod 755 ./.source/sbin/fsck.ext4
${do_chown} && chown root:root ./.source/sbin/e2fsck
chmod 755 ./.source/sbin/e2fsck
${do_chown} && chown root:root ./.source/sbin/fsck
chmod 755 ./.source/sbin/fsck

if [ ! -e './boot/initrd-fsck-patch2.img' ]; then
	echo -n 'Building image... '
	mkdir ./boot
	cd ./.source
	find | cpio --create --format='newc' > ../boot/initrd-fsck-patch2.img
	gzip -9 ../boot/initrd-fsck-patch2.img
	mv ../boot/initrd-fsck-patch2.img.gz ../boot/initrd-fsck-patch2.img
	for i in 'fsck.ext4' 'e2fsck' 'fsck'; do
		chmod 644 ./sbin/${i}
	done
	cd ..
fi

chmod 644 ./.build.sh
echo ''
exit 0
