#!/bin/sh
# isc-dhcp-server config
# build script
do_chown='false'

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have the required power"
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
echo 'Building...'
cd "$(dirname "$(readlink -f "${0}")")"

${do_chown} && chown root:root .
chmod 755 .
${do_chown} && chown root:root ./README.md
chmod 644 ./README.md
${do_chown} && chown root:root ./config-install.sh
chmod 755 ./config-install.sh
${do_chown} && chown root:root ./etc
chmod 755 ./etc
${do_chown} && chown root:root ./etc/default
chmod 755 ./etc/default
${do_chown} && chown root:root ./etc/default/isc-dhcp-server
chmod 644 ./etc/default/isc-dhcp-server
${do_chown} && chown root:root ./etc/dhcp
chmod 755 ./etc/dhcp
${do_chown} && chown root:root ./etc/dhcp/subnet-lan.conf
chmod 644 ./etc/dhcp/subnet-lan.conf
${do_chown} && chown root:root ./etc/dhcp/reservations.conf
chmod 644 ./etc/dhcp/reservations.conf
${do_chown} && chown root:root ./etc/dhcp/events.conf
chmod 644 ./etc/dhcp/events.conf
${do_chown} && chown root:root ./etc/dhcp/dhcpd.conf
chmod 644 ./etc/dhcp/dhcpd.conf
${do_chown} && chown root:root ./config-status.sh
chmod 755 ./config-status.sh
${do_chown} && chown root:root ./.build.sh
chmod 644 ./.build.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./config-uninstall.sh
chmod 755 ./config-uninstall.sh
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
echo ''
exit 0
