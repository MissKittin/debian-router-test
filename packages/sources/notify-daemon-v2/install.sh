#!/bin/sh
# notify-daemon-v2 package
# install script

# Conflicts: notify-daemon

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "${0}")")"
PACKAGE_NAME='notify-daemon-v2'
PACKAGE_CONFLICT='notify-daemon'

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

# Check environment
if [ ! -e '/usr/local/etc/init.d' ]; then
	echo '/usr/local/etc/init.d not exists'
	echo 'Create this dir manually'
	exit 1
fi

# Check if installed
if [ -e '/usr/local/bin/notify-daemon.sh' ] || [ -e '/usr/local/etc/notify-daemon' ] || [ -e '/usr/local/etc/init.d/notify-daemon.sh' ] || [ -e '/usr/local/share/notify-daemon' ] || [ -e '/etc/init.d/notify-daemon.sh' ]; then
	echo 'Already installed'
	exit 1
fi

# Splash # Question
if [ ! "${1}" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME}"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/bin
cd /usr/local/bin
echo -n '[ln] bin/notify-daemon.sh /usr/local/bin'
	ln -s ${PACKAGE_DIR}/bin/notify-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc
cd /usr/local/etc
echo -n '[ln] etc/notify-daemon /usr/local/etc'
	ln -s ${PACKAGE_DIR}/etc/notify-daemon . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/etc/init.d
cd /usr/local/etc/init.d
echo -n '[ln] etc/init.d/notify-daemon.sh /usr/local/etc/init.d'
	ln -s ${PACKAGE_DIR}/etc/init.d/notify-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /usr/local/share
cd /usr/local/share
echo -n '[ln] share/notify-daemon /usr/local/share'
	ln -s ${PACKAGE_DIR}/share/notify-daemon . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Install - /etc/init.d
cd /etc/init.d
echo -n '[ln] /usr/local/etc/init.d/notify-daemon.sh /etc/init.d'
	ln -s /usr/local/etc/init.d/notify-daemon.sh . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

# Notification
echo ' ! Insserv /etc/init.d/notify-daemon.sh'

echo ''
exit 0