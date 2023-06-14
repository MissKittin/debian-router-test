#!/bin/sh
# init-parallel package
# install script

# Debian dependencies: sysvinit-core

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='init-parallel'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /usr/local/etc/init.d ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi
if [ ! -e /etc/init.d/.legacy-bootordering ]; then
	echo '/etc/init.d/.legacy-bootordering not exists'
	echo 'Legacy bootordering is required'
	exit 1
fi

# Check installed packages
if [ ! -e /usr/share/sysvinit ]; then
	echo 'sysvinit-core debian package not installed'
	exit 1
fi
#if [ ! -e /usr/local/etc/rcdown.local.d ]; then
#	echo 'rcdown.local package not installed'
#	exit 1
#fi

# Check if installed
if [ -e /usr/local/etc/init-parallel ] || [ -e /usr/local/etc/init.d/ainit-parallel ] || [ -e /usr/local/etc/init.d/ainit-parallel-single ] || [ -e /usr/local/etc/init.d/init-parallel-shutdown ] || [ -e /etc/init.d/ainit-parallel ] || [ -e /etc/init.d/ainit-parallel-single ] || [ -e /etc/init.d/init-parallel-shutdown ] || [ -e /usr/local/sbin/init-parallel ] || [ -e /usr/local/sbin/init-parallel-shutdown ]; then
	echo 'Already installed'
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

# Install - rcdown.local package
#cd /usr/local/etc/rcdown.local.d
#echo -n '[ln] etc/rcdown.local.d/init-parallel-queue.rc rc.local'
#	ln -s ${PACKAGE_DIR}/etc/rc.local.d/Sx_init-parallel-queue.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/init-parallel /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/init-parallel . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
for i in ainit-parallel ainit-parallel-single init-parallel-shutdown; do
	echo -n "[ln] etc/init.d/${i} /usr/local/etc/init.d"
		ln -s ${PACKAGE_DIR}/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/sbin
cd /usr/local/sbin
echo -n '[ln] sbin/init-parallel /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/init-parallel . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] sbin/init-parallel-shutdown /usr/local/sbin'
	ln -s ${PACKAGE_DIR}/sbin/init-parallel-shutdown . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/init-parallel /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/init-parallel . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
for i in ainit-parallel ainit-parallel-single init-parallel-shutdown; do
	echo -n "[ln] /usr/local/etc/init.d/${i} /etc/init.d"
		ln -s /usr/local/etc/init.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Insserv - /etc/rc2.d, /etc/rcS.d
#for i in rc2.d rcS.d; do
#	cd /etc/$i
#	echo -n '[ln] /etc/init.d/ainit-parallel /etc/'"$i"
#		ln -s ../init.d/ainit-parallel ./S01ainit-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
#done
cd /etc/rcS.d
echo -n '[ln] /etc/init.d/ainit-parallel-single /etc/rcS.d'
	ln -s ../init.d/ainit-parallel-single ./S01ainit-parallel-single > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
cd /etc/rc2.d
echo -n '[ln] /etc/init.d/ainit-parallel /etc/rc2.d'
	ln -s ../init.d/ainit-parallel ./S01ainit-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
cd /etc/rc0.d
echo -n '[ln] /etc/init.d/init-parallel-shutdown /etc/rc0.d'
	ln -s ../init.d/init-parallel-shutdown ./K01init-parallel-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
cd /etc/rc6.d
echo -n '[ln] /etc/init.d/init-parallel-shutdown /etc/rc6.d'
	ln -s ../init.d/init-parallel-shutdown ./K01init-parallel-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

/etc/init.d/ainit-parallel check # rcS.d is partially configured after loop

echo ''
exit 0
