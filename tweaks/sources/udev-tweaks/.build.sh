#!/bin/sh
do_chown='false'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
	exit 1
fi

echo 'Building...'
cd "$(dirname "$(readlink -f "${0}")")"

${do_chown} && chown root:root .
chmod 755 .
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/udev
chmod 755 ./etc/udev
${do_chown} && chown root:root ./etc/udev/rules.d
chmod 755 ./etc/udev/rules.d
${do_chown} && chown root:root ./etc/udev/rules.d/pci_pm.rules
chmod 644 ./etc/udev/rules.d/pci_pm.rules
${do_chown} && chown root:root ./etc/udev/rules.d/hd_power_save.rules
chmod 644 ./etc/udev/rules.d/hd_power_save.rules
${do_chown} && chown root:root ./remove.sh
chmod 755 ./remove.sh
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./apply.sh
chmod 755 ./apply.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
