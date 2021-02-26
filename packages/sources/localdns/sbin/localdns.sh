#!/bin/sh
# Generate static hosts file for dnsmasq

# Where I am?
ETCDIR='/usr/local/etc/localdns.d'
HOSTSFILE='/var/run/.localdns.hosts'

# Print hostsfile
if [ "${1}" = 'print-hostsfile-location' ]; then
	echo -n "${HOSTSFILE}"
	exit 0
fi

# Clear file
echo -n '' > "${HOSTSFILE}"

# Put all hosts files
for i in ${ETCDIR}/*; do
	cat "${i}" >> "${HOSTSFILE}"
done

# Flush dnsmasq's cache
[ -e '/var/run/dnsmasq/dnsmasq.pid' ] && kill -1 "$(cat '/var/run/dnsmasq/dnsmasq.pid')"

exit 0
