#!/bin/sh
# isc-dhcp-ddns package
# build script
do_chown='false'

PACKAGE_NAME='isc-dhcp-ddns'

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
${do_chown} && chown root:root ./sbin
chmod 751 ./sbin
${do_chown} && chown root:root ./sbin/isc-dhcp-ddns4.sh
chmod 750 ./sbin/isc-dhcp-ddns4.sh
${do_chown} && chown root:root ./sbin/isc-dhcp-ddns6.sh
chmod 750 ./sbin/isc-dhcp-ddns6.sh
${do_chown} && chown root:root ./extras-status.sh
chmod 755 ./extras-status.sh
${do_chown} && chown root:root ./extras
chmod 755 ./extras
${do_chown} && chown root:root ./extras/etc
chmod 755 ./extras/etc
${do_chown} && chown root:root ./extras/etc/dnsmasq.d
chmod 755 ./extras/etc/dnsmasq.d
${do_chown} && chown root:root ./extras/etc/dnsmasq.d/ddns4.conf
chmod 644 ./extras/etc/dnsmasq.d/ddns4.conf
${do_chown} && chown root:root ./extras/etc/dnsmasq.d/ddns6.conf
chmod 644 ./extras/etc/dnsmasq.d/ddns6.conf
${do_chown} && chown root:root ./status.sh
chmod 755 ./status.sh
${do_chown} && chown root:root ./extras-uninstall.sh
chmod 755 ./extras-uninstall.sh
${do_chown} && chown root:root ./CHANGELOG.txt
chmod 644 ./CHANGELOG.txt
${do_chown} && chown root:root ./install.sh
chmod 755 ./install.sh
${do_chown} && chown root:root ./uninstall.sh
chmod 755 ./uninstall.sh
${do_chown} && chown root:root ./extras-install.sh
chmod 755 ./extras-install.sh
${do_chown} && chown root:root ./dhcpd.conf.sample
chmod 644 ./dhcpd.conf.sample
${do_chown} && chown root:root ./VERSION.txt
chmod 644 ./VERSION.txt

chmod 644 ./.build.sh
exit 0
