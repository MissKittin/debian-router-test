#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check environment
if [ ! -e /etc/udev/rules.d ]; then
	echo 'udev not installed'
	exit 1
fi
if [ ! -e /usr/local/etc/udev/rules.d ]; then
	echo 'Create /usr/local/etc/udev/rules.d'
	exit 1
fi

# Check if is installed
if [ -e /usr/local/etc/udev/rules.d/hd_power_save.rules ] || [ -e /usr/local/etc/udev/rules.d/pci_pm.rules ] || [ -e /etc/udev/rules.d/hd_power_save.rules ] || [ -e /etc/udev/rules.d/pci_pm.rules ]; then
	echo 'Already installed'
	exit 1
fi

cd /usr/local/etc/udev/rules.d
for i in hd_power_save.rules pci_pm.rules; do
	echo -n "[ln] etc/udev/rules.d/${i} /usr/local/etc/udev/rules.d"
		ln -s ${PACKAGE_DIR}/etc/udev/rules.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

cd /etc/udev/rules.d
for i in hd_power_save.rules pci_pm.rules; do
	echo -n "[ln] /usr/local/etc/udev/rules.d/${i} /etc/udev/rules.d"
		ln -s /usr/local/etc/udev/rules.d/${i} . > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
