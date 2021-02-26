#!/bin/sh
# DDNS by hosts for isc-dhcp-server -> dnsmasq - IPv6 version
# 24.02.2021

# Get localdns hosts file
[ -e '/usr/local/sbin/localdns.sh' ] && localdns_hosts_file="$(/usr/local/sbin/localdns.sh print-hostsfile-location)"

for arg in $(echo -n "${@}" | sed 's/= /=/g'); do # isc-dhcp-server may pass 'arg= value' instead of 'arg=value'
	case $arg in
		action=*) action=${arg#action=}; ;;
		mac=*) mac=${arg#mac=}; ;;
		hostname=*) hostname=${arg#hostname=}; ;;
		ddns_hosts_file=*) ddns_hosts_file=${arg#ddns_hosts_file=}; ;;
		lan_domain=*) lan_domain=${arg#lan_domain=}; ;;
	esac
done
unset arg

log() { echo "${1}"; logger --priority daemon.debug --tag isc-dhcp-ddns6 ${1}; }
abort_push() { log "${1}"; exit "${2}"; }
read_file() { while IFS= read -r line || [ -n "${line}" ]; do echo ${2} "${line}"; done < "${1}"; }
print_S1() { echo -n "${1}"; }
print_S5() { echo -n "${5}"; }
find_ipv6()
{
	local output="$(
		ip -6 neighbor | while read entry; do
			if [ "$(print_S5 ${entry})" = "${1}" ]; then
				if [ "${entry%%:*}" = 'fe80' ]; then
					print_S1 ${entry}
					break
				fi
			fi
		done
	)"

	[ "${output}" = '' ] && return 1

	echo -n "${output}"
	return 0
}

case "${action}" in
	'commit')
		# Create ddns hosts file
		if [ ! -e "${ddns_hosts_file}" ]; then
			echo '# DDNS v6 database' > ${ddns_hosts_file}
			log "${ddns_hosts_file} created"
		fi

		# Check settings, ignore none or empty hostname
		[ "${ddns_hosts_file}" = '' ] && abort_push 'no ddns_hosts_file specified' 1
		[ "${mac}" = '' ] && abort_push '${mac} is empty, aborted' 0
		[ "${hostname}" = 'none' ] && abort_push '${hostname} == "none" '"(${mac})"', aborted' 0
		[ "${hostname}" = '' ] && abort_push '${hostname} is empty '"(${mac})"', aborted' 0

		# Check if exists in localdns hosts files
		if [ -e "${localdns_hosts_file}" ]; then # localdns package may not be installed
			read_file "${localdns_hosts_file}" | grep "\b${hostname}${lan_domain}\b" > /dev/null 2>&1 && abort_push "${hostname}${lan_domain} already exists in ${localdns_hosts_file}" 0
		fi

		# Check if exists in ddns hosts
		read_file "${ddns_hosts_file}" | grep "\b${hostname}${lan_domain}\b" && abort_push "${hostname}${lan_domain} already exists in ${ddns_hosts_file}" 0

		# Find IP
		ip="$(find_ipv6 "${mac}")" || abort_push "IPv6 not found for ${hostname}${lan_domain}" 0

		# Push
		echo "${ip}\t${hostname}${lan_domain}" >> "${ddns_hosts_file}"
		log "${hostname}${lan_domain} added to ${ddns_hosts_file}"

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
