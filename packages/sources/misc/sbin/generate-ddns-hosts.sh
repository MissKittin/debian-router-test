#!/bin/sh
# DDNS by hosts for isc-dhcp-server -> dnsmasq
# 05.02.2019
# Script improvements 19.08.2020

# Static settings
ddns_hosts_file='/tmp/.ddns-hosts'
lan_domain='.local'

# Get localdns hosts file
[ -e '/usr/local/sbin/generate-dns-hosts.sh' ] && localdns_hosts_file="$(/usr/local/sbin/generate-dns-hosts.sh print-hostsfile-location)"

for arg in $(echo -n "${@}" | sed 's/= /=/g'); do # isc-dhcp-server may pass 'arg= value' instead of 'arg=value'
	case $arg in
		action=*)
			action=${arg#action=}
		;;
		ip=*)
			ip=${arg#ip=}
		;;
		mac=*)
			mac=${arg#mac=}
		;;
		hostname=*)
			hostname=${arg#hostname=}
		;;
		ddns_hosts_file=*)
			ddns_hosts_file=${arg#ddns_hosts_file=}
		;;
		lan_domain=*)
			lan_domain=${arg#lan_domain=}
		;;
	esac
done

log()
{
	echo "${1}"
	logger --priority daemon.debug --tag generate-ddns-hosts ${1}
}
abort_push()
{
	log "${1}"
	exit "${2}"
}

if [ ! -e "${ddns_hosts_file}" ]; then
	echo '# DDNS database' > ${ddns_hosts_file}
	log "${ddns_hosts_file} created"
fi

case $action in
	'commit')
		# Ignore none or empty hostname
		[ "${hostname}" = 'none' ] && abort_push '${hostname} == "none", aborted' 0
		[ "${hostname}" = '' ] && abort_push '${hostname} is empty, aborted' 0

		# Check if exists in hosts files
		if [ -e "${localdns_hosts_file}" ]; then # localdns package may not be installed
			cat $localdns_hosts_file | grep "${hostname}" > /dev/null 2>&1 && abort_push "${hostname} exists in ${localdns_hosts_file}" 0
		fi
		cat $ddns_hosts_file | grep "${hostname}" > /dev/null 2>&1 && abort_push "${hostname} exists in ${ddns_hosts_file}" 0

		# Push
		echo "${ip}\t${hostname}${lan_domain}" >> $ddns_hosts_file
		log "${hostname}${lan_domain} added to ${ddns_hosts_file}"

		# Flush dnsmasq's cache (not needed - dnsmasq will read file automatically)
		#log 'flushing dnsmasq cache'
		#killall -s SIGHUP dnsmasq
	;;
	'release')
		log 'release option not implemented'
	;;
	*)
		echo 'DO NOT USE THIS!'
	;;
esac

exit 0
