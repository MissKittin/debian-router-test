#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e /usr/local/etc/apt/apt.conf.d/99-autoremove-suggests ] || [ ! -e /usr/local/etc/apt/apt.conf.d/99-no-apt-translations ] || [ ! -e /usr/local/etc/apt/apt.conf.d/99-no-install-recommends ] || [ ! -e /etc/apt/apt.conf.d/99-autoremove-suggests ] || [ ! -e /etc/apt/apt.conf.d/99-no-apt-translations ] || [ ! -e /etc/apt/apt.conf.d/99-no-install-recommends ]; then
	echo 'Not installed'
	exit 1
fi

for i in 99-autoremove-suggests 99-no-apt-translations 99-no-install-recommends; do
	echo -n "[rm] /usr/local/etc/apt/apt.conf.d/${i}"
		rm /usr/local/etc/apt/apt.conf.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

for i in 99-autoremove-suggests 99-no-apt-translations 99-no-install-recommends; do
	echo -n "[rm] /etc/apt/apt.conf.d/${i}"
		rm /etc/apt/apt.conf.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
