#!/bin/sh

# Settings
PACKAGE_DIR="$(dirname "$(readlink -f "$0")")"

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

# Check if is installed
if [ ! -e /usr/local/etc/udev/rules.d/hd_power_save.rules ] || [ ! -e /usr/local/etc/udev/rules.d/pci_pm.rules ] || [ ! -e /etc/udev/rules.d/hd_power_save.rules ] || [ ! -e /etc/udev/rules.d/pci_pm.rules ]; then
	echo 'Already installed'
	exit 1
fi

for i in hd_power_save.rules pci_pm.rules; do
	echo -n "[rm] /usr/local/etc/udev/rules.d/${i}"
		rm /usr/local/etc/udev/rules.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

for i in hd_power_save.rules pci_pm.rules; do
	echo -n "[rm] /etc/udev/rules.d/${i}"
		rm /etc/udev/rules.d/${i} > /dev/null 2>&1 && echo ' [OK]' || echo ' [Fail]'
done

exit 0
