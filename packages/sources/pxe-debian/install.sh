#!/bin/sh
# pxe-debian package
# install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='pxe-debian'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ -e /etc/inittab.old ]; then
	echo 'Backup files found'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo 'Do not install package manually'
	echo 'Install it via pxe-debian-toolbox.sh'
	exit 1
fi
echo ''

# Generate package ID
[ -e "${PACKAGE_DIR}/etc/pxe-debian.id" ] || tr -cd '[:alnum:]' < /dev/urandom | fold -w80 | head -n1 > ${PACKAGE_DIR}/etc/pxe-debian.id

# Install - /usr/local/etc
cd /usr/local/etc
for i in inittab pxe-debian.id; do
	echo -n "[ln] etc/${i} /usr/local/etc"
		ln -s ${PACKAGE_DIR}/etc/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/etc/apt/apt.conf.d
[ -e /usr/local/etc/apt/apt.conf.d ] || mkdir -p /usr/local/etc/apt/apt.conf.d
cd /usr/local/etc/apt/apt.conf.d
for i in 99-autoremove-suggests 99-no-apt-translations 99-no-install-recommends; do
	echo -n "[ln] etc/apt/apt.conf.d/${i} /usr/local/etc/apt/apt.conf.d"
		ln -s ${PACKAGE_DIR}/etc/apt/apt.conf.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/etc/dpkg/dpkg.cfg.d
[ -e /usr/local/etc/dpkg/dpkg.cfg.d ] || mkdir -p /usr/local/etc/dpkg/dpkg.cfg.d
cd /usr/local/etc/dpkg/dpkg.cfg.d
for i in 01_nocompletions 01_nodoc 01_noincludes 01_nolocale 01_nopixmaps; do
	echo -n "[ln] etc/dpkg/dpkg.cfg.d/${i} /usr/local/etc/dpkg/dpkg.cfg.d"
		ln -s ${PACKAGE_DIR}/etc/dpkg/dpkg.cfg.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/sbin
cd /usr/local/sbin
for i in make-kernel-image; do
	echo -n "[ln] sbin/${i} /usr/local/sbin"
		ln -s ${PACKAGE_DIR}/sbin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/share
cd /usr/local/share
for i in pxe-debian; do
	echo -n "[ln] share/${i} /usr/local/share"
		ln -s ${PACKAGE_DIR}/share/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/etc/init.d
[ -e /usr/local/etc/init.d ] || mkdir /usr/local/etc/init.d
cd /usr/local/etc/init.d
for i in .legacy-bootordering pxe-debian.sh; do
	echo -n "[ln] etc/init.d/${i} /usr/local/etc/init.d"
		ln -s ${PACKAGE_DIR}/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc
cd /etc
echo -n '[mv] /etc/inittab /etc/inittab.old'
	mv ./inittab ./inittab.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/inittab /etc'
	ln -s /usr/local/etc/inittab . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/apt/apt.conf.d
cd /etc/apt/apt.conf.d
for i in 99-autoremove-suggests 99-no-apt-translations 99-no-install-recommends; do
	echo -n "[ln] /usr/local/etc/apt/apt.conf.d/${i} /etc/apt/apt.conf.d"
		ln -s /usr/local/etc/apt/apt.conf.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc/dpkg/dpkg.cfg.d
cd /etc/dpkg/dpkg.cfg.d
for i in 01_nocompletions 01_nodoc 01_noincludes 01_nolocale 01_nopixmaps; do
	echo -n "[ln] /usr/local/etc/dpkg/dpkg.cfg.d/${i} /etc/dpkg/dpkg.cfg.d"
		ln -s /usr/local/etc/dpkg/dpkg.cfg.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /etc/init.d
cd /etc/init.d
for i in .legacy-bootordering pxe-debian.sh; do
	echo -n "[ln] /usr/local/etc/init.d/${i} /etc/init.d"
		ln -s /usr/local/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Inject - /etc/rcS.d
cd /etc/rcS.d
echo -n '[ln] /etc/init.d/pxe-debian.sh /etc/rcS.d/S00pxe-debian.sh'
	ln -s ../init.d/pxe-debian.sh S00pxe-debian.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
