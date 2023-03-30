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

if [ ! -e "$(dirname "$(readlink -f "${0}")")/.source" ]; then
	echo 'Package already built'
	chmod 644 "$(dirname "$(readlink -f "${0}")")/.build.sh"
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
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0
chmod 755 ./.source/rootfs-bin.img-1.30.0
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/etc
chmod 755 ./.source/rootfs-bin.img-1.30.0/etc
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/etc/init
chmod 755 ./.source/rootfs-bin.img-1.30.0/etc/init
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/etc/init/S555_busybox-suid.rc
chmod 644 ./.source/rootfs-bin.img-1.30.0/etc/init/S555_busybox-suid.rc
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/lib
chmod 755 ./.source/rootfs-bin.img-1.30.0/lib
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/lib/busybox
chmod 755 ./.source/rootfs-bin.img-1.30.0/lib/busybox
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/lib/busybox/setup.sh
chmod 755 ./.source/rootfs-bin.img-1.30.0/lib/busybox/setup.sh
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/lib/busybox/busybox
chmod 755 ./.source/rootfs-bin.img-1.30.0/lib/busybox/busybox
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/lib/busybox/su
chmod 755 ./.source/rootfs-bin.img-1.30.0/lib/busybox/su
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/usr
chmod 755 ./.source/rootfs-bin.img-1.30.0/usr
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/usr/share
chmod 755 ./.source/rootfs-bin.img-1.30.0/usr/share
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/usr/share/doc
chmod 755 ./.source/rootfs-bin.img-1.30.0/usr/share/doc
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos
chmod 755 ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos/busybox_config
chmod 644 ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos/busybox_config
${do_chown} && chown root:root ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos/userspace.txt
chmod 644 ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos/userspace.txt
${do_chown} && chown root:root ./.source/rootfs
chmod 755 ./.source/rootfs
${do_chown} && chown root:root ./.source/rootfs/etc
chmod 755 ./.source/rootfs/etc
${do_chown} && chown root:root ./.source/rootfs/etc/profile
chmod 644 ./.source/rootfs/etc/profile
${do_chown} && chown root:root ./.source/rootfs/etc/shadow
chmod 640 ./.source/rootfs/etc/shadow
${do_chown} && chown root:root ./.source/rootfs/etc/init
chmod 755 ./.source/rootfs/etc/init
${do_chown} && chown root:root ./.source/rootfs/etc/init/S018_backupos-setup.rc
chmod 644 ./.source/rootfs/etc/init/S018_backupos-setup.rc
${do_chown} && chown root:root ./.source/rootfs/etc/passwd
chmod 644 ./.source/rootfs/etc/passwd
${do_chown} && chown root:root ./.source/rootfs/etc/modules.conf
chmod 644 ./.source/rootfs/etc/modules.conf
${do_chown} && chown root:root ./.source/rootfs/etc/sysctl.conf
chmod 644 ./.source/rootfs/etc/sysctl.conf
${do_chown} && chown root:root ./.source/rootfs/etc/group
chmod 644 ./.source/rootfs/etc/group
${do_chown} && chown root:root ./.source/rootfs/etc/hostname
chmod 644 ./.source/rootfs/etc/hostname
${do_chown} && chown root:root ./.source/rootfs/etc/mdev.conf
chmod 644 ./.source/rootfs/etc/mdev.conf
${do_chown} && chown root:root ./.source/rootfs/usr
chmod 755 ./.source/rootfs/usr
${do_chown} && chown root:root ./.source/rootfs/usr/share
chmod 755 ./.source/rootfs/usr/share
${do_chown} && chown root:root ./.source/rootfs/usr/share/doc
chmod 755 ./.source/rootfs/usr/share/doc
${do_chown} && chown root:root ./.source/rootfs/usr/share/doc/backupos
chmod 755 ./.source/rootfs/usr/share/doc/backupos
${do_chown} && chown root:root ./.source/rootfs/usr/share/doc/backupos/README.TXT
chmod 644 ./.source/rootfs/usr/share/doc/backupos/README.TXT
${do_chown} && chown root:root ./.source/rootfs/usr/share/udhcpc
chmod 755 ./.source/rootfs/usr/share/udhcpc
${do_chown} && chown root:root ./.source/rootfs/usr/share/udhcpc/udhcpc.script
chmod 755 ./.source/rootfs/usr/share/udhcpc/udhcpc.script
${do_chown} && chown root:root ./.source/rootfs/usr/lib
chmod 755 ./.source/rootfs/usr/lib
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init
chmod 755 ./.source/rootfs/usr/lib/backupos-init
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/kmsg-log
chmod 644 ./.source/rootfs/usr/lib/backupos-init/kmsg-log
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/mkcache.sh
chmod 755 ./.source/rootfs/usr/lib/backupos-init/mkcache.sh
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/queue-setup.sh
chmod 755 ./.source/rootfs/usr/lib/backupos-init/queue-setup.sh
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init
chmod 755 ./.source/rootfs/usr/lib/backupos-init/init
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_umask-console-splash.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_umask-console-splash.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_console.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_console.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_emergency-console.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_emergency-console.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_mount-all.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_mount-all.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_sendsigs.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_sendsigs.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_sysv.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_sysv.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_swap.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_swap.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_hostname.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_hostname.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_hosts.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_hosts.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_cmdline.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_cmdline.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_rclocal.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_rclocal.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_modules-load.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_modules-load.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_mount-base.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_mount-base.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_mdev.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_mdev.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_checkroot-checkfs.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_checkroot-checkfs.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_network-simple.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_network-simple.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_init-console.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_init-console.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_modprobe.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_modprobe.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_disable-shutdown-signals.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_disable-shutdown-signals.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_shutdown-signals.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_shutdown-signals.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_path.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_path.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_urandom.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_urandom.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_security.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_security.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_network.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_network.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/K_poweroff.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/K_poweroff.rc
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init.bin
chmod 755 ./.source/rootfs/usr/lib/backupos-init/init.bin
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init-console
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init-console
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/colors
chmod 644 ./.source/rootfs/usr/lib/backupos-init/colors
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init-functions
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init-functions
${do_chown} && chown root:root ./.source/packages
chmod 755 ./.source/packages
${do_chown} && chown root:root ./.source/packages/etc
chmod 755 ./.source/packages/etc
${do_chown} && chown root:root ./.source/packages/etc/init
chmod 755 ./.source/packages/etc/init
${do_chown} && chown root:root ./.source/packages/etc/init/S400_package-manager.rc
chmod 644 ./.source/packages/etc/init/S400_package-manager.rc
${do_chown} && chown root:root ./.source/packages/usr
chmod 755 ./.source/packages/usr
${do_chown} && chown root:root ./.source/packages/usr/share
chmod 755 ./.source/packages/usr/share
${do_chown} && chown root:root ./.source/packages/usr/share/package-manager
chmod 755 ./.source/packages/usr/share/package-manager
${do_chown} && chown root:root ./.source/packages/usr/share/package-manager/package-installer
chmod 755 ./.source/packages/usr/share/package-manager/package-installer
${do_chown} && chown root:root ./.source/packages/usr/share/packages
chmod 755 ./.source/packages/usr/share/packages
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ftpd
chmod 755 ./.source/packages/usr/share/packages/ftpd
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ftpd/ftpd6
chmod 755 ./.source/packages/usr/share/packages/ftpd/ftpd6
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ftpd/firewall.rc
chmod 644 ./.source/packages/usr/share/packages/ftpd/firewall.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ftpd/ftpd4
chmod 755 ./.source/packages/usr/share/packages/ftpd/ftpd4
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ftpd/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/ftpd/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-firewall
chmod 755 ./.source/packages/usr/share/packages/backupos-firewall
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-firewall/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/backupos-firewall/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-firewall/firewall.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-firewall/firewall.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-firewall/firewall
chmod 755 ./.source/packages/usr/share/packages/backupos-firewall/firewall
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-firewall/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/backupos-firewall/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/cfdisk
chmod 755 ./.source/packages/usr/share/packages/cfdisk
${do_chown} && chown root:root ./.source/packages/usr/share/packages/cfdisk/cfdisk
chmod 755 ./.source/packages/usr/share/packages/cfdisk/cfdisk
${do_chown} && chown root:root ./.source/packages/usr/share/packages/cfdisk/source.txt
chmod 644 ./.source/packages/usr/share/packages/cfdisk/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/cfdisk/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/cfdisk/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/cfdisk/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/cfdisk/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/crond
chmod 755 ./.source/packages/usr/share/packages/crond
${do_chown} && chown root:root ./.source/packages/usr/share/packages/crond/crond
chmod 755 ./.source/packages/usr/share/packages/crond/crond
${do_chown} && chown root:root ./.source/packages/usr/share/packages/crond/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/crond/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/hdparm
chmod 755 ./.source/packages/usr/share/packages/hdparm
${do_chown} && chown root:root ./.source/packages/usr/share/packages/hdparm/README.txt
chmod 644 ./.source/packages/usr/share/packages/hdparm/README.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/hdparm/source.txt
chmod 644 ./.source/packages/usr/share/packages/hdparm/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/hdparm/hdparm
chmod 755 ./.source/packages/usr/share/packages/hdparm/hdparm
${do_chown} && chown root:root ./.source/packages/usr/share/packages/hdparm/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/hdparm/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash
chmod 755 ./.source/packages/usr/share/packages/bash
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/source.txt
chmod 644 ./.source/packages/usr/share/packages/bash/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/bash-static
chmod 755 ./.source/packages/usr/share/packages/bash/bash-static
${do_chown} && chown root:root ./.source/packages/usr/share/packages/bash/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/bash/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/xtables
chmod 755 ./.source/packages/usr/share/packages/xtables
${do_chown} && chown root:root ./.source/packages/usr/share/packages/xtables/README.txt
chmod 644 ./.source/packages/usr/share/packages/xtables/README.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/xtables/source.txt
chmod 644 ./.source/packages/usr/share/packages/xtables/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/xtables/xtables-multi
chmod 755 ./.source/packages/usr/share/packages/xtables/xtables-multi
${do_chown} && chown root:root ./.source/packages/usr/share/packages/xtables/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/xtables/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/dosfs-tools
chmod 755 ./.source/packages/usr/share/packages/dosfs-tools
${do_chown} && chown root:root ./.source/packages/usr/share/packages/dosfs-tools/mkfs.fat
chmod 755 ./.source/packages/usr/share/packages/dosfs-tools/mkfs.fat
${do_chown} && chown root:root ./.source/packages/usr/share/packages/dosfs-tools/source.txt
chmod 644 ./.source/packages/usr/share/packages/dosfs-tools/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/dosfs-tools/fsck.fat
chmod 755 ./.source/packages/usr/share/packages/dosfs-tools/fsck.fat
${do_chown} && chown root:root ./.source/packages/usr/share/packages/dosfs-tools/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/dosfs-tools/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd
chmod 755 ./.source/packages/usr/share/packages/telnetd
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/telnetd-login
chmod 755 ./.source/packages/usr/share/packages/telnetd/telnetd-login
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/telnetd/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/firewall.rc
chmod 644 ./.source/packages/usr/share/packages/telnetd/firewall.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/README.TXT
chmod 644 ./.source/packages/usr/share/packages/telnetd/README.TXT
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/telnetd6
chmod 755 ./.source/packages/usr/share/packages/telnetd/telnetd6
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/telnetd4
chmod 755 ./.source/packages/usr/share/packages/telnetd/telnetd4
${do_chown} && chown root:root ./.source/packages/usr/share/packages/telnetd/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/telnetd/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu
chmod 755 ./.source/packages/usr/share/packages/backupos-menu
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/09_xtables
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/09_xtables
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/09_xtables/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/09_xtables/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/09_xtables/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/09_xtables/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/01_load-drivers
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/01_load-drivers
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/01_load-drivers/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/01_load-drivers/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/01_load-drivers/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/01_load-drivers/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/13_exit
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/13_exit
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/13_exit/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/13_exit/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/13_exit/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/13_exit/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/11_run-program
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/11_run-program
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/11_run-program/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/11_run-program/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/11_run-program/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/11_run-program/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/10_ntpdate
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/10_ntpdate
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/10_ntpdate/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/10_ntpdate/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/10_ntpdate/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/10_ntpdate/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/12_shutdown
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/12_shutdown
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/12_shutdown/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/12_shutdown/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/12_shutdown/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/12_shutdown/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/06_backup-tools
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/06_backup-tools
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/06_backup-tools/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/06_backup-tools/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/06_backup-tools/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/06_backup-tools/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/04_mount
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/04_mount
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/04_mount/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/04_mount/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/04_mount/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/04_mount/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/03_zram-swap
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/03_zram-swap
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/03_zram-swap/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/03_zram-swap/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/03_zram-swap/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/03_zram-swap/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/05_umount
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/05_umount
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/05_umount/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/05_umount/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/05_umount/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/05_umount/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/07_recovery-tools
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/07_recovery-tools
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/07_recovery-tools/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/07_recovery-tools/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/07_recovery-tools/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/07_recovery-tools/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/02_mdev
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/02_mdev
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/02_mdev/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/02_mdev/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/02_mdev/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/02_mdev/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/08_partition-tools
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/08_partition-tools
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/08_partition-tools/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/08_partition-tools/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/08_partition-tools/main.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/modules/08_partition-tools/main.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/functions
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/functions
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/functions/modules.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/functions/modules.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/functions/menu.rc
chmod 644 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/share/backupos-menu/functions/menu.rc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/sbin
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/sbin
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/sbin/backupos-menu
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1/usr/sbin/backupos-menu
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-menu/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/backupos-menu/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/testdisk
chmod 755 ./.source/packages/usr/share/packages/testdisk
${do_chown} && chown root:root ./.source/packages/usr/share/packages/testdisk/source.txt
chmod 644 ./.source/packages/usr/share/packages/testdisk/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/testdisk/minimize-testdisk.sh
chmod 755 ./.source/packages/usr/share/packages/testdisk/minimize-testdisk.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/testdisk/testdisk-7.1.linux26.tar
chmod 644 ./.source/packages/usr/share/packages/testdisk/testdisk-7.1.linux26.tar
${do_chown} && chown root:root ./.source/packages/usr/share/packages/testdisk/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/testdisk/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/check-dependencies.sh
chmod 755 ./.source/packages/usr/share/packages/check-dependencies.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils
chmod 755 ./.source/packages/usr/share/packages/backupos-utils
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/load-drivers
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/load-drivers
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/umount-all
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/umount-all
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount.cifs
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount.cifs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/zram-swap
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/zram-swap
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/ntpdate
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/ntpdate
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mdev
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mdev
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/backupos-cleaner
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/backupos-cleaner
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/login-root
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/login-root
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/backupos-utils/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount.nfs
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount.nfs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount.vfat
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount.vfat
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/reboot-to-main
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/reboot-to-main
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/README.TXT
chmod 644 ./.source/packages/usr/share/packages/backupos-utils/README.TXT
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount.cdrom.iso9660
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount.cdrom.iso9660
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/swaps
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/swaps
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/df-rootfs
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/df-rootfs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/fsck.auto
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/fsck.auto
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/mount.ext4
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/mount.ext4
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/getty-tty2
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/getty-tty2
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/backupos-utils/dpkg-forget-old-unavail
chmod 755 ./.source/packages/usr/share/packages/backupos-utils/dpkg-forget-old-unavail
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base
chmod 755 ./.source/packages/usr/share/packages/ncurses-base
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/ncurses-base_6.1+20181013-2_all.tar
chmod 644 ./.source/packages/usr/share/packages/ncurses-base/ncurses-base_6.1+20181013-2_all.tar
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/source.txt
chmod 644 ./.source/packages/usr/share/packages/ncurses-base/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ncurses-base/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/ncurses-base/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/runit
chmod 755 ./.source/packages/usr/share/packages/runit
${do_chown} && chown root:root ./.source/packages/usr/share/packages/runit/runit
chmod 755 ./.source/packages/usr/share/packages/runit/runit
${do_chown} && chown root:root ./.source/packages/usr/share/packages/runit/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/runit/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ddrescue
chmod 755 ./.source/packages/usr/share/packages/ddrescue
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ddrescue/README.txt
chmod 644 ./.source/packages/usr/share/packages/ddrescue/README.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ddrescue/source.txt
chmod 644 ./.source/packages/usr/share/packages/ddrescue/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ddrescue/ddrescue
chmod 755 ./.source/packages/usr/share/packages/ddrescue/ddrescue
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ddrescue/ddrescuelog
chmod 755 ./.source/packages/usr/share/packages/ddrescue/ddrescuelog
${do_chown} && chown root:root ./.source/packages/usr/share/packages/ddrescue/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/ddrescue/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/syslogd
chmod 755 ./.source/packages/usr/share/packages/syslogd
${do_chown} && chown root:root ./.source/packages/usr/share/packages/syslogd/klogd
chmod 755 ./.source/packages/usr/share/packages/syslogd/klogd
${do_chown} && chown root:root ./.source/packages/usr/share/packages/syslogd/syslogd
chmod 755 ./.source/packages/usr/share/packages/syslogd/syslogd
${do_chown} && chown root:root ./.source/packages/usr/share/packages/syslogd/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/syslogd/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc
chmod 755 ./.source/packages/usr/share/packages/mc
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/source.txt
chmod 644 ./.source/packages/usr/share/packages/mc/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/dependencies.txt
chmod 644 ./.source/packages/usr/share/packages/mc/dependencies.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/mc-4.8.0-pre2-git30-04-2011.tar
chmod 644 ./.source/packages/usr/share/packages/mc/mc-4.8.0-pre2-git30-04-2011.tar
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/minimize-mc.sh
chmod 755 ./.source/packages/usr/share/packages/mc/minimize-mc.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/mc/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/mc/unpack.sh
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools
chmod 755 ./.source/packages/usr/share/packages/e2fs-tools
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools/source.txt
chmod 644 ./.source/packages/usr/share/packages/e2fs-tools/source.txt
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools/resize2fs
chmod 755 ./.source/packages/usr/share/packages/e2fs-tools/resize2fs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools/mke2fs
chmod 755 ./.source/packages/usr/share/packages/e2fs-tools/mke2fs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools/tune2fs
chmod 755 ./.source/packages/usr/share/packages/e2fs-tools/tune2fs
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools/e2fsck
chmod 755 ./.source/packages/usr/share/packages/e2fs-tools/e2fsck
${do_chown} && chown root:root ./.source/packages/usr/share/packages/e2fs-tools/unpack.sh
chmod 755 ./.source/packages/usr/share/packages/e2fs-tools/unpack.sh
${do_chown} && chown root:root ./sample-config
chmod 755 ./sample-config
${do_chown} && chown root:root ./sample-config/grub.cfg
chmod 644 ./sample-config/grub.cfg
${do_chown} && chown root:root ./sample-config/syslinux.cfg
chmod 644 ./sample-config/syslinux.cfg
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./boot
chmod 755 ./boot
${do_chown} && chown root:root ./boot/backupos
chmod 751 ./boot/backupos
${do_chown} && chown root:root ./boot/backupos/vmlinuz-4.19.0-3-686
chmod 640 ./boot/backupos/vmlinuz-4.19.0-3-686
${do_chown} && chown root:root ./boot/backupos/firmware.img
chmod 640 ./boot/backupos/firmware.img
${do_chown} && chown root:root ./boot/backupos/modules.img-4.19.0-3-686
chmod 640 ./boot/backupos/modules.img-4.19.0-3-686
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/backupos.sh
chmod 750 ./sbin/backupos.sh
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh

