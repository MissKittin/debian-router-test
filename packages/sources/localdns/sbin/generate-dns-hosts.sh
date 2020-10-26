#!/bin/sh
# hosts generator for dnsmasq

# Where I am?
ETCDIR='/usr/local/etc'
HOSTSFILE='/var/tmp/.dns-hosts'

# Print hostsfile
if [ "${1}" = 'print-hostsfile-location' ]; then
	echo -n "${HOSTSFILE}"
	exit 0
fi

# Clear file
echo -n '' > $HOSTSFILE

# Put all hosts files
for i in $ETCDIR/hosts.d/*; do
	cat $i >> $HOSTSFILE
done

# Run from dnsmasq-hosts-build (not needed anymore)
# [ "$1" = 'dnsmasq-hosts-build' ] && exit 0

# Flush dnsmasq's cache (not needed - dnsmasq will read file automatically)
#echo
#[ "$1" = 'start' ] && /etc/init.d/dnsmasq start || /etc/init.d/dnsmasq restart
#echo
#killall -s SIGHUP dnsmasq

exit 0