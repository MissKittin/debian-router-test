#!/bin/sh
# notify-daemon package
# install script

# Dependencies: rc.local
# Conflicts: notify-daemon-v2

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='notify-daemon'
PACKAGE_CONFLICT='notify-daemon-v2'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check for conflicts
for conflict in ${PACKAGE_CONFLICT}; do
	if [ -e "${PACKAGE_DIR}/../${conflict}" ]; then
		if [ -x "${PACKAGE_DIR}/../${conflict}/status.sh" ]; then
			${PACKAGE_DIR}/../${conflict}/status.sh > /dev/null 2>&1
			if [ ! "${?}" = '1' ]; then
				echo 'Conflict checking error:'
				echo "${conflict} is installed or broken."
				echo "${conflict} status:"
				${PACKAGE_DIR}/../${conflict}/status.sh
				exit 1
			fi	
		else
			echo 'Conflict checking error:'
			echo "${conflict} package exists,"
			echo "but status.sh for ${conflict} is broken or not executable."
			echo 'Check this.'
			exit 1
		fi
	fi
done

# Check installed packages
if [ ! -e /usr/local/etc/rc.local.d ]; then
	echo 'rc.local package not installed'
	exit 1
fi

# Check if installed
if [ -e /usr/local/etc/notify-daemon ] || [ -e /usr/local/share/notify-daemon ] || [ -e /usr/local/sbin/notify-daemon-state.sh ] || [ -e /usr/local/sbin/notify-daemon.sh ]; then
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

# Install - rc.local package
cd /usr/local/etc/rc.local.d
echo -n '[ln] etc/rc.local.d/notify-daemon.rc rc.local'
	ln -s ${PACKAGE_DIR}/etc/rc.local.d/PKx_notify-daemon.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/notify-daemon /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/notify-daemon . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/sbin
cd /usr/local/sbin
for i in notify-daemon-state.sh notify-daemon.sh; do
	echo -n '[ln] sbin/'"${i}"' /usr/local/sbin'
		ln -s ${PACKAGE_DIR}/sbin/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/notify-daemon /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/notify-daemon . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ''
echo ' ! Configure /usr/local/etc/rc.local.d'

echo ''
exit 0
