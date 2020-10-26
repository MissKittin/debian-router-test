#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /etc/ssh/sshd_config ]; then
	echo 'openssh-server not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/ssh ]; then
	echo 'Create /usr/local/etc/ssh'
	exit 1
fi

# Check backup
#if [ -e /etc/ssh/sshd_config.old ]; then
#	echo 'Backup file found'
#	exit 1
#fi

# Check if is installed
if [ -e /usr/local/etc/ssh/sshd_config ] || [ -e /etc/ssh/sshd_config ] || [ -e /etc/ssh/sshd_config.old ]; then
	echo 'Already installed'
	exit 1
fi

cd /usr/local/etc/ssh
echo -n '[ln] etc/ssh/sshd_config /usr/local/etc/ssh'
	ln -s ${PACKAGE_DIR}/etc/ssh/sshd_config . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

cd /etc/ssh
echo -n '[mv] /etc/ssh/sshd_config sshd_config.old'
	mv sshd_config sshd_config.old > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
echo -n '[ln] /usr/local/etc/ssh/sshd_config /etc/ssh'
	ln -s /usr/local/etc/ssh/sshd_config . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'

exit 0