mkdir ./.source/rootfs-bin.img-1.30.0/bin
mkdir ./.source/rootfs-bin.img-1.30.0/usr/bin
mkdir ./.source/rootfs/proc
mkdir ./.source/rootfs/mnt
mkdir ./.source/rootfs/sys
mkdir ./.source/rootfs/tmp
mkdir ./.source/rootfs/var
mkdir ./.source/rootfs/run
mkdir ./.source/rootfs/lib
mkdir ./.source/rootfs/home
mkdir ./.source/rootfs/dev
mkdir ./.source/rootfs/sbin
mkdir ./.source/rootfs/etc/modules-load.d

echo -n '' > ./.source/rootfs/etc/modules-load.d/99_modules-load.rc

ln -s ../../bin/env ./.source/rootfs-bin.img-1.30.0/usr/bin/env
ln -s mnt ./.source/rootfs/media
ln -s ../../lib/init/init/K_disable-shutdown-signals.rc ./.source/rootfs/etc/init/K000_disable-shutdown-signals.rc
ln -s ../../lib/init/init/S_network-simple.rc ./.source/rootfs/etc/init/S056_network-simple.rc
ln -s ../../lib/init/init/K_init-log.rc ./.source/rootfs/etc/init/K012_init-log.rc
ln -s ../../lib/init/init/K_sysv.rc ./.source/rootfs/etc/init/K555_sysv.rc
ln -s ../../lib/init/init/S_init-console.rc ./.source/rootfs/etc/init/S999_init-console.rc
ln -s ../../lib/init/init/S_mdev.rc ./.source/rootfs/etc/init/S020_mdev.rc
ln -s ../../lib/init/init/S_sysv.rc ./.source/rootfs/etc/init/S555_sysv.rc
ln -s ../../lib/init/init/S_urandom.rc ./.source/rootfs/etc/init/S024_urandom.rc
ln -s ../../lib/init/init/S_cmdline.rc ./.source/rootfs/etc/init/S028_cmdline.rc
ln -s ../../lib/init/init/S_shutdown-signals.rc ./.source/rootfs/etc/init/S990_shutdown-signals.rc
ln -s ../../lib/init/init/K_swap.rc ./.source/rootfs/etc/init/K808_swap.rc
ln -s ../../lib/init/init/S_hosts.rc ./.source/rootfs/etc/init/S048_hosts.rc
ln -s ../../lib/init/init/S_modules-load.rc ./.source/rootfs/etc/init/S036_modules-load.rc
ln -s ../../lib/init/init/S_modprobe.rc ./.source/rootfs/etc/init/S032_modprobe.rc
ln -s ../../lib/init/init/S_init-log.rc ./.source/rootfs/etc/init/S012_init-log.rc
ln -s ../../lib/init/init/K_console.rc ./.source/rootfs/etc/init/K004_console.rc
ln -s ../../lib/init/init/S_security.rc ./.source/rootfs/etc/init/S052_security.rc
ln -s ../../lib/init/init/S_umask-console-splash.rc ./.source/rootfs/etc/init/S000_umask-console-splash.rc
ln -s ../../lib/init/init/S_mdev.rc ./.source/rootfs/etc/init/S040_mdev.rc
ln -s ../../lib/init/init/K_init-functions.rc ./.source/rootfs/etc/init/K008_init-functions.rc
ln -s ../../lib/init/init/K_poweroff.rc ./.source/rootfs/etc/init/K999_poweroff.rc
ln -s ../../lib/init/init/S_init-functions.rc ./.source/rootfs/etc/init/S004_init-functions.rc
ln -s ../../lib/init/init/K_sendsigs.rc ./.source/rootfs/etc/init/K800_sendsigs.rc
ln -s ../../lib/init/init/K_mount-all.rc ./.source/rootfs/etc/init/K804_mount-all.rc
ln -s ../../lib/init/init/S_hostname.rc ./.source/rootfs/etc/init/S044_hostname.rc
ln -s ../../lib/init/init/S_mount-base.rc ./.source/rootfs/etc/init/S016_mount-base.rc
ln -s ../../lib/init/init/S_path.rc ./.source/rootfs/etc/init/S008_path.rc
ln -s modules-load.d/99_modules-load.rc ./.source/rootfs/etc/modules-load.rc
ln -s ../usr/lib/backupos-init ./.source/rootfs/lib/init
ln -s /media ./.source/rootfs/home/media
ln -s /usr/share/doc ./.source/rootfs/home/doc
ln -s ../lib/init/init.bin ./.source/rootfs/sbin/init
ln -s ../init-functions ./.source/rootfs/usr/lib/backupos-init/init/K_init-functions.rc
ln -s K_urandom.rc ./.source/rootfs/usr/lib/backupos-init/init/S_urandom.rc
ln -s K_swap.rc ./.source/rootfs/usr/lib/backupos-init/init/S_swap.rc
ln -s ../init-log ./.source/rootfs/usr/lib/backupos-init/init/K_init-log.rc
ln -s K_mount-all.rc ./.source/rootfs/usr/lib/backupos-init/init/S_mount-all.rc
ln -s K_sysv.rc ./.source/rootfs/usr/lib/backupos-init/init/S_sysv.rc
ln -s ../init-log ./.source/rootfs/usr/lib/backupos-init/init/S_init-log.rc
ln -s K_network.rc ./.source/rootfs/usr/lib/backupos-init/init/S_network.rc
ln -s ../init-functions ./.source/rootfs/usr/lib/backupos-init/init/S_init-functions.rc
ln -s kmsg-log ./.source/rootfs/usr/lib/backupos-init/init-log
ln -s backupos-menu_1.1.tar ./.source/packages/usr/share/packages/backupos-menu/backupos-menu.tar
ln -s testdisk-7.1.linux26.tar ./.source/packages/usr/share/packages/testdisk/testdisk.tar
ln -s ncurses-base_6.1+20181013-2_all.tar ./.source/packages/usr/share/packages/ncurses-base/ncurses-base.tar

