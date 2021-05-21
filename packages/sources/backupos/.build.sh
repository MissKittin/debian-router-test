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
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686
chmod 755 ./.source/modules.img-4.19.0-3-686
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib
chmod 755 ./.source/modules.img-4.19.0-3-686/lib
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.symbols.bin
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.symbols.bin
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.builtin
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.builtin
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.symbols
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.symbols
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.devname
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.devname
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.dep
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.dep
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/scx200
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/scx200
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/scx200/scx200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/scx200/scx200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/iris
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/iris
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/iris/iris.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/platform/iris/iris.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/crc32-pclmul.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/crc32-pclmul.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/aes-i586.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/aes-i586.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/glue_helper.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/glue_helper.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/serpent-sse2-i586.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/serpent-sse2-i586.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/twofish-i586.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/twofish-i586.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/aesni-intel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/aesni-intel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/crc32c-intel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/crypto/crc32c-intel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/msr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/msr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/apm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/apm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpu
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpu
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpu/mcheck
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpu/mcheck
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpu/mcheck/mce-inject.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpu/mcheck/mce-inject.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpuid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/kernel/cpuid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/oprofile
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/oprofile
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/oprofile/oprofile.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/arch/x86/oprofile/oprofile.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crypto_engine.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crypto_engine.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/xor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/xor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crc32c_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crc32c_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/lz4hc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/lz4hc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cryptd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cryptd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/tgr192.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/tgr192.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/pcbc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/pcbc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/des_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/des_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/camellia_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/camellia_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crypto_simd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crypto_simd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cast_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cast_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/twofish_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/twofish_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/michael_mic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/michael_mic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/twofish_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/twofish_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ccm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ccm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/tcrypt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/tcrypt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/xts.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/xts.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crypto_user.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crypto_user.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/md4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/md4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/authenc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/authenc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_xor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_xor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_raid6_recov.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_raid6_recov.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_tx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_tx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_memcpy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_memcpy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_pq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/async_tx/async_pq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/lrw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/lrw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd128.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd128.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_skcipher.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_skcipher.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/seed.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/seed.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/jitterentropy_rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/jitterentropy_rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/serpent_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/serpent_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/vmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/vmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/echainiv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/echainiv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/xcbc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/xcbc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/af_alg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/af_alg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/anubis.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/anubis.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/aegis128l.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/aegis128l.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ecdh_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ecdh_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/morus1280.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/morus1280.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cbc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cbc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ctr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ctr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/salsa20_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/salsa20_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/blowfish_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/blowfish_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/gf128mul.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/gf128mul.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cts.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cts.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/fcrypt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/fcrypt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/khazad.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/khazad.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd320.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd320.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/poly1305_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/poly1305_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/morus640.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/morus640.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/aegis128.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/aegis128.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/blowfish_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/blowfish_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_hash.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_hash.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ecb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ecb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/gcm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/gcm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cast6_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cast6_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/wp512.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/wp512.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/tea.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/tea.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/aegis256.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/aegis256.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/sha512_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/sha512_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ansi_cprng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ansi_cprng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cast5_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/cast5_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ghash-generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/ghash-generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/drbg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/drbg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/arc4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/arc4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_aead.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/algif_aead.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crc32_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/crc32_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd160.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd160.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/pcrypt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/pcrypt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd256.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/rmd256.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/chacha20poly1305.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/chacha20poly1305.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/chacha20_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/chacha20_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/lz4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/lz4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/sha3_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/sha3_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/seqiv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/seqiv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/authencesn.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/crypto/authencesn.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/adfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/adfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/adfs/adfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/adfs/adfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/gfs2
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/gfs2
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/gfs2/gfs2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/gfs2/gfs2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx4/qnx4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx4/qnx4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/exofs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/exofs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/exofs/exofs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/exofs/exofs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/exofs/libore.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/exofs/libore.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/sysv
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/sysv
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/sysv/sysv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/sysv/sysv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/befs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/befs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/befs/befs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/befs/befs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-greek.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-greek.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-romanian.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-romanian.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_utf8.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_utf8.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp1251.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp1251.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-13.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-13.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-15.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-15.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp437.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp437.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp862.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp862.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-cyrillic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-cyrillic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp874.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp874.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-9.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-9.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-centeuro.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-centeuro.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_koi8-r.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_koi8-r.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-celtic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-celtic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-iceland.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-iceland.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp950.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp950.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp775.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp775.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp1250.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp1250.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp737.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp737.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp855.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp855.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp857.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp857.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp861.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp861.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp864.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp864.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-5.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-5.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp850.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp850.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-croatian.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-croatian.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp1255.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp1255.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp865.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp865.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp936.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp936.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp866.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp866.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp863.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp863.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_koi8-u.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_koi8-u.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-roman.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-roman.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-7.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-7.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-turkish.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-turkish.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_ascii.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_ascii.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-gaelic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-gaelic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_koi8-ru.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_koi8-ru.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_euc-jp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_euc-jp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-inuit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/mac-inuit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp869.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp869.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp860.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp860.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp932.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp932.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-14.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_iso8859-14.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp949.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp949.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp852.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nls/nls_cp852.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfsplus
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfsplus
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfsplus/hfsplus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfsplus/hfsplus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/romfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/romfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/romfs/romfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/romfs/romfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/afs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/afs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/afs/kafs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/afs/kafs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/bfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/bfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/bfs/bfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/bfs/bfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/cluster
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/cluster
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/cluster/ocfs2_nodemanager.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/cluster/ocfs2_nodemanager.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2_stackglue.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2_stackglue.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2_stack_o2cb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2_stack_o2cb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlmfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlmfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlmfs/ocfs2_dlmfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlmfs/ocfs2_dlmfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2_stack_user.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/ocfs2_stack_user.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlm/ocfs2_dlm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ocfs2/dlm/ocfs2_dlm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cachefiles
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cachefiles
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cachefiles/cachefiles.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cachefiles/cachefiles.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/overlayfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/overlayfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/overlayfs/overlay.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/overlayfs/overlay.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jbd2
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jbd2
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jbd2/jbd2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jbd2/jbd2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/udf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/udf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/udf/udf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/udf/udf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/btrfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/btrfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/btrfs/btrfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/btrfs/btrfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efs/efs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efs/efs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs_common
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs_common
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs_common/grace.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs_common/grace.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs_common/nfs_acl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs_common/nfs_acl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efivarfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efivarfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efivarfs/efivarfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/efivarfs/efivarfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota/quota_v1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota/quota_v1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota/quota_tree.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota/quota_tree.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota/quota_v2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/quota/quota_v2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/freevxfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/freevxfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/freevxfs/freevxfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/freevxfs/freevxfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/crypto
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/crypto
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/crypto/fscrypto.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/crypto/fscrypto.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cifs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cifs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cifs/cifs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/cifs/cifs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/autofs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/autofs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/autofs/autofs4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/autofs/autofs4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fscache
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fscache
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fscache/fscache.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fscache/fscache.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/binfmt_misc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/binfmt_misc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx6
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx6
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx6/qnx6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/qnx6/qnx6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fuse
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fuse
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fuse/fuse.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fuse/fuse.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fuse/cuse.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fuse/cuse.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/mbcache.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/mbcache.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/f2fs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/f2fs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/f2fs/f2fs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/f2fs/f2fs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ceph
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ceph
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ceph/ceph.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ceph/ceph.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/coda
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/coda
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/coda/coda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/coda/coda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfsd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfsd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfsd/nfsd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfsd/nfsd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/9p
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/9p
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/9p/9p.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/9p/9p.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/isofs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/isofs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/isofs/isofs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/isofs/isofs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/affs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/affs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/affs/affs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/affs/affs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/minix
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/minix
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/minix/minix.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/minix/minix.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/dlm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/dlm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/dlm/dlm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/dlm/dlm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/xfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/xfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/xfs/xfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/xfs/xfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/squashfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/squashfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/squashfs/squashfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/squashfs/squashfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ext4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ext4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ext4/ext4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ext4/ext4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/orangefs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/orangefs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/orangefs/orangefs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/orangefs/orangefs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat/fat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat/fat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat/vfat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat/vfat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat/msdos.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/fat/msdos.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/pstore
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/pstore
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/pstore/ramoops.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/pstore/ramoops.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/configfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/configfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/configfs/configfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/configfs/configfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jfs/jfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jfs/jfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/reiserfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/reiserfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/reiserfs/reiserfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/reiserfs/reiserfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hpfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hpfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hpfs/hpfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hpfs/hpfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ecryptfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ecryptfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ecryptfs/ecryptfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ecryptfs/ecryptfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jffs2
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jffs2
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jffs2/jffs2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/jffs2/jffs2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/binfmt_aout.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/binfmt_aout.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/omfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/omfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/omfs/omfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/omfs/omfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ubifs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ubifs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ubifs/ubifs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ubifs/ubifs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ntfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ntfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ntfs/ntfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ntfs/ntfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/lockd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/lockd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/lockd/lockd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/lockd/lockd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ufs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ufs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ufs/ufs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/ufs/ufs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfs/hfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/hfs/hfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nilfs2
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nilfs2
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nilfs2/nilfs2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nilfs2/nilfs2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfsv2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfsv2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfsv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfsv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfsv3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/nfsv3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/flexfilelayout
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/flexfilelayout
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/filelayout
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/filelayout
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/filelayout/nfs_layout_nfsv41_files.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/filelayout/nfs_layout_nfsv41_files.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/blocklayout
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/blocklayout
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lru_cache.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lru_cache.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/raid6
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/raid6
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/raid6/raid6_pq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/raid6/raid6_pq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc16.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc16.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/cordic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/cordic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc-ccitt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc-ccitt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc8.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc8.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc64.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc64.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/bch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/bch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/libcrc32c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/libcrc32c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/pm-notifier-error-inject.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/pm-notifier-error-inject.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/ts_kmp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/ts_kmp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_static_keys.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_static_keys.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/xxhash.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/xxhash.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_user_copy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_user_copy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_bpf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_bpf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/ts_bm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/ts_bm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_static_key_base.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_static_key_base.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/ts_fsm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/ts_fsm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_firmware.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/test_firmware.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/notifier-error-inject.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/notifier-error-inject.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/zstd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/zstd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/zstd/zstd_decompress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/zstd/zstd_decompress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/zstd/zstd_compress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/zstd/zstd_compress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lz4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lz4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lz4/lz4hc_compress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lz4/lz4hc_compress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lz4/lz4_compress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/lz4/lz4_compress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc7.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc7.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/reed_solomon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/reed_solomon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/reed_solomon/reed_solomon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/reed_solomon/reed_solomon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc-itu-t.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/lib/crc-itu-t.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm/zsmalloc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm/zsmalloc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm/z3fold.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm/z3fold.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm/hwpoison-inject.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/mm/hwpoison-inject.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/block
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/block
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/block/bfq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/block/bfq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/block/kyber-iosched.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/block/kyber-iosched.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ife
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ife
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ife/ife.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ife/ife.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/lapb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/lapb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/lapb/lapb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/lapb/lapb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/packet
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/packet
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/packet/af_packet_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/packet/af_packet_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_ip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_ip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_eth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_eth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_netlink.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_netlink.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_ppp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_ppp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_ip6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_ip6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_debugfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/l2tp/l2tp_debugfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/ieee802154_socket.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/ieee802154_socket.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/ieee802154.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/ieee802154.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/6lowpan
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/6lowpan
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/6lowpan/ieee802154_6lowpan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ieee802154/6lowpan/ieee802154_6lowpan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/xprtrdma
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/xprtrdma
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/xprtrdma/rpcrdma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/xprtrdma/rpcrdma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/auth_gss
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/auth_gss
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/sunrpc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sunrpc/sunrpc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/smc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/smc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/smc/smc_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/smc/smc_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/smc/smc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/smc/smc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/8021q
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/8021q
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/8021q/8021q.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/8021q/8021q.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/br_netfilter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/br_netfilter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/bridge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/bridge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtable_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtable_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_ip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_ip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtable_filter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtable_filter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_dnat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_dnat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_stp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_stp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtable_broute.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtable_broute.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_redirect.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_redirect.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_mark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_mark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_log.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_log.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_limit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_limit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_nflog.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_nflog.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_arpreply.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_arpreply.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/nft_reject_bridge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/nft_reject_bridge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_arp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_arp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_pkttype.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_pkttype.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/nf_log_bridge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/nf_log_bridge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_among.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_among.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_ip6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_ip6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_mark_m.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_mark_m.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_vlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_vlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtables.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebtables.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_snat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_snat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_802_3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bridge/netfilter/ebt_802_3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/unix
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/unix
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/unix/unix_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/unix/unix_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_bbr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_bbr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/raw_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/raw_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_mode_transport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_mode_transport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_dctcp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_dctcp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ip_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ip_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ip_vti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ip_vti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ah4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ah4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_mode_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_mode_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ip_gre.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ip_gre.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/gre.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/gre.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_westwood.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_westwood.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_bic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_bic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_hybla.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_hybla.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/udp_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/udp_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_nv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_nv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_vegas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_vegas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_scalable.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_scalable.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_cdg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_cdg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_lp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_lp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_htcp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_htcp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ipcomp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ipcomp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/esp4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/esp4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/udp_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/udp_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_ECN.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_ECN.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/arpt_mangle.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/arpt_mangle.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_chain_route_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_chain_route_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/arptable_filter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/arptable_filter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_socket_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_socket_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_SYNPROXY.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_SYNPROXY.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_log_arp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_log_arp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_masq_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_masq_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_redir_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_redir_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_MASQUERADE.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_MASQUERADE.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_flow_table_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_flow_table_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_log_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_log_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/arp_tables.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/arp_tables.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_rpfilter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_rpfilter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_h323.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_h323.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_chain_nat_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_chain_nat_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_dup_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_dup_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_security.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_security.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_proto_gre.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_proto_gre.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_reject_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_reject_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_snmp_basic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_snmp_basic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_tproxy_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_tproxy_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_ah.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_ah.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_fib_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_fib_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_filter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_filter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_mangle.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_mangle.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ip_tables.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ip_tables.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_pptp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_nat_pptp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_REJECT.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_REJECT.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_dup_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/nft_dup_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_raw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/iptable_raw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_CLUSTERIP.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/netfilter/ipt_CLUSTERIP.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_mode_beet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/xfrm4_mode_beet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_veno.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_veno.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/esp4_offload.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/esp4_offload.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tunnel4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tunnel4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ipip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/ipip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_yeah.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_yeah.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_illinois.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_illinois.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/fou.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/fou.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/inet_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/inet_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_highspeed.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv4/tcp_highspeed.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_ipt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_ipt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_route.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_route.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_sfq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_sfq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_bpf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_bpf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_plug.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_plug.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_connmark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_connmark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_hfsc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_hfsc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_tbf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_tbf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_cmp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_cmp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_pie.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_pie.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_simple.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_simple.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_vlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_vlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_text.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_text.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_rsvp6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_rsvp6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_ipt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_ipt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_hhf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_hhf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_prio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_prio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_atm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_atm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_codel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_codel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_etf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_etf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_cake.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_cake.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_rsvp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_rsvp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_skbprio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_skbprio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_meta_skbtcindex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_meta_skbtcindex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_gred.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_gred.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_netem.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_netem.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_u32.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_u32.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_tcindex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_tcindex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_u32.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_u32.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_htb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_htb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_cgroup.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_cgroup.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_tunnel_key.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_tunnel_key.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_gact.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_gact.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_police.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_police.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_ife.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_ife.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_skbedit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_skbedit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_meta_mark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_meta_mark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_skbmod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_skbmod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_canid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_canid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_flower.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_flower.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_meta_skbprio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_meta_skbprio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_ingress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_ingress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_choke.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_choke.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_dsmark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_dsmark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_nbyte.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_nbyte.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_teql.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_teql.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_cbq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_cbq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_csum.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_csum.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_bpf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_bpf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_drr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_drr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_multiq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_multiq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_qfq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_qfq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_basic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_basic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_sfb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_sfb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_fw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_fw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_mirred.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_mirred.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_pedit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_pedit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_flow.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_flow.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_fq_codel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_fq_codel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_cbs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_cbs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_fq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_fq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_sample.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_sample.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_mqprio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_mqprio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_ipset.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_ipset.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/act_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_meta.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/em_meta.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_red.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/sch_red.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_matchall.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sched/cls_matchall.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/nfc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/nfc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/hci
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/hci
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/hci/hci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/hci/hci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/nfc_digital.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nfc/nfc_digital.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/phonet
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/phonet
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/phonet/pn_pep.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/phonet/pn_pep.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/phonet/phonet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/phonet/phonet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/psample
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/psample
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/psample/psample.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/psample/psample.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wimax
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wimax
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wimax/wimax.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wimax/wimax.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211_crypt_wep.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211_crypt_wep.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/cfg80211.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/cfg80211.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211_crypt_tkip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211_crypt_tkip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211_crypt_ccmp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/wireless/lib80211_crypt_ccmp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rfkill
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rfkill
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rfkill/rfkill.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rfkill/rfkill.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netrom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netrom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netrom/netrom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netrom/netrom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_udp_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_udp_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/sit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/sit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ila
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ila
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ila/ila.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ila/ila.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_ro.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_ro.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/tunnel6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/tunnel6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/esp6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/esp6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ipcomp6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ipcomp6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/esp6_offload.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/esp6_offload.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/fou6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/fou6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_gre.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_gre.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_vti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ip6_vti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ah6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/ah6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_hbh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_hbh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_tproxy_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_tproxy_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_SYNPROXY.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_SYNPROXY.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_frag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_frag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_redir_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_redir_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_rpfilter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_rpfilter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_filter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_filter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_MASQUERADE.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_MASQUERADE.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_masq_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_masq_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_flow_table_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_flow_table_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_nat_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_nat_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_ipv6header.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_ipv6header.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_ah.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_ah.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_mangle.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_mangle.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_reject_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_reject_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_raw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_raw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_REJECT.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_REJECT.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_dup_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_dup_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_mh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_mh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_NPT.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_NPT.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_socket_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_socket_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_chain_nat_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_chain_nat_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_fib_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_fib_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_rt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_rt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_dup_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_dup_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6_tables.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6_tables.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_eui64.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6t_eui64.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_log_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_log_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_chain_route_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nft_chain_route_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_security.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_security.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/ip6table_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_transport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_transport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_beet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ipv6/xfrm6_mode_beet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/clip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/clip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/pppoatm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/pppoatm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/br2684.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/br2684.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/lec.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/lec.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/atm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/atm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/mpoa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/atm/mpoa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rxrpc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rxrpc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rxrpc/rxrpc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rxrpc/rxrpc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vsock.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vsock.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/hv_sock.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/hv_sock.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vmw_vsock_vmci_transport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vmw_vsock_vmci_transport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vmw_vsock_virtio_transport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vmw_vsock_virtio_transport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vsock_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/vmw_vsock/vsock_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netlink
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netlink
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netlink/netlink_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netlink/netlink_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_routing.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_routing.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_mobility.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_mobility.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_udp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_udp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/6lowpan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/6lowpan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_hop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_hop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_dest.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_dest.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_fragment.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_fragment.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_hop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_hop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_frag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_frag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_icmpv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_icmpv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_udp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_udp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_route.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_ghc_ext_route.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_dest.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/6lowpan/nhc_dest.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can-bcm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can-bcm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can-raw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can-raw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can-gw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can-gw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/can/can.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ceph
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ceph
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ceph/libceph.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ceph/libceph.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac80211
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac80211
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac80211/mac80211.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac80211/mac80211.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/vport-gre.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/vport-gre.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/vport-vxlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/vport-vxlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/vport-geneve.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/vport-geneve.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/openvswitch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/openvswitch/openvswitch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp_ipv6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp_ipv6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp_ipv4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dccp/dccp_ipv4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/stp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/stp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/p8022.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/p8022.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/garp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/garp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/mrp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/mrp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/psnap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/802/psnap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/pktgen.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/pktgen.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/drop_monitor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/drop_monitor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/failover.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/failover.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/devlink.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/core/devlink.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sctp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sctp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sctp/sctp_diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sctp/sctp_diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sctp/sctp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/sctp/sctp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds/rds.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds/rds.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds/rds_rdma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds/rds_rdma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds/rds_tcp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rds/rds_tcp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_user.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_user.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_interface.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_interface.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_ipcomp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_ipcomp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_algo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/xfrm/xfrm_algo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/key
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/key
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/key/af_key.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/key/af_key.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p/9pnet_virtio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p/9pnet_virtio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p/9pnet_rdma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p/9pnet_rdma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p/9pnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/9p/9pnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/llc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/llc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/llc/llc2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/llc/llc2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/llc/llc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/llc/llc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_NETMAP.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_NETMAP.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CLASSIFY.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CLASSIFY.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CONNSECMARK.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CONNSECMARK.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_l2tp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_l2tp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_sip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_sip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_realm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_realm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_flow_table_inet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_flow_table_inet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/x_tables.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/x_tables.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_ct.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_ct.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TEE.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TEE.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_u32.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_u32.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_owner.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_owner.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_quota.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_quota.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_string.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_string.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_irc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_irc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_physdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_physdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connbytes.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connbytes.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fwd_netdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fwd_netdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_DSCP.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_DSCP.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fib_netdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fib_netdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_log_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_log_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_irc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_irc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_flow_table.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_flow_table.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connlimit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connlimit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_devgroup.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_devgroup.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CHECKSUM.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CHECKSUM.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CT.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_CT.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TPROXY.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TPROXY.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_sed.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_sed.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_lblc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_lblc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_ovf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_ovf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_ftp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_ftp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_wrr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_wrr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_pe_sip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_pe_sip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_lblcr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_lblcr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_sh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_sh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_dh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_dh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_mh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_mh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_nq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_nq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_lc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_lc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_rr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_rr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_wlc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_wlc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_fo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipvs/ip_vs_fo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_log.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_log.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_bitmap_ip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_bitmap_ip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_bitmap_port.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_bitmap_port.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_mac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_mac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netportnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netportnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_net.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_net.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_bitmap_ipmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_bitmap_ipmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_list_set.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_list_set.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netiface.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_netiface.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipmark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipmark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipportip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/ipset/ip_set_hash_ipportip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_HMARK.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_HMARK.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_nfacct.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_nfacct.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_ftp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_ftp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_mark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_mark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TCPMSS.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TCPMSS.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connmark.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connmark.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_hl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_hl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_iprange.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_iprange.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_cgroup.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_cgroup.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_RATEEST.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_RATEEST.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_sctp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_sctp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_limit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_limit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_NFQUEUE.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_NFQUEUE.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_HL.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_HL.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_helper.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_helper.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_nat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_nat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_NFLOG.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_NFLOG.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_tunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_tunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_REDIRECT.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_REDIRECT.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_time.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_time.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_osf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_osf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_socket.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_socket.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_addrtype.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_addrtype.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_numgen.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_numgen.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_connlimit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_connlimit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_reject.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_reject.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_objref.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_objref.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_tftp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_tftp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_tables.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_tables.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_acct.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_acct.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_LOG.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_LOG.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_osf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_osf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_ecn.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_ecn.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TRACE.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TRACE.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_SECMARK.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_SECMARK.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_dscp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_dscp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_cluster.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_cluster.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_conntrack.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_conntrack.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_synproxy_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_synproxy_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_tables_set.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_tables_set.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_set.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_set.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_mac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_mac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_bpf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_bpf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_hash.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_hash.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_tproxy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_tproxy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_esp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_esp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_statistic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_statistic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fib_inet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fib_inet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_queue.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_queue.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_masq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_masq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_IDLETIMER.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_IDLETIMER.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_dup_netdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_dup_netdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_snmp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_snmp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_hashlimit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_hashlimit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_dccp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_dccp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_ftp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_ftp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_ipvs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_ipvs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_netlink.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_netlink.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_cthelper.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_cthelper.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_netbios_ns.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_netbios_ns.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_osf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_osf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_sane.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_sane.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_log_netdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_log_netdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_fib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_reject_inet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_reject_inet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_sip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_sip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_tftp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_tftp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_tcpmss.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_tcpmss.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_comment.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_comment.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connlabel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_connlabel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_LED.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_LED.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_proto_gre.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_proto_gre.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_policy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_policy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conncount.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conncount.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_broadcast.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_broadcast.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_multiport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_multiport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_tcpudp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_tcpudp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_quota.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_quota.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_state.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_state.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_compat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_compat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_limit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_limit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_AUDIT.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_AUDIT.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_dup_netdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_dup_netdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_socket.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_socket.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_length.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_length.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_cttimeout.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_cttimeout.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_flow_offload.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_flow_offload.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_redir.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_redir.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_recent.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_recent.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_pptp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_pptp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_rateest.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_rateest.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_counter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nft_counter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_log.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_log.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_amanda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_nat_amanda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_pkttype.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_pkttype.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_cpu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_cpu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_ipcomp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_ipcomp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_queue.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nfnetlink_queue.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_h323.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_h323.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TCPOPTSTRIP.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/xt_TCPOPTSTRIP.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_amanda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/netfilter/nf_conntrack_amanda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mpls
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mpls
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mpls/mpls_iptunnel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mpls/mpls_iptunnel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mpls/mpls_router.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mpls/mpls_router.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/batman-adv
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/batman-adv
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/batman-adv/batman-adv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/batman-adv/batman-adv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rose
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rose
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rose/rose.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/rose/rose.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet/netfilter
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet/netfilter
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet/netfilter/dn_rtmsg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet/netfilter/dn_rtmsg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet/decnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/decnet/decnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dns_resolver
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dns_resolver
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dns_resolver/dns_resolver.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/dns_resolver/dns_resolver.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac802154
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac802154
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac802154/mac802154.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/mac802154/mac802154.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/tipc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/tipc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/tipc/tipc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/tipc/tipc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/tipc/diag.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/tipc/diag.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/cmtp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/cmtp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/cmtp/cmtp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/cmtp/cmtp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bluetooth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bluetooth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bnep
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bnep
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bnep/bnep.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bnep/bnep.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/hidp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/hidp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/hidp/hidp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/hidp/hidp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/rfcomm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/rfcomm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/rfcomm/rfcomm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/rfcomm/rfcomm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bluetooth_6lowpan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/bluetooth/bluetooth_6lowpan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/appletalk
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/appletalk
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/appletalk/appletalk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/appletalk/appletalk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ax25
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ax25
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ax25/ax25.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/ax25/ax25.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nsh
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nsh
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nsh/nsh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/net/nsh/nsh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/n_r3964.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/n_r3964.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/ipwireless
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/ipwireless
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/ipwireless/ipwireless.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/ipwireless/ipwireless.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/mxser.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/mxser.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/nozomi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/nozomi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/synclink.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/synclink.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/n_gsm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/n_gsm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/cyclades.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/cyclades.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/jsm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/jsm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/jsm/jsm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/jsm/jsm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/rp2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/rp2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_hub6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_hub6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_moxa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_moxa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_accent.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_accent.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_fourport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_fourport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_exar_st16c554.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_exar_st16c554.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_of.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_of.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/serial_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/serial_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_boca.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_boca.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_exar.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/8250/8250_exar.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/pch_uart.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/serial/pch_uart.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/synclinkmp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/synclinkmp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/rocket.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/rocket.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/n_hdlc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/n_hdlc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/synclink_gt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/tty/synclink_gt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/raw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/raw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/lp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/lp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/toshiba.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/toshiba.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/applicom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/applicom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/nvram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/nvram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/mwave
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/mwave
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/mwave/mwave.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/mwave/mwave.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/virtio_console.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/virtio_console.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/sonypi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/sonypi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/scx200_gpio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/scx200_gpio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/nsc_gpio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/nsc_gpio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ttyprintk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ttyprintk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_poweroff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_poweroff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_devintf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_devintf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_watchdog.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_watchdog.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_msghandler.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_msghandler.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_si.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_si.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_ssif.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ipmi/ipmi_ssif.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_vtpm_proxy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_vtpm_proxy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_i2c_infineon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_i2c_infineon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_atmel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_atmel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_tis_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_tis_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_tis_spi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_tis_spi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/st33zp24
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/st33zp24
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/st33zp24/tpm_st33zp24.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/st33zp24/tpm_st33zp24.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_i2c_nuvoton.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_i2c_nuvoton.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_nsc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_nsc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_tis.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_tis.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_i2c_atmel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_i2c_atmel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_crb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_crb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_infineon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tpm/tpm_infineon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/scr24x_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/scr24x_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/cm4000_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/cm4000_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/synclink_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/synclink_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/cm4040_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pcmcia/cm4040_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pc8736x_gpio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/pc8736x_gpio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hangcheck-timer.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hangcheck-timer.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ppdev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/ppdev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tlclk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/tlclk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/rng-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/rng-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/virtio-rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/virtio-rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/intel-rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/intel-rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/amd-rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/amd-rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/via-rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/via-rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/geode-rng.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/hw_random/geode-rng.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/dtlk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/char/dtlk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-unstripe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-unstripe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-log.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-log.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/faulty.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/faulty.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-bufio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-bufio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-round-robin.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-round-robin.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-snapshot.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-snapshot.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-queue-length.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-queue-length.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/persistent-data
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/persistent-data
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/persistent-data/dm-persistent-data.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/persistent-data/dm-persistent-data.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-log-userspace.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-log-userspace.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid456.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid456.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-bio-prison.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-bio-prison.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid0.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid0.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-switch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-switch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/md-mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/md-mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-integrity.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-integrity.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/linear.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/linear.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-flakey.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-flakey.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-thin-pool.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-thin-pool.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-mirror.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-mirror.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-delay.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-delay.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-writecache.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-writecache.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-multipath.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-multipath.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-crypt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-crypt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-service-time.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-service-time.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-log-writes.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-log-writes.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-zoned.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-zoned.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-cache.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-cache.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-zero.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-zero.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-era.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-era.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/bcache
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/bcache
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/bcache/bcache.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/bcache/bcache.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/multipath.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/multipath.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid10.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/raid10.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-cache-smq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-cache-smq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-region-hash.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-region-hash.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-verity.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-verity.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-raid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/md/dm-raid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/rtsx_pci_ms.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/rtsx_pci_ms.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/r592.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/r592.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/rtsx_usb_ms.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/rtsx_usb_ms.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/jmb38x_ms.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/jmb38x_ms.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/tifm_ms.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/host/tifm_ms.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/core
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/core
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/core/memstick.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/core/memstick.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/core/mspro_block.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/memstick/core/mspro_block.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptfc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptfc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptctl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptctl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptbase.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptbase.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptsas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptsas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptspi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptspi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptscsih.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/message/fusion/mptscsih.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq_conservative.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq_conservative.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-lib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-lib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/gx-suspmod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/gx-suspmod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/longhaul.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/longhaul.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/powernow-k7.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/powernow-k7.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/amd_freq_sensitivity.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/amd_freq_sensitivity.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq_userspace.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq_userspace.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-ich.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-ich.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/pcc-cpufreq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/pcc-cpufreq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-centrino.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-centrino.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/p4-clockmod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/p4-clockmod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/powernow-k8.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/powernow-k8.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-smi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/speedstep-smi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq-nforce2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq-nforce2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/powernow-k6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/powernow-k6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/acpi-cpufreq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/acpi-cpufreq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/longrun.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/longrun.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq_powersave.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cpufreq/cpufreq_powersave.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_msu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_msu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_pti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_pti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_gth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th_gth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hwtracing/intel_th/intel_th.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-smbus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-smbus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-dev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-dev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-stub.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-stub.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-nforce2-s4985.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-nforce2-s4985.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-viperboard.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-viperboard.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-tiny-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-tiny-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ocores.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ocores.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-amd756-s4882.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-amd756-s4882.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-i801.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-i801.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-scmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-scmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-robotfuzz-osif.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-robotfuzz-osif.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-eg20t.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-eg20t.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ali1535.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ali1535.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-pxa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-pxa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-amd8111.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-amd8111.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-parport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-parport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-sis96x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-sis96x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-via.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-via.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-simtec.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-simtec.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-amd756.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-amd756.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-designware-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-designware-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-piix4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-piix4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-cht-wc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-cht-wc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-nforce2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-nforce2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-viapro.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-viapro.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-sis630.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-sis630.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-kempld.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-kempld.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-pca-platform.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-pca-platform.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ali1563.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ali1563.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-taos-evm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-taos-evm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ali15x3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ali15x3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/scx200_acb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/scx200_acb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-parport-light.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-parport-light.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-pca-isa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-pca-isa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ismt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-ismt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-sis5595.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-sis5595.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-diolan-u2c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-diolan-u2c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-isch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/busses/i2c-isch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/algos
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/algos
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/algos/i2c-algo-pca.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/algos/i2c-algo-pca.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/algos/i2c-algo-bit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/algos/i2c-algo-bit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-mux.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/i2c/i2c-mux.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/pvpanic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/pvpanic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/ideapad-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/ideapad-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-wireless.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-wireless.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/eeepc-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/eeepc-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/apple-gmux.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/apple-gmux.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi-descriptor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi-descriptor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/msi-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/msi-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/panasonic-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/panasonic-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/eeepc-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/eeepc-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/toshiba_haps.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/toshiba_haps.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/surfacepro3_button.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/surfacepro3_button.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-rbtn.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-rbtn.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/acer-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/acer-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hp-wireless.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hp-wireless.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi-aio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi-aio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hp_accel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hp_accel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_ips.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_ips.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/mxm-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/mxm-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/compal-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/compal-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_pmc_ipc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_pmc_ipc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/ibm_rtl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/ibm_rtl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_cht_int33fe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_cht_int33fe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/xo1-rfkill.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/xo1-rfkill.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hdaps.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hdaps.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/sony-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/sony-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hp-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/hp-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-smartconnect.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-smartconnect.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/alienware-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/alienware-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-nb-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/asus-nb-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_oaktrail.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_oaktrail.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-smo8800.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-smo8800.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/xo15-ebook.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/xo15-ebook.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/toshiba_acpi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/toshiba_acpi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-hid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-hid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/samsung-q10.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/samsung-q10.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/fujitsu-tablet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/fujitsu-tablet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/amilo-rfkill.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/amilo-rfkill.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi-led.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-wmi-led.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/classmate-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/classmate-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/tc1100-wmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/tc1100-wmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-smbios.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-smbios.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-vbtn.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-vbtn.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/msi-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/msi-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/toshiba_bluetooth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/toshiba_bluetooth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/acerhdf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/acerhdf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/thinkpad_acpi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/thinkpad_acpi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/samsung-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/samsung-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/wmi-bmof.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/wmi-bmof.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/fujitsu-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/fujitsu-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/dell-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-rst.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel-rst.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_int0002_vgpio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/intel_int0002_vgpio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/gpd-pocket-fan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/gpd-pocket-fan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/topstar-laptop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/platform/x86/topstar-laptop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/iscsi_ibft.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/iscsi_ibft.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/dell_rbu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/dell_rbu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/edd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/edd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi/efi-pstore.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi/efi-pstore.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi/efivars.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi/efivars.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi/efibc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/efi/efibc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/dcdbas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/dcdbas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/qemu_fw_cfg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/firmware/qemu_fw_cfg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/extcon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/extcon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/extcon/extcon-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/extcon/extcon-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/extcon/extcon-intel-cht-wc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/extcon/extcon-intel-cht-wc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv/hv_utils.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv/hv_utils.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv/hv_vmbus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv/hv_vmbus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv/hv_balloon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hv/hv_balloon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i82975x_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i82975x_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i82875p_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i82875p_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/e752x_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/e752x_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i5100_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i5100_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/r82600_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/r82600_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/edac_mce_amd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/edac_mce_amd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/amd64_edac_mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/amd64_edac_mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i5000_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i5000_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/ie31200_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/ie31200_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i7300_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i7300_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/amd76x_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/amd76x_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i3000_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i3000_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i3200_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i3200_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i82860_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i82860_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i5400_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i5400_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/x38_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/x38_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i7core_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/i7core_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/e7xxx_edac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/edac/e7xxx_edac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp/ptp_kvm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp/ptp_kvm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp/ptp_pch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp/ptp_pch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp/ptp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ptp/ptp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/powercap
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/powercap
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/powercap/intel_rapl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/powercap/intel_rapl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dax
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dax
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dax/device_dax.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dax/device_dax.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/ipoib
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/ipoib
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/ipoib/ib_ipoib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/ipoib/ib_ipoib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/iser
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/iser
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/iser/ib_iser.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/iser/ib_iser.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/isert
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/isert
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/isert/ib_isert.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/isert/ib_isert.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srp/ib_srp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srp/ib_srp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srpt
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srpt
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srpt/ib_srpt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/ulp/srpt/ib_srpt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/nes
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/nes
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/nes/iw_nes.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/nes/iw_nes.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx5
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx5
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx5/mlx5_ib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx5/mlx5_ib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb4/iw_cxgb4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb4/iw_cxgb4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb3
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb3
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb3/iw_cxgb3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/cxgb3/iw_cxgb3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/i40iw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/i40iw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/i40iw/i40iw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/i40iw/i40iw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mthca
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mthca
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mthca/ib_mthca.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mthca/ib_mthca.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx4/mlx4_ib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/mlx4/mlx4_ib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/ocrdma
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/ocrdma
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/ocrdma/ocrdma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/hw/ocrdma/ocrdma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/sw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/sw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/sw/rxe
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/sw/rxe
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/sw/rxe/rdma_rxe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/sw/rxe/rdma_rxe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/rdma_cm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/rdma_cm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_umad.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_umad.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/iw_cm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/iw_cm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_uverbs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_uverbs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/rdma_ucm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/rdma_ucm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_cm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/infiniband/core/ib_cm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_util.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_util.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_cmdset_0002.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_cmdset_0002.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_probe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_probe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/map_rom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/map_rom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_cmdset_0001.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_cmdset_0001.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_cmdset_0020.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/cfi_cmdset_0020.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/jedec_probe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/jedec_probe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/gen_probe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/gen_probe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/map_absent.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/map_absent.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/chipreg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/chipreg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/map_ram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/chips/map_ram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtd_blkdevs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtd_blkdevs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdoops.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdoops.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdblock.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdblock.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/rfd_ftl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/rfd_ftl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/inftl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/inftl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ssfdc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ssfdc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/mtdram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/mtdram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/mtd_dataflash.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/mtd_dataflash.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/block2mtd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/block2mtd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/m25p80.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/m25p80.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/phram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/phram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/slram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/slram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/sst25l.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/devices/sst25l.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nand_ecc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nand_ecc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nandsim.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nandsim.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/r852.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/r852.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/diskonchip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/diskonchip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/cafe_nand.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/cafe_nand.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nand.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nand.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/cs553x_nand.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/cs553x_nand.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/sm_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/sm_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nand_bch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/raw/nand_bch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/onenand
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/onenand
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/onenand/onenand.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nand/onenand/onenand.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nftl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/nftl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/scx200_docflash.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/scx200_docflash.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/sbc_gxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/sbc_gxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/pcmciamtd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/pcmciamtd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/map_funcs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/map_funcs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/intel_vr_nor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/intel_vr_nor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/plat-ram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/plat-ram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/physmap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/physmap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/nettel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/maps/nettel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/redboot.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/redboot.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdswap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdswap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ftl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ftl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/lpddr
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/lpddr
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/lpddr/lpddr_cmds.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/lpddr/lpddr_cmds.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/lpddr/qinfo_probe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/lpddr/qinfo_probe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/spi-nor
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/spi-nor
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/spi-nor/spi-nor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/spi-nor/spi-nor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ofpart.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ofpart.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ubi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ubi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ubi/ubi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ubi/ubi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdblock_ro.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/mtdblock_ro.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ar7part.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mtd/ar7part.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/fan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/fan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/thermal.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/thermal.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/sbs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/sbs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/video.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/video.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/sbshc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/sbshc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/acpi_tad.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/acpi_tad.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/ac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/ac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/battery.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/battery.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/acpi_ipmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/acpi_ipmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/button.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/button.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/acpi_pad.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/acpi_pad.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/dptf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/dptf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/dptf/dptf_power.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/acpi/dptf/dptf_power.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtlwifi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtlwifi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtlwifi/r8822be.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtlwifi/r8822be.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8188eu
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8188eu
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8188eu/r8188eu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8188eu/r8188eu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36016.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36016.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36067.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36067.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/videocodec.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/videocodec.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36060.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36060.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36050.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/media/zoran/zr36050.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/vt6656
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/vt6656
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/vt6656/vt6656_stage.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/vt6656/vt6656_stage.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192u
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192u
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192u/r8192u_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192u/r8192u_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rts5208
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rts5208
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rts5208/rts5208.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rts5208/rts5208.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8712
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8712
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8712/r8712u.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8712/r8712u.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8723bs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8723bs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8723bs/r8723bs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8723bs/r8723bs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib_crypt_tkip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib_crypt_tkip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib_crypt_ccmp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib_crypt_ccmp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtl8192e
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtl8192e
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib_crypt_wep.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/rtl8192e/rtllib_crypt_wep.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/olpc_dcon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/olpc_dcon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/olpc_dcon/olpc-dcon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/olpc_dcon/olpc-dcon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_apollo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_apollo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_ltlk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_ltlk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_bns.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_bns.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_acntsa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_acntsa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_dtlk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_dtlk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_acntpc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_acntpc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_spkout.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_spkout.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_decext.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_decext.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_soft.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_soft.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_decpc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_decpc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_audptr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_audptr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_txprt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_txprt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_dectlk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_dectlk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_dummy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_dummy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_keypc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/speakup/speakup_keypc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi_pcmcia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi_pcmcia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/kcomedilib
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/kcomedilib
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/kcomedilib/kcomedilib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/kcomedilib/kcomedilib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/comedi_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmda12.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmda12.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2815.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2815.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/usbduxsigma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/usbduxsigma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/rti800.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/rti800.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci224.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci224.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/8255.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/8255.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl816.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl816.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1723.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1723.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08_isa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08_isa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt282x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt282x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_670x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_670x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1724.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1724.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcidda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcidda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2811.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2811.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_3xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_3xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_daq_700.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_daq_700.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_3120.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_3120.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_65xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_65xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_atmio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_atmio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dmm32at.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dmm32at.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci9118.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci9118.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_atmio16d.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_atmio16d.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci236.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci236.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcidas64.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcidas64.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_parport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_parport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_at_a2150.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_at_a2150.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_pcimio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_pcimio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/gsc_hpdi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/gsc_hpdi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/vmk80xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/vmk80xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das1800.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das1800.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcimdda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcimdda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1516.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1516.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adq12b.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adq12b.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/mpc624.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/mpc624.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1720.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1720.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/mite.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/mite.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_8254.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_8254.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/8255_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/8255_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcimdas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcimdas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1710.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1710.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/jr3_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/jr3_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/rtd520.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/rtd520.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_2032.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_2032.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/c6xdigio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/c6xdigio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/mf6x4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/mf6x4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_daq_dio24.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_daq_dio24.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl724.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl724.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_tio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_tio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das16m1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das16m1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt3000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt3000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1500.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1500.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_6527.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_6527.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_bond.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_bond.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci7x3x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci7x3x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1564.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1564.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ii_pci20kc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ii_pci20kc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcidas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_pcidas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_660x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_660x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl726.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl726.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/daqboard2000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/daqboard2000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci6208.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci6208.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ssv_dnp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ssv_dnp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2817.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2817.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/aio_iiro_16.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/aio_iiro_16.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_isadma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_isadma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci263.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci263.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci8164.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci8164.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1032.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_1032.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/s626.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/s626.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/icp_multi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/icp_multi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_isadma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_isadma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmad.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmad.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/multiq3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/multiq3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ke_counter.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ke_counter.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcm3724.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcm3724.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pc263.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pc263.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_usb6501.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_usb6501.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_watchdog.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_watchdog.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/quatech_daqp_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/quatech_daqp_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/contec_pci_dio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/contec_pci_dio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_at_ao.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_at_ao.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl711.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl711.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1760.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci1760.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl818.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl818.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_pcidio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_pcidio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/rti802.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/rti802.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_dio200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_dio200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2801.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2801.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_test.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_test.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_tiocmd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_tiocmd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_16xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_16xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/s526.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/s526.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/me_daq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/me_daq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_mio_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_mio_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl812.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl812.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das16.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das16.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/aio_aio12_8.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/aio_aio12_8.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_dio200_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_dio200_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/usbdux.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/usbdux.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci_dio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adv_pci_dio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das6402.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das6402.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_das16_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/cb_das16_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dac02.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dac02.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/fl512.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/fl512.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/me4000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/me4000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2814.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt2814.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci230.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pci230.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_dio200_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_dio200_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl730.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcl730.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci9111.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/adl_pci9111.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das08_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/usbduxfast.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/usbduxfast.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das800.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/das800.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt9812.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dt9812.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/ni_labpc_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmuio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmuio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pc236_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pc236_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_8255.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/comedi_8255.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pc236.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/amplc_pc236.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_2200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_2200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmmio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/pcmmio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dyna_pci10xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/dyna_pci10xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_3501.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/comedi/drivers/addi_apci_3501.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/wlan-ng
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/wlan-ng
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/wlan-ng/prism2_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/staging/wlan-ng/prism2_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/rtsx_usb_sdmmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/rtsx_usb_sdmmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/rtsx_pci_sdmmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/rtsx_pci_sdmmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/cb710-mmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/cb710-mmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/cqhci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/cqhci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/ushc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/ushc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdhci-acpi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdhci-acpi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/via-sdmmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/via-sdmmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdhci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdhci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/tifm_sd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/tifm_sd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/wbsd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/wbsd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdhci-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdhci-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/vub300.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/vub300.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/toshsd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/toshsd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdricoh_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/host/sdricoh_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/mmc_block.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/mmc_block.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/pwrseq_emmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/pwrseq_emmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/mmc_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/mmc_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/pwrseq_simple.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/pwrseq_simple.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/sdio_uart.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mmc/core/sdio_uart.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/solos-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/solos-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/nicstar.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/nicstar.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/he.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/he.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/uPD98402.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/uPD98402.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/lanai.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/lanai.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/iphase.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/iphase.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/idt77252.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/idt77252.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/horizon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/horizon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/firestream.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/firestream.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/fore_200e.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/fore_200e.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/zatm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/zatm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/atmtcp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/atmtcp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/eni.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/eni.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/suni.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/suni.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/adummy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/adummy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/ambassador.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/atm/ambassador.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/hifn_795x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/hifn_795x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxx/qat_c3xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxx/qat_c3xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_common
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_common
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_common/intel_qat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_common/intel_qat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62xvf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62xvf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62xvf/qat_c62xvf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62xvf/qat_c62xvf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxxvf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxxvf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxxvf/qat_c3xxxvf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c3xxxvf/qat_c3xxxvf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xcc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xcc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xcc/qat_dh895xcc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xcc/qat_dh895xcc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62x
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62x
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62x/qat_c62x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_c62x/qat_c62x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xccvf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xccvf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xccvf/qat_dh895xccvf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/qat/qat_dh895xccvf/qat_dh895xccvf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/ccp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/ccp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/ccp/ccp-crypto.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/ccp/ccp-crypto.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/ccp/ccp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/ccp/ccp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/virtio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/virtio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/virtio/virtio_crypto.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/virtio/virtio_crypto.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/chelsio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/chelsio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/chelsio/chcr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/chelsio/chcr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/padlock-aes.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/padlock-aes.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/geode-aes.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/geode-aes.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/padlock-sha.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/crypto/padlock-sha.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bcma
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bcma
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bcma/bcma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bcma/bcma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss-sirf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss-sirf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss-serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss-serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss-ubx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gnss/gnss-ubx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pcie
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pcie
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pcie/aer_inject.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pcie/aer_inject.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pci-stub.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pci-stub.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/cpqphp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/cpqphp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/cpcihp_zt5550.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/cpcihp_zt5550.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/cpcihp_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/cpcihp_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/ibmphp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/ibmphp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/acpiphp_ibm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/hotplug/acpiphp_ibm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pci-pf-stub.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pci/pci-pf-stub.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cdrom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cdrom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cdrom/cdrom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/cdrom/cdrom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ssb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ssb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ssb/ssb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ssb/ssb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/clocksource
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/clocksource
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/clocksource/scx200_hrt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/clocksource/scx200_hrt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/clocksource/cs5535-clockevt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/clocksource/cs5535-clockevt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-microsoft.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-microsoft.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-pl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-pl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cherry.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cherry.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/usbhid
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/usbhid
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/usbhid/usbhid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/usbhid/usbhid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-primax.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-primax.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-kensington.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-kensington.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-magicmouse.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-magicmouse.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-steelseries.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-steelseries.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-rmi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-rmi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-a4tech.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-a4tech.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sensor-custom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sensor-custom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-chicony.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-chicony.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-nti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-nti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-betopff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-betopff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cougar.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cougar.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sony.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sony.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-waltop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-waltop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-lua.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-lua.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-belkin.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-belkin.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-tmff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-tmff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-holtek-mouse.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-holtek-mouse.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-multitouch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-multitouch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-zydacron.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-zydacron.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-prodikeys.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-prodikeys.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-gaff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-gaff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-alps.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-alps.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-zpff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-zpff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-topseed.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-topseed.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-logitech-dj.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-logitech-dj.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-led.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-led.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cp2112.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cp2112.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ite.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ite.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-steam.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-steam.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-holtek-kbd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-holtek-kbd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-wiimote.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-wiimote.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-redragon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-redragon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-accutouch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-accutouch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-uclogic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-uclogic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-ryos.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-ryos.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-logitech-hidpp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-logitech-hidpp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sjoy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sjoy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-kye.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-kye.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sensor-hub.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sensor-hub.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cypress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cypress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-holtekff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-holtekff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-koneplus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-koneplus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-asus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-asus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-dr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-dr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-saitek.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-saitek.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-picolcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-picolcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-konepure.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-konepure.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-penmount.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-penmount.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-xinmo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-xinmo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-emsff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-emsff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-speedlink.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-speedlink.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-logitech.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-logitech.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/uhid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/uhid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-udraw-ps3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-udraw-ps3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-hyperv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-hyperv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-retrode.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-retrode.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-savu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-savu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ezkey.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ezkey.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-elo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-elo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-corsair.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-corsair.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-mf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-mf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-jabra.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-jabra.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/wacom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/wacom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-apple.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-apple.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-arvo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-arvo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/i2c-hid
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/i2c-hid
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/i2c-hid/i2c-hid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/i2c-hid/i2c-hid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-samsung.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-samsung.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-tivo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-tivo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-kovaplus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-kovaplus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sunplus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-sunplus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-twinhan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-twinhan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-appleir.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-appleir.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-pyra.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-pyra.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-plantronics.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-plantronics.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-kone.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-kone.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-lcpower.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-lcpower.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cmedia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-cmedia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-elecom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-elecom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-axff.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-axff.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ntrig.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ntrig.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-aureal.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-aureal.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-lenovo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-lenovo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-gembird.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-gembird.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-gyration.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-gyration.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-petalynx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-petalynx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-keytouch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-keytouch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ortek.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-ortek.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-monterey.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-monterey.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-isku.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-roccat-isku.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-icade.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-icade.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-elan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/hid/hid-elan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/of
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/of
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/of/of_mdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/of/of_mdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_mf624.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_mf624.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_pci_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_pci_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_netx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_netx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_sercos3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_sercos3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_aec.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_aec.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_hv_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_hv_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_cif.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uio/uio_cif.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/apds9802als.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/apds9802als.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/enclosure.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/enclosure.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/isl29020.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/isl29020.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/phantom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/phantom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/apds990x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/apds990x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/altera-stapl
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/altera-stapl
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/altera-stapl/altera-stapl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/altera-stapl/altera-stapl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ibmasm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ibmasm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ibmasm/ibmasm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ibmasm/ibmasm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cb710
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cb710
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cb710/cb710.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cb710/cb710.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/vmw_balloon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/vmw_balloon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/lis3lv02d
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/lis3lv02d
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/lis3lv02d/lis3lv02d.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/lis3lv02d/lis3lv02d.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/lis3lv02d/lis3lv02d_i2c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/lis3lv02d/lis3lv02d_i2c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/vmw_vmci
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/vmw_vmci
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/vmw_vmci/vmw_vmci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/vmw_vmci/vmw_vmci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/tifm_7xx1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/tifm_7xx1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/pch_phub.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/pch_phub.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/at24.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/at24.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/max6875.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/max6875.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/eeprom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/eeprom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/at25.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/at25.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/eeprom_93cx6.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/eeprom/eeprom_93cx6.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ds1682.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ds1682.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ioc4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ioc4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/c2port
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/c2port
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/c2port/core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/c2port/core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/c2port/c2port-duramar2150.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/c2port/c2port-duramar2150.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/hpilo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/hpilo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/mei
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/mei
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/mei/mei-me.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/mei/mei-me.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/mei/mei.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/mei/mei.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/bh1770glc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/bh1770glc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/tifm_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/tifm_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/hmc6352.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/hmc6352.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ics932s401.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ics932s401.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ad525x_dpot-i2c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ad525x_dpot-i2c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cardreader
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cardreader
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cardreader/rtsx_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cardreader/rtsx_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cardreader/rtsx_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cardreader/rtsx_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ad525x_dpot-spi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ad525x_dpot-spi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/tsl2550.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/tsl2550.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/isl29003.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/isl29003.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ad525x_dpot.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/ad525x_dpot.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cs5535-mfgpt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/misc/cs5535-mfgpt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_balloon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_balloon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_ring.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_ring.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_input.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_input.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_mmio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/virtio/virtio_mmio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/uwb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/uwb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/hwa-rc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/hwa-rc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480/i1480-est.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480/i1480-est.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480/dfu
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480/dfu
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480/dfu/i1480-dfu-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/i1480/dfu/i1480-dfu-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/umc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/umc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/whc-rc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/whc-rc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/whci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/uwb/whci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel-lpss-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel-lpss-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel-lpss-acpi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel-lpss-acpi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/lpc_ich.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/lpc_ich.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/cs5535-mfd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/cs5535-mfd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/viperboard.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/viperboard.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel_soc_pmic_bxtwc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel_soc_pmic_bxtwc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/kempld-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/kempld-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel-lpss.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel-lpss.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/axp20x-i2c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/axp20x-i2c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/axp20x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/axp20x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/lpc_sch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/lpc_sch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel_soc_pmic_chtdc_ti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/intel_soc_pmic_chtdc_ti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/menf21bmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/menf21bmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/vx855.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/mfd/vx855.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-kempld.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-kempld.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-pci-idio-16.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-pci-idio-16.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-pch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-pch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-ml-ioh.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-ml-ioh.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-amdpt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-amdpt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-vx855.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-vx855.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-cs5535.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-cs5535.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-viperboard.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-viperboard.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-exar.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-exar.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-pcie-idio-24.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/gpio/gpio-pcie-idio-24.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/be2iscsi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/be2iscsi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/be2iscsi/be2iscsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/be2iscsi/be2iscsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla2xxx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla2xxx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla2xxx/qla2xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla2xxx/qla2xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla2xxx/tcm_qla2xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla2xxx/tcm_qla2xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libfc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libfc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libfc/libfc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libfc/libfc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2fc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2fc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2fc/bnx2fc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2fc/bnx2fc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sr_mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sr_mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/isci
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/isci
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/isci/isci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/isci/isci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aha1542.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aha1542.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osd/libosd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osd/libosd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osd/osd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osd/osd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libsas
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libsas
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libsas/libsas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libsas/libsas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedi/qedi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedi/qedi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libiscsi_tcp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libiscsi_tcp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qlogicfas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qlogicfas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/snic
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/snic
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/snic/snic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/snic/snic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/hpsa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/hpsa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ipr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ipr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mpt3sas
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mpt3sas
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mpt3sas/mpt3sas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mpt3sas/mpt3sas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ips.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ips.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/csiostor
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/csiostor
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/csiostor/csiostor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/csiostor/csiostor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sd_mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sd_mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla1280.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla1280.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pm8001
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pm8001
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pm8001/pm80xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pm8001/pm80xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fnic
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fnic
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fnic/fnic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fnic/fnic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_fc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_fc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_spi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_spi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid/megaraid_mm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid/megaraid_mm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid/megaraid_sas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid/megaraid_sas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid/megaraid_mbox.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid/megaraid_mbox.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fcoe
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fcoe
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fcoe/fcoe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fcoe/fcoe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fcoe/libfcoe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/fcoe/libfcoe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qlogicfas408.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qlogicfas408.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/arcmsr
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/arcmsr
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/arcmsr/arcmsr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/arcmsr/arcmsr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/am53c974.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/am53c974.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/dmx3191d.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/dmx3191d.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/stex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/stex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ses.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ses.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_srp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_srp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/megaraid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/raid_class.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/raid_class.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic7xxx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic7xxx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic7xxx/aic79xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic7xxx/aic79xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic7xxx/aic7xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic7xxx/aic7xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/smartpqi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/smartpqi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/smartpqi/smartpqi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/smartpqi/smartpqi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/iscsi_boot_sysfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/iscsi_boot_sysfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/atp870u.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/atp870u.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/virtio_scsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/virtio_scsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mvsas
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mvsas
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mvsas/mvsas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mvsas/mvsas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/hv_storvsc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/hv_storvsc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/gdth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/gdth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb4i
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb4i
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb4i/cxgb4i.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb4i/cxgb4i.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb3i
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb3i
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb3i/cxgb3i.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/cxgb3i/cxgb3i.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/libcxgbi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/cxgbi/libcxgbi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_sas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_sas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/dc395x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/dc395x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/esas2r
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/esas2r
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/esas2r/esas2r.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/esas2r/esas2r.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic94xx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic94xx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic94xx/aic94xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aic94xx/aic94xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/st.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/st.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/hptiop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/hptiop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_rdac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_rdac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_hp_sw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_hp_sw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_emc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_emc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_alua.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/device_handler/scsi_dh_alua.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2i
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2i
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2i/bnx2i.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bnx2i/bnx2i.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/BusLogic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/BusLogic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aacraid
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aacraid
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aacraid/aacraid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aacraid/aacraid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bfa
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bfa
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bfa/bfa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/bfa/bfa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_iscsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_transport_iscsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/qlogic_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/qlogic_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/sym53c500_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/sym53c500_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/nsp_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/nsp_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/aha152x_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pcmcia/aha152x_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sym53c8xx_2
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sym53c8xx_2
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sym53c8xx_2/sym53c8xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/sym53c8xx_2/sym53c8xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/3w-9xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/3w-9xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/initio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/initio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/nsp32.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/nsp32.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/iscsi_tcp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/iscsi_tcp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/advansys.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/advansys.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/3w-xxxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/3w-xxxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mvumi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/mvumi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/dpt_i2o.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/dpt_i2o.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pmcraid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/pmcraid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/wd719x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/wd719x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aha152x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/aha152x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ufs
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ufs
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ufs/ufshcd-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ufs/ufshcd-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ufs/ufshcd-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/ufs/ufshcd-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osst.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/osst.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_debug.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_debug.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/esp_scsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/esp_scsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedf/qedf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qedf/qedf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libiscsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/libiscsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/3w-sas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/3w-sas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla4xxx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla4xxx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla4xxx/qla4xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/qla4xxx/qla4xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/scsi_mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/lpfc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/lpfc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/lpfc/lpfc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/lpfc/lpfc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/vmw_pvscsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/scsi/vmw_pvscsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-bitbang.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-bitbang.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-butterfly.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-butterfly.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-topcliff-pch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-topcliff-pch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-lm70llp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/spi/spi-lm70llp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/pps_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/pps_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/clients
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/clients
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/clients/pps_parport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/clients/pps_parport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/clients/pps-ldisc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pps/clients/pps-ldisc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/i82092.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/i82092.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pd6729.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pd6729.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/i82365.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/i82365.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/tcic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/tcic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pcmcia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pcmcia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pcmcia_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pcmcia_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/yenta_socket.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/yenta_socket.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pcmcia_rsrc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/pcmcia/pcmcia_rsrc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/dw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/dw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/dw/dw_dmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/dw/dw_dmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/dw/dw_dmac_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/dw/dw_dmac_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/idma64.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/idma64.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/pch_dma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/dma/pch_dma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost_vsock.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost_vsock.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost_scsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost_scsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost_net.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost_net.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/vhost/vhost.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-fabrics.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-fabrics.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-fc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-fc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-rdma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/host/nvme-rdma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target/nvmet-fc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target/nvmet-fc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target/nvmet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target/nvmet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target/nvmet-rdma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/nvme/target/nvmet-rdma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ohci-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ohci-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/sl811-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/sl811-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/u132-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/u132-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/uhci-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/uhci-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/hwa-hc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/hwa-hc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ohci-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ohci-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/whci
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/whci
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/whci/whci-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/whci/whci-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ehci-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ehci-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/xhci-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/xhci-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ehci-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/ehci-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/sl811_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/sl811_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/xhci-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/host/xhci-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/g_serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/g_serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/g_ether.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/g_ether.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/g_ffs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/g_ffs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/gadgetfs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/legacy/gadgetfs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ss_lb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ss_lb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_uac1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_uac1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/u_serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/u_serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ecm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ecm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_fs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_fs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_acm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_acm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ncm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ncm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_midi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_midi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_phonet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_phonet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_obex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_obex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/u_audio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/u_audio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_mass_storage.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_mass_storage.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_uvc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_uvc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_hid.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_hid.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_printer.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_printer.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_eem.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_eem.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_rndis.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_rndis.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ecm_subset.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_ecm_subset.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/u_ether.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/u_ether.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_uac2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/function/usb_f_uac2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/libcomposite.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/libcomposite.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/snps_udc_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/snps_udc_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/amd5536udc_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/amd5536udc_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/udc-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/udc-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/net2280.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/net2280.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/pch_udc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/gadget/udc/pch_udc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/mon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/mon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/mon/usbmon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/mon/usbmon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore/wusb-cbaf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore/wusb-cbaf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore/wusb-wa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore/wusb-wa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore/wusbcore.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/wusbcore/wusbcore.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/image
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/image
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/image/microtek.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/image/microtek.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/image/mdc800.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/image/mdc800.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/usbtmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/usbtmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/cdc-acm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/cdc-acm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/usblp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/usblp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/cdc-wdm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/class/cdc-wdm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/common
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/common
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/common/usb-common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/common/usb-common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/ueagle-atm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/ueagle-atm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/xusbatm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/xusbatm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/speedtch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/speedtch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/cxacru.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/cxacru.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/usbatm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/atm/usbatm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/usbip-vudc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/usbip-vudc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/vhci-hcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/vhci-hcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/usbip-core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/usbip-core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/usbip-host.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/usbip/usbip-host.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/core
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/core
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/core/ledtrig-usbport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/core/ledtrig-usbport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/core/usbcore.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/core/usbcore.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/typec.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/typec.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/fusb302
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/fusb302
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/fusb302/fusb302.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/fusb302/fusb302.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/tcpm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/tcpm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/ucsi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/ucsi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/ucsi/typec_ucsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/ucsi/typec_ucsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/ucsi/ucsi_acpi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/ucsi/ucsi_acpi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/tps6598x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/typec/tps6598x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/aircable.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/aircable.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mxuport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mxuport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/qcserial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/qcserial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/sierra.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/sierra.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/cypress_m8.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/cypress_m8.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ark3116.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ark3116.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usbserial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usbserial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/visor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/visor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usb-serial-simple.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usb-serial-simple.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/keyspan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/keyspan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ir-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ir-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/f81232.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/f81232.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/belkin_sa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/belkin_sa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/xsens_mt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/xsens_mt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/upd78f0730.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/upd78f0730.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/whiteheat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/whiteheat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mos7840.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mos7840.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/io_edgeport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/io_edgeport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/cyberjack.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/cyberjack.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ch341.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ch341.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usb_debug.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usb_debug.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/safe_serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/safe_serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/oti6858.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/oti6858.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ipaq.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ipaq.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/metro-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/metro-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/io_ti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/io_ti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ipw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ipw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/empeg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/empeg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/quatech2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/quatech2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ti_usb_3410_5052.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ti_usb_3410_5052.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/kobil_sct.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/kobil_sct.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/symbolserial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/symbolserial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/keyspan_pda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/keyspan_pda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/pl2303.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/pl2303.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ssu100.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ssu100.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/spcp8x5.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/spcp8x5.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/iuu_phoenix.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/iuu_phoenix.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/opticon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/opticon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usb_wwan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/usb_wwan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/navman.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/navman.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ftdi_sio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/ftdi_sio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/cp210x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/cp210x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/omninet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/omninet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mct_u232.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mct_u232.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/garmin_gps.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/garmin_gps.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/f81534.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/f81534.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mos7720.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/mos7720.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/kl5kusb105.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/kl5kusb105.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/qcaux.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/qcaux.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/option.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/option.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/wishbone-serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/wishbone-serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/digi_acceleport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/serial/digi_acceleport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ldusb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ldusb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/emi62.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/emi62.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/trancevibrator.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/trancevibrator.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/cytherm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/cytherm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/uss720.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/uss720.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/iowarrior.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/iowarrior.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/yurex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/yurex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ftdi-elan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ftdi-elan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/emi26.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/emi26.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/adutux.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/adutux.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/sisusbvga
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/sisusbvga
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/sisusbvga/sisusbvga.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/sisusbvga/sisusbvga.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ehset.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ehset.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/appledisplay.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/appledisplay.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/rio500.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/rio500.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/usblcd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/usblcd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/chaoskey.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/chaoskey.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/usbsevseg.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/usbsevseg.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/legousbtower.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/legousbtower.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/usbtest.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/usbtest.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/cypress_cy7c63.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/cypress_cy7c63.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/idmouse.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/idmouse.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ezusb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/ezusb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/isight_firmware.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/misc/isight_firmware.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/roles
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/roles
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/roles/roles.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/roles/roles.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-freecom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-freecom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-realtek.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-realtek.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-karma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-karma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-datafab.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-datafab.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-sddr09.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-sddr09.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-jumpshot.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-jumpshot.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-alauda.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-alauda.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-cypress.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-cypress.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-eneub6250.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-eneub6250.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-usbat.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-usbat.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/uas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/uas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-onetouch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-onetouch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/usb-storage.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/usb-storage.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-isd200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-isd200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-sddr55.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/usb/storage/ums-sddr55.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport_serial.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport_serial.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport_pc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport_pc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/parport/parport.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi/cxgbit
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi/cxgbit
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi/cxgbit/cxgbit.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi/cxgbit/cxgbit.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi/iscsi_target_mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/iscsi/iscsi_target_mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_file.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_file.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/loopback
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/loopback
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/loopback/tcm_loop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/loopback/tcm_loop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_pscsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_pscsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_mod.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_mod.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_iblock.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_iblock.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_user.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/target_core_user.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/tcm_fc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/tcm_fc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/tcm_fc/tcm_fc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/tcm_fc/tcm_fc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/sbp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/sbp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/sbp/sbp_target.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/target/sbp/sbp_target.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/drbd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/drbd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/drbd/drbd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/drbd/drbd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/mtip32xx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/mtip32xx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/mtip32xx/mtip32xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/mtip32xx/mtip32xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/aoe
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/aoe
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/aoe/aoe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/aoe/aoe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/pktcdvd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/pktcdvd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/loop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/loop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/brd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/brd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/virtio_blk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/virtio_blk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/zram
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/zram
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/zram/zram.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/zram/zram.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/null_blk.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/null_blk.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/floppy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/floppy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/nbd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/nbd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/umem.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/umem.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/DAC960.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/DAC960.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/sx8.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/sx8.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/rbd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/block/rbd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters/w1-gpio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters/w1-gpio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters/ds2482.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters/ds2482.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters/ds2490.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/masters/ds2490.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/wire.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/wire.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2781.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2781.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds28e17.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds28e17.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2431.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2431.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2805.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2805.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2406.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2406.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2405.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2405.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2408.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2408.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2438.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2438.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2780.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2780.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2433.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2433.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2413.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2413.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_smem.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_smem.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_therm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_therm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2423.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds2423.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds28e04.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/w1/slaves/w1_ds28e04.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/hci_uart.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/hci_uart.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btmrvl_sdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btmrvl_sdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bpa10x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bpa10x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btusb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btusb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/hci_vhci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/hci_vhci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bt3c_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bt3c_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btsdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btsdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btrsi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btrsi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/dtl1_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/dtl1_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btqca.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btqca.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btrtl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btrtl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bluecard_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bluecard_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bcm203x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bcm203x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bfusb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/bfusb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btmtkuart.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btmtkuart.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btmrvl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btmrvl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btbcm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btbcm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/hci_nokia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/hci_nokia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/ath3k.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/ath3k.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btintel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/bluetooth/btintel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/fealnx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/fealnx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek/8139too.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek/8139too.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek/r8169.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek/r8169.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek/8139cp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/realtek/8139cp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/nvidia
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/nvidia
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/nvidia/forcedeth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/nvidia/forcedeth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/myricom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/myricom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/myricom/myri10ge
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/myricom/myri10ge
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/myricom/myri10ge/myri10ge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/myricom/myri10ge/myri10ge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion/s2io.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion/s2io.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion/vxge
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion/vxge
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion/vxge/vxge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/neterion/vxge/vxge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cirrus
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cirrus
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cirrus/cs89x0.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cirrus/cs89x0.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/packetengines
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/packetengines
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/packetengines/hamachi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/packetengines/hamachi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/packetengines/yellowfin.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/packetengines/yellowfin.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/alx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/alx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/alx/alx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/alx/alx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1c
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1c
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1c/atl1c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1c/atl1c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atlx
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atlx
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atlx/atl1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atlx/atl1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atlx/atl2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atlx/atl2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1e
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1e
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1e/atl1e.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/atheros/atl1e/atl1e.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/oki-semi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/oki-semi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/oki-semi/pch_gbe
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/oki-semi/pch_gbe
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/rdc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/rdc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/rdc/r6040.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/rdc/r6040.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/de2104x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/de2104x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/dmfe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/dmfe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/xircom_cb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/xircom_cb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/tulip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/tulip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/uli526x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/uli526x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/winbond-840.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dec/tulip/winbond-840.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qed
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qed
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qed/qed.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qed/qed.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlcnic
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlcnic
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlcnic/qlcnic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlcnic/qlcnic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlge
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlge
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlge/qlge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qlge/qlge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qede
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qede
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qede/qede.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qede/qede.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/netxen
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/netxen
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/netxen/netxen_nic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/netxen/netxen_nic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qla3xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/qlogic/qla3xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/tehuti
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/tehuti
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/tehuti/tehuti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/tehuti/tehuti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/via
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/via
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/via/via-velocity.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/via/via-velocity.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/via/via-rhine.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/via/via-rhine.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sis
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sis
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sis/sis900.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sis/sis900.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sis/sis190.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sis/sis190.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dlink
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dlink
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dlink/sundance.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dlink/sundance.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dlink/dl2k.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/dlink/dl2k.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cisco
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cisco
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cisco/enic
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cisco/enic
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cisco/enic/enic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/cisco/enic/enic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/xircom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/xircom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/xircom/xirc2ps_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/xircom/xirc2ps_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/nmclan_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/nmclan_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/pcnet32.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/pcnet32.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/amd8111e.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/amd8111e.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/lance.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/lance.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/ni65.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amd/ni65.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/b44.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/b44.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/tg3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/tg3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnx2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnx2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/cnic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/cnic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnx2x
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnx2x
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnx2x/bnx2x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnx2x/bnx2x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnxt
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnxt
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlxfw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlxfw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlxfw/mlxfw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlxfw/mlxfw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx5
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx5
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx5/core
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx5/core
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_en.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_en.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/silan
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/silan
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/silan/sc92031.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/silan/sc92031.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/wd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/wd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/ne2k-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/ne2k-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/8390p.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/8390p.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/axnet_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/axnet_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/ne.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/ne.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/smc-ultra.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/smc-ultra.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/pcnet_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/pcnet_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/8390.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/8390/8390.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c589_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c589_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c515.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c515.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c574_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c574_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/typhoon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/typhoon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c509.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c509.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c59x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/3com/3c59x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/micrel
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/micrel
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/micrel/ksz884x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/micrel/ksz884x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/jme.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/jme.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/natsemi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/natsemi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/natsemi/natsemi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/natsemi/natsemi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/natsemi/ns83820.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/natsemi/ns83820.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/hp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/hp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/hp/hp100.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/hp/hp100.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/ti
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/ti
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/ti/tlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/ti/tlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4/cxgb4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4/cxgb4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb3
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb3
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb3/cxgb3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb3/cxgb3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb/cxgb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb/cxgb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4vf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4vf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/libcxgb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/libcxgb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/libcxgb/libcxgb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/chelsio/libcxgb/libcxgb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/huawei
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/huawei
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/huawei/hinic
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/huawei/hinic
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/huawei/hinic/hinic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/huawei/hinic/hinic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/smc91c92_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/smc91c92_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/epic100.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/epic100.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/smc9194.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/smc9194.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/smsc9420.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/smsc/smsc9420.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/microchip
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/microchip
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/microchip/lan743x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/microchip/lan743x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/fujitsu
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/fujitsu
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/fujitsu/fmvj18x_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/fujitsu/fmvj18x_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc/falcon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc/falcon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc/falcon/sfc-falcon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc/falcon/sfc-falcon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc/sfc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sfc/sfc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/cassini.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/cassini.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/niu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/niu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/sunhme.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/sunhme.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/sungem.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/sun/sungem.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/brocade
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/brocade
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/brocade/bna
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/brocade/bna
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/brocade/bna/bna.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/brocade/bna/bna.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000/e1000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000/e1000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40e
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40e
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40e/i40e.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40e/i40e.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igbvf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igbvf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igbvf/igbvf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igbvf/igbvf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e100.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e100.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ice
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ice
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ice/ice.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ice/ice.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbevf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbevf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbevf/ixgbevf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbevf/ixgbevf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40evf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40evf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40evf/i40evf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/i40evf/i40evf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igb/igb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/igb/igb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000e
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000e
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000e/e1000e.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/e1000e/e1000e.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbe
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbe
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbe/ixgbe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgbe/ixgbe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgb/ixgb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/intel/ixgb/ixgb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/alteon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/alteon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/alteon/acenic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/alteon/acenic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/netronome
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/netronome
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/netronome/nfp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/netronome/nfp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/netronome/nfp/nfp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/netronome/nfp/nfp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amazon
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amazon
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amazon/ena
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amazon/ena
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amazon/ena/ena.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/amazon/ena/ena.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/adaptec
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/adaptec
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/adaptec/starfire.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/adaptec/starfire.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/agere
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/agere
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/agere/et131x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/agere/et131x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/marvell
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/marvell
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/marvell/skge.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/marvell/skge.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/marvell/sky2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/marvell/sky2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/emulex
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/emulex
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/emulex/benet
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/emulex/benet
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/emulex/benet/be2net.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ethernet/emulex/benet/be2net.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/net_failover.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/net_failover.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/nlmon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/nlmon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/mrf24j40.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/mrf24j40.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/atusb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/atusb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/mac802154_hwsim.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/mac802154_hwsim.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/fakelb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/fakelb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/cc2520.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/cc2520.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/at86rf230.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/at86rf230.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/adf7242.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ieee802154/adf7242.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/mdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/mdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi/defxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi/defxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi/skfp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi/skfp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi/skfp/skfp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/fddi/skfp/skfp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/uPD60620.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/uPD60620.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/teranetics.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/teranetics.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/marvell.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/marvell.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/bcm87xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/bcm87xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/microchip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/microchip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/davicom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/davicom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/mscc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/mscc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/amd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/amd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/rockchip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/rockchip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/realtek.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/realtek.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/marvell10g.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/marvell10g.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/cortina.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/cortina.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/icplus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/icplus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/micrel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/micrel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/vitesse.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/vitesse.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/ste10Xp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/ste10Xp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/broadcom.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/broadcom.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/smsc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/smsc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/fixed_phy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/fixed_phy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83tc811.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83tc811.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/libphy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/libphy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/lxt.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/lxt.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/bcm-phy-lib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/bcm-phy-lib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/at803x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/at803x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/microchip_t1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/microchip_t1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/national.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/national.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83848.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83848.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/et1011c.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/et1011c.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/aquantia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/aquantia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83867.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83867.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/cicada.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/cicada.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83822.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/dp83822.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/qsemi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/phy/qsemi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/mii.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/mii.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/thunderbolt-net.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/thunderbolt-net.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/macvtap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/macvtap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/netconsole.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/netconsole.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/tap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/tap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/rfc1051.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/rfc1051.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/arc-rimi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/arc-rimi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com90io.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com90io.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020-pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020-pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020-isa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com20020-isa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/arc-rawmode.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/arc-rawmode.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com90xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/com90xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/arcnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/arcnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/rfc1201.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/rfc1201.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/capmode.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/arcnet/capmode.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ifb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ifb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ipvlan
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ipvlan
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ipvlan/ipvtap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ipvlan/ipvtap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ipvlan/ipvlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ipvlan/ipvlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/pppox.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/pppox.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/pptp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/pptp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/bsd_comp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/bsd_comp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_mppe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_mppe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_deflate.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_deflate.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/pppoe.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/pppoe.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_synctty.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_synctty.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_async.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/ppp/ppp_async.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_ser_fdx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_ser_fdx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/scc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/scc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/hdlcdrv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/hdlcdrv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/bpqether.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/bpqether.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/mkiss.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/mkiss.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_epp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_epp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/6pack.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/6pack.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_ser_hdx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_ser_hdx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/yam.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/yam.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_par.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hamradio/baycom_par.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax/i2400m
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax/i2400m
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax/i2400m/i2400m-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax/i2400m/i2400m-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax/i2400m/i2400m.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wimax/i2400m/i2400m.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ce
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ce
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/rtl8192ce.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/rtl8192ce.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192c
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192c
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192c/rtl8192c-common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192c/rtl8192c-common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/btcoexist
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/btcoexist
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/btcoexist/btcoexist.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/btcoexist/btcoexist.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723ae
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723ae
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/rtl8723ae.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/rtl8723ae.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtlwifi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtlwifi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8188ee
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8188ee
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/rtl8188ee.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/rtl8188ee.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8821ae
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8821ae
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/rtl8821ae.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/rtl8821ae.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192se
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192se
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192se/rtl8192se.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192se/rtl8192se.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723be
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723be
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723be/rtl8723be.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723be/rtl8723be.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192cu
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192cu
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/rtl8192cu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/rtl8192cu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723com
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723com
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723com/rtl8723-common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8723com/rtl8723-common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ee
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ee
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/rtl8192ee.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/rtl8192ee.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192de
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192de
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192de/rtl8192de.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8192de/rtl8192de.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8187
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8187
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8187.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8187.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8180
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8180
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8180/rtl818x_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl818x/rtl8180/rtl818x_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl8xxxu
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl8xxxu
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x2e.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x2e.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x0
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x0
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x2u.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x2u.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x2-common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76x2-common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt76/mt76-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt7601u
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt7601u
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt7601u/mt7601u.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mediatek/mt7601u/mt7601u.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k/ath10k_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k/ath10k_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k/ath10k_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k/ath10k_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k/ath10k_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath10k/ath10k_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/wil6210
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/wil6210
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/wil6210/wil6210.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/wil6210/wil6210.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ar5523
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ar5523
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ar5523/ar5523.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ar5523/ar5523.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath5k
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath5k
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath5k/ath5k.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath5k/ath5k.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/carl9170
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/carl9170
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/carl9170/carl9170.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/carl9170/carl9170.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k_common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k_common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k_hw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k_hw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k_htc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath9k/ath9k_htc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_core.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_core.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_sdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_sdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rndis_wlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rndis_wlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/cisco
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/cisco
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/cisco/airo_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/cisco/airo_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/cisco/airo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/cisco/airo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/atmel_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/atmel_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/at76c50x-usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/at76c50x-usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/atmel_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/atmel_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/atmel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/atmel/atmel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmutil
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmutil
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmutil/brcmutil.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmutil/brcmutil.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmsmac
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmsmac
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmsmac/brcmsmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmsmac/brcmsmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43/b43.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43/b43.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43legacy
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43legacy
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43legacy/b43legacy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/broadcom/b43legacy/b43legacy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mac80211_hwsim.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/mac80211_hwsim.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ray_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ray_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas/zd1211rw
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas/zd1211rw
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas/zd1211rw/zd1211rw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas/zd1211rw/zd1211rw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas/zd1201.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/zydas/zd1201.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/wl3501_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/wl3501_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54/p54pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54/p54pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54/p54common.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54/p54common.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54/p54usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/p54/p54usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap_plx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap_plx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/hostap/hostap.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/spectrum_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/spectrum_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_tmd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_tmd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_plx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_plx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_nortel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intersil/orinoco/orinoco_nortel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2500pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2500pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00mmio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00mmio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt61pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt61pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2400pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2400pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00lib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00lib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt73usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt73usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2500usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2500usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800lib.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800lib.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2x00usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800mmio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/ralink/rt2x00/rt2800mmio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00/ipw2200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00/ipw2200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00/libipw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00/libipw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00/ipw2100.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/ipw2x00/ipw2100.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/dvm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/dvm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/dvm/iwldvm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/dvm/iwldvm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/mvm
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/mvm
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy/iwl4965.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy/iwl4965.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy/iwlegacy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy/iwlegacy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy/iwl3945.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/intel/iwlegacy/iwl3945.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rsi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rsi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rsi/rsi_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rsi/rsi_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rsi/rsi_91x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/rsi/rsi_91x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/admtek
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/admtek
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/admtek/adm8211.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/admtek/adm8211.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/libertas_sdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/libertas_sdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/libertas.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/libertas.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/usb8xxx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/usb8xxx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/libertas_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas/libertas_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas_tf
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas_tf
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas_tf/libertas_tf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas_tf/libertas_tf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas_tf/libertas_tf_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/libertas_tf/libertas_tf_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_sdio.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_sdio.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_pcie.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_pcie.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwl8k.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wireless/marvell/mwl8k.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/sb1000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/sb1000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_fr.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_fr.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/pci200syn.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/pci200syn.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/sdla.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/sdla.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/n2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/n2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/dlci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/dlci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_ppp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_ppp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_raw_eth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_raw_eth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/dscc4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/dscc4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/wanxl.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/wanxl.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/cosa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/cosa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/lmc
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/lmc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/lmc/lmc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/lmc/lmc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/sealevel.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/sealevel.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/z85230.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/z85230.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_raw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_raw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/c101.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/c101.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/farsync.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/farsync.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hostess_sv11.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hostess_sv11.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_cisco.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/wan/hdlc_cisco.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_loadbalance.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_loadbalance.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_roundrobin.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_roundrobin.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_activebackup.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_activebackup.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_broadcast.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_broadcast.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_random.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/team/team_mode_random.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/veth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/veth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/slcan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/slcan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/vxcan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/vxcan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/cc770
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/cc770
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/cc770/cc770_isa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/cc770/cc770_isa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/cc770/cc770.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/cc770/cc770.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/kvaser_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/kvaser_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/plx_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/plx_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/ems_pcmcia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/ems_pcmcia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/peak_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/peak_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/tscan1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/tscan1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/sja1000_isa.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/sja1000_isa.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/sja1000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/sja1000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/ems_pci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/ems_pci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/peak_pcmcia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/sja1000/peak_pcmcia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/vcan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/vcan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/pch_can.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/pch_can.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/peak_canfd
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/peak_canfd
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/peak_canfd/peak_pciefd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/peak_canfd/peak_pciefd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/mcba_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/mcba_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/esd_usb2.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/esd_usb2.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/kvaser_usb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/kvaser_usb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/kvaser_usb/kvaser_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/kvaser_usb/kvaser_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/gs_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/gs_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/peak_usb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/peak_usb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/peak_usb/peak_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/peak_usb/peak_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/ucan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/ucan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/usb_8dev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/usb_8dev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/ems_usb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/usb/ems_usb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/softing
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/softing
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/softing/softing_cs.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/softing/softing_cs.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/softing/softing.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/softing/softing.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/can-dev.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/can/can-dev.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vsockmon.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vsockmon.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/gtp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/gtp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vrf.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vrf.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/plip
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/plip
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/plip/plip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/plip/plip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/dummy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/dummy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/macvlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/macvlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/geneve.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/geneve.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hippi
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hippi
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hippi/rrunner.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hippi/rrunner.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/macsec.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/macsec.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hyperv
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hyperv
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hyperv/hv_netvsc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/hyperv/hv_netvsc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/slip
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/slip
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/slip/slhc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/slip/slhc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/slip/slip.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/slip/slip.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vxlan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vxlan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vmxnet3
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vmxnet3
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vmxnet3/vmxnet3.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/vmxnet3/vmxnet3.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/eql.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/eql.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/tun.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/tun.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/dm9601.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/dm9601.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/hso.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/hso.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_mbim.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_mbim.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/huawei_cdc_ncm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/huawei_cdc_ncm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/pegasus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/pegasus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/kaweth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/kaweth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_ncm.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_ncm.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/lan78xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/lan78xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/sr9700.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/sr9700.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/usbnet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/usbnet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/sr9800.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/sr9800.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/smsc95xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/smsc95xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_ether.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_ether.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/kalmia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/kalmia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/rtl8150.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/rtl8150.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/sierra_net.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/sierra_net.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/lg-vl600.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/lg-vl600.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/mcs7830.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/mcs7830.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/gl620a.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/gl620a.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/r8152.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/r8152.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/rndis_host.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/rndis_host.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc-phonet.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc-phonet.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/net1080.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/net1080.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/asix.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/asix.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/ipheth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/ipheth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_subset.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_subset.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/int51x1.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/int51x1.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/plusb.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/plusb.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cx82310_eth.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cx82310_eth.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/catc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/catc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/ax88179_178a.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/ax88179_178a.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/qmi_wwan.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/qmi_wwan.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/smsc75xx.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/smsc75xx.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_eem.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/cdc_eem.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/ch9200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/ch9200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/zaurus.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/usb/zaurus.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/sungem_phy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/sungem_phy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/bonding
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/bonding
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/bonding/bonding.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/bonding/bonding.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/appletalk
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/appletalk
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/appletalk/ltpc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/appletalk/ltpc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/appletalk/ipddp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/appletalk/ipddp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/virtio_net.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/net/virtio_net.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata
chmod 755 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_hpt366.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_hpt366.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sc1200.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sc1200.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_pdc202xx_old.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_pdc202xx_old.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_it8213.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_it8213.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_it821x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_it821x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_qstor.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_qstor.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cmd64x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cmd64x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_jmicron.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_jmicron.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sch.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sch.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/libahci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/libahci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_rz1000.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_rz1000.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ali.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ali.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_promise.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_promise.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_uli.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_uli.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_netcell.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_netcell.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ninja32.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ninja32.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_via.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_via.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_svw.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_svw.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_via.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_via.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ns87415.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ns87415.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_pcmcia.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_pcmcia.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5536.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5536.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/libata.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/libata.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ns87410.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_ns87410.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/acard-ahci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/acard-ahci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sis.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sis.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_hpt37x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_hpt37x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_legacy.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_legacy.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_mv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_mv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5535.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5535.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_amd.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_amd.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sil.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sil.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_opti.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_opti.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5530.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5530.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_oldpiix.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_oldpiix.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_nv.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_nv.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/ata_piix.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/ata_piix.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_marvell.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_marvell.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_artop.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_artop.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5520.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_cs5520.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_atiixp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_atiixp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/ata_generic.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/ata_generic.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_mpiix.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_mpiix.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_vsc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_vsc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_isapnp.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_isapnp.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/ahci.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/ahci.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_atp867x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_atp867x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sis.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sis.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sx4.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sx4.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_rdc.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_rdc.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sil24.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/sata_sil24.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sil680.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_sil680.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_triflex.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_triflex.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_piccolo.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_piccolo.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_serverworks.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_serverworks.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_efar.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_efar.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_pdc2027x.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pata_pdc2027x.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pdc_adma.ko
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/kernel/drivers/ata/pdc_adma.ko
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.dep.bin
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.dep.bin
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.builtin.bin
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.builtin.bin
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.alias
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.alias
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.softdep
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.softdep
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.alias.bin
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.alias.bin
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.order
chmod 644 ./.source/modules.img-4.19.0-3-686/lib/modules/4.19.0-3-686/modules.order
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/boot
chmod 755 ./.source/modules.img-4.19.0-3-686/boot
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/boot/System.map-4.19.0-3-686
chmod 640 ./.source/modules.img-4.19.0-3-686/boot/System.map-4.19.0-3-686
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/boot/config-4.19.0-3-686
chmod 640 ./.source/modules.img-4.19.0-3-686/boot/config-4.19.0-3-686
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/usr
chmod 755 ./.source/modules.img-4.19.0-3-686/usr
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/usr/share
chmod 755 ./.source/modules.img-4.19.0-3-686/usr/share
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/usr/share/doc
chmod 755 ./.source/modules.img-4.19.0-3-686/usr/share/doc
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/usr/share/doc/backupos
chmod 755 ./.source/modules.img-4.19.0-3-686/usr/share/doc/backupos
${do_chown} && chown root:root ./.source/modules.img-4.19.0-3-686/usr/share/doc/backupos/kernel.txt
chmod 644 ./.source/modules.img-4.19.0-3-686/usr/share/doc/backupos/kernel.txt
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
${do_chown} && chown root:root ./.source/rootfs/usr/lib/backupos-init/init/S_console_splash.rc
chmod 644 ./.source/rootfs/usr/lib/backupos-init/init/S_console_splash.rc
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
ln -s ../../lib/init/init/S_console_splash.rc ./.source/rootfs/etc/init/S000_console_splash.rc
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
gzip -9 ./.source/modules.img-4.19.0-3-686/boot/System.map-4.19.0-3-686
gzip -9 ./.source/modules.img-4.19.0-3-686/boot/config-4.19.0-3-686
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
mv ./boot/backupos/modules.img-4.19.0-3-686.img ./boot/backupos/modules.img-4.19.0-3-686
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
