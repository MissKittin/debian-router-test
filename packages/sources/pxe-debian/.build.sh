#!/bin/sh
# pxe-debian package
# build script
do_chown='false'

PACKAGE_NAME='pxe-debian'

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
chmod 700 ./sbin
${do_chown} && chown root:root ./sbin/make-kernel-image
chmod 755 ./sbin/make-kernel-image
${do_chown} && chown root:root ./dev-tools
chmod 755 ./dev-tools
${do_chown} && chown root:root ./dev-tools/README.md
chmod 644 ./dev-tools/README.md
${do_chown} && chown root:root ./dev-tools/initrd
chmod 755 ./dev-tools/initrd
${do_chown} && chown root:root ./dev-tools/initrd/init
chmod 755 ./dev-tools/initrd/init
${do_chown} && chown root:root ./dev-tools/.load-modules.sh
chmod 755 ./dev-tools/.load-modules.sh
${do_chown} && chown root:root ./dev-tools/pxe-debian-toolbox.completion
chmod 644 ./dev-tools/pxe-debian-toolbox.completion
${do_chown} && chown root:root ./dev-tools/pxe-debian-toolbox.sh
chmod 755 ./dev-tools/pxe-debian-toolbox.sh
${do_chown} && chown root:root ./autoconfig
chmod 755 ./autoconfig
${do_chown} && chown root:root ./autoconfig/README.md
chmod 644 ./autoconfig/README.md
${do_chown} && chown root:root ./autoconfig/autoconfig
chmod 755 ./autoconfig/autoconfig
${do_chown} && chown root:root ./autoconfig/autoconfig/rootfs.post
chmod 755 ./autoconfig/autoconfig/rootfs.post
${do_chown} && chown root:root ./autoconfig/autoconfig/rootfs.post/tmp
chmod 755 ./autoconfig/autoconfig/rootfs.post/tmp
${do_chown} && chown root:root ./autoconfig/autoconfig/rootfs.post/tmp/fsck.sh
chmod 755 ./autoconfig/autoconfig/rootfs.post/tmp/fsck.sh
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.cfg.d
chmod 755 ./autoconfig/autoconfig/autoconfig.cfg.d
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.cfg.d/services-pre.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.cfg.d/services-pre.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.cfg.d/services-post.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.cfg.d/services-post.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.cfg.d/apt.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.cfg.d/apt.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.cfg.d/udev.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.cfg.d/udev.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.post.d
chmod 755 ./autoconfig/autoconfig/autoconfig.post.d
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.post.d/S06correct-rcS.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.post.d/S06correct-rcS.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.post.d/S03clean-root.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.post.d/S03clean-root.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.post.d/S99fsck.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.post.d/S99fsck.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.post.d/S01clean-etc.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.post.d/S01clean-etc.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/.autoconfig.sh
chmod 755 ./autoconfig/autoconfig/.autoconfig.sh
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.pre.d
chmod 755 ./autoconfig/autoconfig/autoconfig.pre.d
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.pre.d/S10hostname.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.pre.d/S10hostname.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.pre.d/S15udev.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.pre.d/S15udev.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.pre.d/S35apt.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.pre.d/S35apt.rc
${do_chown} && chown root:root ./autoconfig/autoconfig/autoconfig.pre.d/S25network.rc
chmod 644 ./autoconfig/autoconfig/autoconfig.pre.d/S25network.rc
${do_chown} && chown root:root ./autoconfig/autoconfig.rc
chmod 644 ./autoconfig/autoconfig.rc
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/inittab
chmod 644 ./etc/inittab
${do_chown} && chown root:root ./etc/apt
chmod 755 ./etc/apt
${do_chown} && chown root:root ./etc/apt/apt.conf.d
chmod 755 ./etc/apt/apt.conf.d
${do_chown} && chown root:root ./etc/apt/apt.conf.d/99-no-install-recommends
chmod 644 ./etc/apt/apt.conf.d/99-no-install-recommends
${do_chown} && chown root:root ./etc/apt/apt.conf.d/99-autoremove-suggests
chmod 644 ./etc/apt/apt.conf.d/99-autoremove-suggests
${do_chown} && chown root:root ./etc/apt/apt.conf.d/99-no-apt-translations
chmod 644 ./etc/apt/apt.conf.d/99-no-apt-translations
${do_chown} && chown root:root ./etc/dpkg
chmod 755 ./etc/dpkg
${do_chown} && chown root:root ./etc/dpkg/dpkg.cfg.d
chmod 755 ./etc/dpkg/dpkg.cfg.d
${do_chown} && chown root:root ./etc/dpkg/dpkg.cfg.d/01_nolocale
chmod 644 ./etc/dpkg/dpkg.cfg.d/01_nolocale
${do_chown} && chown root:root ./etc/dpkg/dpkg.cfg.d/01_nocompletions
chmod 644 ./etc/dpkg/dpkg.cfg.d/01_nocompletions
${do_chown} && chown root:root ./etc/dpkg/dpkg.cfg.d/01_noincludes
chmod 644 ./etc/dpkg/dpkg.cfg.d/01_noincludes
${do_chown} && chown root:root ./etc/dpkg/dpkg.cfg.d/01_nopixmaps
chmod 644 ./etc/dpkg/dpkg.cfg.d/01_nopixmaps
${do_chown} && chown root:root ./etc/dpkg/dpkg.cfg.d/01_nodoc
chmod 644 ./etc/dpkg/dpkg.cfg.d/01_nodoc
${do_chown} && chown root:root ./etc/init.d
chmod 755 ./etc/init.d
${do_chown} && chown root:root ./etc/init.d/pxe-debian.sh
chmod 755 ./etc/init.d/pxe-debian.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./share
chmod 755 ./share
${do_chown} && chown root:root ./share/pxe-debian
chmod 755 ./share/pxe-debian
${do_chown} && chown root:root ./share/pxe-debian/usr
chmod 755 ./share/pxe-debian/usr
${do_chown} && chown root:root ./share/pxe-debian/usr/local
chmod 755 ./share/pxe-debian/usr/local
${do_chown} && chown root:root ./share/pxe-debian/usr/local/sbin
chmod 750 ./share/pxe-debian/usr/local/sbin
${do_chown} && chown root:root ./share/pxe-debian/usr/local/sbin/sign-autoconfig.sh
chmod 755 ./share/pxe-debian/usr/local/sbin/sign-autoconfig.sh
${do_chown} && chown root:root ./share/pxe-debian/usr/local/sbin/check-kernel-update.sh
chmod 755 ./share/pxe-debian/usr/local/sbin/check-kernel-update.sh
${do_chown} && chown root:root ./share/pxe-debian/usr/local/sbin/update-current-kernel.sh
chmod 755 ./share/pxe-debian/usr/local/sbin/update-current-kernel.sh
${do_chown} && chown root:root ./share/pxe-debian/usr/local/sbin/update-system.sh
chmod 755 ./share/pxe-debian/usr/local/sbin/update-system.sh
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc
chmod 755 ./share/pxe-debian/usr/local/etc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d
chmod 755 ./share/pxe-debian/usr/local/etc/rc.local.d
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S050network.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S050network.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S060syspatches.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S060syspatches.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S024apt_cache.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S024apt_cache.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S070update.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S070update.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S022urandom.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S022urandom.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S020autoconfig.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S020autoconfig.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S030hostname.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S030hostname.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S010automount.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S010automount.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S090opt_fs.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S090opt_fs.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S040passwords.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S040passwords.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S026link_by_label.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S026link_by_label.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S00lsb.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S00lsb.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/etc/rc.local.d/S00log.rc
chmod 644 ./share/pxe-debian/usr/local/etc/rc.local.d/S00log.rc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/share
chmod 755 ./share/pxe-debian/usr/local/share
${do_chown} && chown root:root ./share/pxe-debian/usr/local/share/udhcpc
chmod 755 ./share/pxe-debian/usr/local/share/udhcpc
${do_chown} && chown root:root ./share/pxe-debian/usr/local/share/udhcpc/udhcpc.script
chmod 755 ./share/pxe-debian/usr/local/share/udhcpc/udhcpc.script
${do_chown} && chown root:root ./share/pxe-debian/etc
chmod 755 ./share/pxe-debian/etc
${do_chown} && chown root:root ./share/pxe-debian/etc/init.d
chmod 755 ./share/pxe-debian/etc/init.d
${do_chown} && chown root:root ./share/pxe-debian/etc/init.d/pxe-nas-urandom.sh
chmod 755 ./share/pxe-debian/etc/init.d/pxe-nas-urandom.sh
${do_chown} && chown root:root ./share/pxe-debian/etc/hostname
chmod 644 ./share/pxe-debian/etc/hostname
${do_chown} && chown root:root ./share/pxe-debian/etc/rc.local
chmod 755 ./share/pxe-debian/etc/rc.local
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

mkdir ./autoconfig/autoconfig/rootfs.pre
ln -s ../autoconfig.cfg.d/services-post.rc ./autoconfig/autoconfig/autoconfig.post.d/S50services.rc
ln -s ../autoconfig.cfg.d/services-pre.rc ./autoconfig/autoconfig/autoconfig.pre.d/S30services.rc
mkdir ./share/pxe-debian/etc/rc0.d
mkdir ./share/pxe-debian/etc/rc6.d
echo -n '' > ./etc/init.d/.legacy-bootordering
echo -n '' > ./share/pxe-debian/etc/mtab
echo -n '' > ./share/pxe-debian/etc/motd
echo -n '' > ./share/pxe-debian/etc/issue
ln -s issue ./share/pxe-debian/etc/issue.net
ln -s ../init.d/pxe-nas-urandom.sh ./share/pxe-debian/etc/rc0.d/K01pxe-nas-urandom.sh
ln -s ../init.d/pxe-nas-urandom.sh ./share/pxe-debian/etc/rc6.d/K01pxe-nas-urandom.sh

chmod 644 ./.build.sh
echo ''
exit 0