echo 'Installing busybox in rootfs-bin...'
./.source/rootfs-bin.img-1.30.0/lib/busybox/setup.sh > /dev/null 2>&1

echo 'Building backupos-menu package...'
cd ./.source/packages/usr/share/packages/backupos-menu/backupos-menu_1.1
tar cf ../backupos-menu_1.1.tar *
cd ..
rm -r -f ./backupos-menu_1.1
cd ../../../../../..

echo 'Preparing images...'
gzip -9 ./.source/rootfs-bin.img-1.30.0/usr/share/doc/backupos/busybox_config

echo 'Building images... '
cd ./.source
for i in *; do
	echo -n " - ${i}: "
	cd ./${i}
	find | cpio --create --format=newc | gzip -9 > ../../boot/backupos/${i}.img
	chmod 640 ../../boot/backupos/${i}.img
	cd ..
done
cd ..
mv ./boot/backupos/rootfs-bin.img-1.30.0.img ./boot/backupos/rootfs-bin.img-1.30.0

echo 'Setting-up images...'
ln -s modules.img-4.19.0-3-686 ./boot/backupos/modules.img
ln -s rootfs-bin.img-1.30.0 ./boot/backupos/rootfs-bin.img
ln -s vmlinuz-4.19.0-3-686 ./boot/backupos/vmlinuz

echo 'Compressing sources...'
cd ./.source
tar cf ../.source.tar *
cd ..
gzip -9 ./.source.tar
chmod 600 ./.source.tar.gz
rm -r -f ./.source

chmod 644 ./.build.sh
echo ''
exit 0
