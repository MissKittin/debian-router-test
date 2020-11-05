#!/bin/sh
# pxe-debian package
# uninstall script

# Settings
PACKAGE_NAME='pxe-debian'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if extras are installed
if [ -e "$(dirname "${0}")/extras-status.sh" ]; then
	$(dirname "${0}")/extras-status.sh > /dev/null 2>&1; EXTRAS_STATUS="${?}"
	if [ "${EXTRAS_STATUS}" = 0 ] || [ "${EXTRAS_STATUS}" = 2 ]; then
		echo 'Uninstall extras first'
		exit 1
	fi 
fi

# Check environment
if [ ! -e /etc/inittab.old ]; then
	echo 'Backup files not found'
	exit 1

fi

# Splash
echo ''
echo " ${PACKAGE_NAME}"
echo ''

# Question
echo -n 'Are you sure? (y/[n]) '
read answer
[ "${answer}" = 'y' ] || exit 0
echo ''

# Uninstall - /usr/local/etc
for i in inittab pxe-debian.id; do
	echo -n "[rm] /usr/local/etc/${i}"
		rm /usr/local/etc/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/etc/apt/apt.conf.d
for i in 99-autoremove-suggests 99-no-apt-translations 99-no-install-recommends; do
	echo -n "[rm] /usr/local/etc/apt/apt.conf.d/${i}"
		rm /usr/local/etc/apt/apt.conf.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done
echo -n '[rmdir] /usr/local/etc/apt/apt.conf.d'
	rmdir /usr/local/etc/apt/apt.conf.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rmdir] /usr/local/etc/apt'
	rmdir /usr/local/etc/apt > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/dpkg/dpkg.cfg.d
for i in 01_nocompletions 01_nodoc 01_noincludes 01_nolocale 01_nopixmaps; do
	echo -n "[rm] /usr/local/etc/dpkg/dpkg.cfg.d/${i}"
		m /usr/local/etc/dpkg/dpkg.cfg.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done
echo -n '[rmdir] /usr/local/etc/dpkg/dpkg.cfg.d'
	rmdir /usr/local/etc/dpkg/dpkg.cfg.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rmdir] /usr/local/etc/dpkg'
	rmdir /usr/local/etc/dpkg > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/sbin
for i in make-kernel-image; do
	echo -n "[rm] /usr/local/sbin/${i}"
		rm /usr/local/sbin/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/share
for i in pxe-debian; do
	echo -n "[rm] /usr/local/share/${i}"
		rm /usr/local/share/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/etc/init.d
for i in .legacy-bootordering pxe-debian.sh; do
	echo -n "[rm] /usr/local/etc/init.d/${i}"
		rm /usr/local/etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done
echo -n '[rmdir] /usr/local/etc/init.d'
	rmdir /usr/local/etc/init.d > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc
echo -n '[rm] /etc/inittab'
	rm /etc/inittab > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[mv] /etc/inittab.old /etc/inittab'
	mv /etc/inittab.old /etc/inittab > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'


# Uninstall - /etc/apt/apt.conf.d
for i in 99-autoremove-suggests 99-no-apt-translations 99-no-install-recommends; do
	echo -n "[rm] /etc/apt/apt.conf.d/${i}"
		rm /etc/apt/apt.conf.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/dpkg/dpkg.cfg.d
for i in 01_nocompletions 01_nodoc 01_noincludes 01_nolocale 01_nopixmaps; do
	echo -n "[rm] /etc/dpkg/dpkg.cfg.d/${i}"
		rm /etc/dpkg/dpkg.cfg.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /etc/init.d
for i in .legacy-bootordering pxe-debian.sh; do
	echo -n "[rm] /etc/init.d/${i}"
		rm /etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Remove - /etc/rcS.d
echo -n '[rm] /etc/rcS.d/S00pxe-debian.sh'
	rm /etc/rcS.d/S00pxe-debian.sh > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

echo ''
exit 0
