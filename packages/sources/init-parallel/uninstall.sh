#!/bin/sh
# init-parallel package
# uninstall script

# Settings
PACKAGE_NAME='init-parallel' # /usr/local/share/${PACKAGE_DIR}/${PACKAGE_NAME}

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

# Check if installed
if [ ! -e /usr/local/etc/init-parallel ] || [ ! -e /usr/local/etc/init.d/ainit-parallel ] || [ ! -e /usr/local/etc/init.d/ainit-parallel-single ] || [ ! -e /usr/local/etc/init.d/init-parallel-shutdown ] || [ ! -e /etc/init.d/ainit-parallel ] || [ ! -e /etc/init.d/ainit-parallel-single ] || [ ! -e /etc/init.d/init-parallel-shutdown ] || [ ! -e /usr/local/sbin/init-parallel ] || [ ! -e /usr/local/sbin/init-parallel-shutdown ]; then
	echo 'Not installed'
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

# Uninstall - rcdown.local package
#echo -n '[rm] /usr/local/etc/rcdown.local.d/init-parallel-queue.rc'
#	rm /usr/local/etc/rc.local.d/*_init-parallel-queue.rc > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc
echo -n '[rm] /usr/local/etc/init-parallel'
	rm /usr/local/etc/init-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/etc/init.d
for i in ainit-parallel ainit-parallel-single init-parallel-shutdown; do
	echo -n "[rm] /usr/local/etc/init.d/${i}"
		rm /usr/local/etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninstall - /usr/local/sbin
echo -n '[rm] /usr/local/sbin/init-parallel'
	rm /usr/local/sbin/init-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[rm] /usr/local/sbin/init-parallel-shutdown'
	rm /usr/local/sbin/init-parallel-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /usr/local/share
echo -n '[rm] /usr/local/share/init-parallel'
	rm /usr/local/share/init-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninstall - /etc/init.d
for i in ainit-parallel ainit-parallel-single init-parallel-shutdown; do
	echo -n "[rm] /etc/init.d/${i}"
		rm /etc/init.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Uninsserv - /etc/rc2.d
echo -n '[rm] /etc/rc2.d/ainit-parallel'
	rm /etc/rc2.d/*ainit-parallel > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rcS.d
echo -n '[rm] /etc/rcS.d/ainit-parallel-single'
	rm /etc/rcS.d/*ainit-parallel-single > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rc0.d
echo -n '[rm] /etc/rc0.d/init-parallel-shutdown'
	rm /etc/rc0.d/*init-parallel-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Uninsserv - /etc/rc6.d
echo -n '[rm] /etc/rc6.d/init-parallel-shutdown'
	rm /etc/rc6.d/*init-parallel-shutdown > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Enable all init script which were handled by init-parallel'

echo ''
exit 0
