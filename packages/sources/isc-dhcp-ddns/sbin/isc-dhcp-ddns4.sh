#!/bin/sh
# DDNS by hosts for isc-dhcp-server -> dnsmasq - IPv4 version
# 05.02.2019
# Script improvements 19.08.2020, 19.02.2021

# Get localdns hosts file
[ -e '/usr/local/sbin/localdns.sh' ] && localdns_hosts_file="$(/usr/local/sbin/localdns.sh print-hostsfile-location)"

for arg in $(echo -n "${@}" | sed 's/= /=/g'); do # isc-dhcp-server may pass 'arg= value' instead of 'arg=value'
	case $arg in
		action=*) action=${arg#action=}; ;;
		ip=*) ip=${arg#ip=}; ;;
		mac=*) mac=${arg#mac=}; ;;
		hostname=*) hostname=${arg#hostname=}; ;;
		ddns_hosts_file=*) ddns_hosts_file=${arg#ddns_hosts_file=}; ;;
		lan_domain=*) lan_domain=${arg#lan_domain=}; ;;
	esac
done
[ "${mac}" = '' ] && mac='MAC empty'
unset arg

log() { echo "${1}"; logger --priority daemon.debug --tag isc-dhcp-ddns4 ${1}; }
abort_push() { log "${1}"; exit "${2}"; }
read_file() { while IFS= read -r line || [ -n "${line}" ]; do echo ${2} "${line}"; done < "${1}"; }

case "${action}" in
	'commit')
		# Create ddns hosts file
		if [ ! -e "${ddns_hosts_file}" ]; then
			echo '# DDNS database' > ${ddns_hosts_file}
			log "${ddns_hosts_file} created"
		fi

		# Check settings, ignore none or empty hostname
		[ "${ddns_hosts_file}" = '' ] && abort_push 'no ddns_hosts_file specified' 1
		[ "${ip}" = '' ] && abort_push '${ip} is empty, aborted' 0
		[ "${hostname}" = 'none' ] && abort_push '${hostname} == "none" '"(${mac})"', aborted' 0
		[ "${hostname}" = '' ] && abort_push '${hostname} is empty '"(${mac})"', aborted' 0

		# Check if exists in localdns hosts files
		if [ -e "${localdns_hosts_file}" ]; then # localdns package may not be installed
			read_file "${localdns_hosts_file}" | grep "\b${hostname}\b" > /dev/null 2>&1 && abort_push "${hostname}${lan_domain} already exists in ${localdns_hosts_file}" 0
		fi

		# Check if exists in ddns hosts
		read_file "${ddns_hosts_file}" | grep -P "${ip}"'\t'"${hostname}${lan_domain}" && abort_push "${hostname}${lan_domain} is up-to-date in ${ddns_hosts_file}" 0

		# Edit or push
		if read_file "${ddns_hosts_file}" | grep "\b${hostname}${lan_domain}\b" > /dev/null 2>&1; then
			sed -i -r 's/^ *[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+(\t+'"${hostname}${lan_domain}"')/'"${ip}"'\1/' "${ddns_hosts_file}"
			log "${hostname}${lan_domain} updated in ${ddns_hosts_file}"
		else
			echo "${ip}\t${hostname}${lan_domain}" >> "${ddns_hosts_file}"
			log "${hostname}${lan_domain} added to ${ddns_hosts_file}"
		fi

		# Flush dnsmasq's cache
		if [ -e '/var/run/dnsmasq/dnsmasq.pid' ]; then
			log 'flushing dnsmasq cache'
			kill -1 "$(read_file '/var/run/dnsmasq/dnsmasq.pid' '-n')"
		else
			log 'not flushing dnsmasq cache - /var/run/dnsmasq/dnsmasq.pid not exists'
		fi
	;;
	*)
		echo 'DO NOT USE THIS!'
		exit 1
	;;
esac

exit 0
