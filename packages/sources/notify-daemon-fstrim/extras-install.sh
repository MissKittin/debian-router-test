#!/bin/sh
# notify-daemon-fstrim package
# extras install script

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"
PACKAGE_NAME='notify-daemon-fstrim'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if package is installed
if ! $(dirname "${0}")/status.sh > /dev/null 2>&1; then
	echo 'Install package first'
	exit 1
fi

# Splash # Question
if [ ! "$1" = '--force' ]; then
	echo ''
	echo " ${PACKAGE_NAME} - extras"
	echo ''

	echo -n 'Are you sure? (y/[n]) '
	read answer
	[ "${answer}" = 'y' ] || exit 0
fi
echo ''

# Install - /usr/local/etc/acpid-autosuspend/checklist.d
if cd /usr/local/etc/acpid-autosuspend/checklist.d > /dev/null 2>&1; then
	echo -n '[ln] extras/etc/acpid-autosuspend/checklist.d/fstrim.rc /usr/local/etc/acpid-autosuspend/checklist.d'
		if [ -e '/usr/local/etc/acpid-autosuspend/checklist.d/S99fstrim.rc' ]; then
			echo ' [EXISTS]'
		else
			ln -s ${PACKAGE_DIR}/extras/etc/acpid-autosuspend/checklist.d/S99fstrim.rc . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
		fi
else
	echo 'acpid-mods is not installed'
fi

echo ''
exit 0
