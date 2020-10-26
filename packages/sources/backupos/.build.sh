#!/bin/sh
# backupos package
# build script
do_chown='false'

PACKAGE_NAME='BackupOS'

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
${do_chown} && chown root:root ./.source
chmod 755 ./.source
${do_chown} && chown root:root ./.source/rootfs-bin
chmod 755 ./.source/rootfs-bin
${do_chown} && chown root:root ./.source/rootfs-bin/etc
chmod 755 ./.source/rootfs-bin/etc
${do_chown} && chown root:root ./.source/rootfs-bin/etc/backupos_userspace.txt
chmod 644 ./.source/rootfs-bin/etc/backupos_userspace.txt
${do_chown} && chown root:root ./.source/rootfs-bin/bin
chmod 755 ./.source/rootfs-bin/bin
${do_chown} && chown root:root ./.source/rootfs-bin/bin/busybox
chmod 755 ./.source/rootfs-bin/bin/busybox
${do_chown} && chown root:root ./.source/rootfs
chmod 755 ./.source/rootfs
${do_chown} && chown root:root ./.source/rootfs/etc
chmod 755 ./.source/rootfs/etc
${do_chown} && chown root:root ./.source/rootfs/etc/profile
chmod 644 ./.source/rootfs/etc/profile
${do_chown} && chown root:root ./.source/rootfs/etc/init
chmod 755 ./.source/rootfs/etc/init
${do_chown} && chown root:root ./.source/rootfs/etc/init/S030_mdev.rc
chmod 644 ./.source/rootfs/etc/init/S030_mdev.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S000_splash.rc
chmod 644 ./.source/rootfs/etc/init/S000_splash.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S046_remove-docs.rc
chmod 644 ./.source/rootfs/etc/init/S046_remove-docs.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S026_modprobe.rc
chmod 644 ./.source/rootfs/etc/init/S026_modprobe.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S034_root-dir.rc
chmod 644 ./.source/rootfs/etc/init/S034_root-dir.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S004_init-colors.rc
chmod 644 ./.source/rootfs/etc/init/S004_init-colors.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S999_shell.rc
chmod 644 ./.source/rootfs/etc/init/S999_shell.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S018_mount_mdev_ctty.rc
chmod 644 ./.source/rootfs/etc/init/S018_mount_mdev_ctty.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S042_network.rc
chmod 644 ./.source/rootfs/etc/init/S042_network.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S022_cmdline.rc
chmod 644 ./.source/rootfs/etc/init/S022_cmdline.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S038_hostname.rc
chmod 644 ./.source/rootfs/etc/init/S038_hostname.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S012_dev2mod.rc
chmod 644 ./.source/rootfs/etc/init/S012_dev2mod.rc
${do_chown} && chown root:root ./.source/rootfs/etc/init/S008_path.rc
chmod 644 ./.source/rootfs/etc/init/S008_path.rc
${do_chown} && chown root:root ./.source/rootfs/etc/README.TXT
chmod 644 ./.source/rootfs/etc/README.TXT
${do_chown} && chown root:root ./.source/rootfs/etc/backupos_version.txt
chmod 644 ./.source/rootfs/etc/backupos_version.txt
${do_chown} && chown root:root ./.source/rootfs/etc/init-colors
chmod 644 ./.source/rootfs/etc/init-colors
${do_chown} && chown root:root ./.source/rootfs/sbin
chmod 755 ./.source/rootfs/sbin
${do_chown} && chown root:root ./.source/rootfs/sbin/init
chmod 755 ./.source/rootfs/sbin/init
${do_chown} && chown root:root ./.source/rootfs/usr
chmod 755 ./.source/rootfs/usr
${do_chown} && chown root:root ./.source/rootfs/usr/share
chmod 755 ./.source/rootfs/usr/share
${do_chown} && chown root:root ./.source/rootfs/usr/share/udhcpc
chmod 755 ./.source/rootfs/usr/share/udhcpc
${do_chown} && chown root:root ./.source/rootfs/usr/share/udhcpc/udhcpc.script
chmod 755 ./.source/rootfs/usr/share/udhcpc/udhcpc.script
${do_chown} && chown root:root ./.source/packages
chmod 755 ./.source/packages
${do_chown} && chown root:root ./.source/packages/etc
chmod 755 ./.source/packages/etc
${do_chown} && chown root:root ./.source/packages/etc/init
chmod 755 ./.source/packages/etc/init
${do_chown} && chown root:root ./.source/packages/etc/init/S050_package-manager.rc
chmod 644 ./.source/packages/etc/init/S050_package-manager.rc
${do_chown} && chown root:root ./.source/packages/usr
chmod 755 ./.source/packages/usr
${do_chown} && chown root:root ./.source/packages/usr/share
chmod 755 ./.source/packages/usr/share
${do_chown} && chown root:root ./.source/packages/usr/share/package-manager
chmod 755 ./.source/packages/usr/share/package-manager
${do_chown} && chown root:root ./.source/packages/usr/share/package-manager/package-starter
chmod 755 ./.source/packages/usr/share/package-manager/package-starter
${do_chown} && chown root:root ./.source/packages/usr/share/package-manager/package-installer
chmod 755 ./.source/packages/usr/share/package-manager/package-installer
${do_chown} && chown root:root ./.source/packages/usr/share/packages
chmod 755 ./.source/packages/usr/share/packages
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnet-menu
chmod 755 ./.source/packages/usr/share/packages/telnet-menu
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnet-menu/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/telnet-menu/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnet-menu/telnet-menu_1.0.tar
chmod 644 ./.source/packages/usr/share/packages/telnet-menu/telnet-menu_1.0.tar
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnet-menu/info.txt
chmod 644 ./.source/packages/usr/share/packages/telnet-menu/info.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnet-menu/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/telnet-menu/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash
chmod 755 ./.source/packages/usr/share/packages/bash
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/source.txt
chmod 644 ./.source/packages/usr/share/packages/bash/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/bash-static
chmod 755 ./.source/packages/usr/share/packages/bash/bash-static
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/info.txt
chmod 644 ./.source/packages/usr/share/packages/bash/info.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/bash/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd
chmod 755 ./.source/packages/usr/share/packages/telnetd
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/telnetd-login
chmod 755 ./.source/packages/usr/share/packages/telnetd/telnetd-login
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/info.txt
chmod 644 ./.source/packages/usr/share/packages/telnetd/info.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/start.sh
chmod 755 ./.source/packages/usr/share/packages/telnetd/start.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/check-dependencies.sh
chmod 755 ./.source/packages/usr/share/packages/check-dependencies.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils
chmod 755 ./.source/packages/usr/share/packages/backupos-utils
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/boot_to_main
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/boot_to_main
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount-ext4
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount-ext4
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount-cifs
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount-cifs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/info.txt
chmod 644 ./.source/packages/usr/share/packages/backupos-utils/info.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base
chmod 755 ./.source/packages/usr/share/packages/ncurses-base
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/ncurses-base_6.1+20181013-2_all.tar
chmod 644 ./.source/packages/usr/share/packages/ncurses-base/ncurses-base_6.1+20181013-2_all.tar
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/source.txt
chmod 644 ./.source/packages/usr/share/packages/ncurses-base/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/info.txt
chmod 644 ./.source/packages/usr/share/packages/ncurses-base/info.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/ncurses-base/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc
chmod 755 ./.source/packages/usr/share/packages/mc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/source.txt
chmod 644 ./.source/packages/usr/share/packages/mc/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/mc/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/mc-4.8.0-pre2-git30-04-2011.tar
chmod 644 ./.source/packages/usr/share/packages/mc/mc-4.8.0-pre2-git30-04-2011.tar
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/info.txt
chmod 644 ./.source/packages/usr/share/packages/mc/info.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/mc/unpack.sh
${do_chown} && chown root:root ./.source/build.sh
chmod 644 ./.source/build.sh
${do_chown} && chown root:root ./sample-config
chmod 755 ./sample-config
${do_chown} && chown root:root ./sample-config/grub.cfg
chmod 644 ./sample-config/grub.cfg
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./boot
chmod 755 ./boot
${do_chown} && chown root:root ./boot/rootfs.img
chmod 644 ./boot/rootfs.img
${do_chown} && chown root:root ./boot/modules.img-4.19.0-3-686
chmod 644 ./boot/modules.img-4.19.0-3-686
${do_chown} && chown root:root ./boot/packages.img
chmod 644 ./boot/packages.img
${do_chown} && chown root:root ./boot/rootfs-bin.img
chmod 644 ./boot/rootfs-bin.img
${do_chown} && chown root:root ./boot/vmlinuz-4.19.0-3-686
chmod 644 ./boot/vmlinuz-4.19.0-3-686
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/boot_to_backupos.sh
chmod 755 ./sbin/boot_to_backupos.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

if [ -e './boot/packages.img' ] || [ -e './boot/rootfs-bin.img' ] || [ -e './boot/rootfs.img' ]; then
	echo 'BackupOS images are already built'
else
	cp -rfp ./.source ./.build
	cd ./.build
	chmod 755 ./build.sh
	./build.sh
	for i in *; do
		if cd ./${i} > /dev/null 2>&1; then
			echo -n "Building ${i} image... "
			find | cpio --create --format=newc | gzip -9 > ../../boot/${i}.img
			cd ..
		fi
	done
	cd ..
	rm -r -f ./.build
fi

chmod 644 ./.build.sh
echo ''
exit 0
