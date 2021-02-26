#!/bin/bash
#####################
### Bash DDNS client 17.01.2019
### Patch 03.09.2019
### wget params correction 22.09.2019
### client info 08.11.2019
### packaged version 31.07.2020
#####################

# Settings
. /usr/local/etc/ddns-client.rc

# Functions
[ -e "${log_file}" ] && echo '' >> "${log_file}"
log()
{
	local message="${1}"
	local param=''
	if [ ! "${2}" = '' ]; then
		local message="${2}"
		local param="${1}"
	fi

	echo ${param} "$(date '+%Y-%m-%d %H:%M:%S') ${message}" >> "${log_file}"
}
loga()
{
	echo -n "${@}" >> "${log_file}"
}
logb()
{
	echo "${@}" >> "${log_file}"
}

# Log daemon start
log ' DDNS client started'

# Loop
while :; do
	# Refresh ip, time, date and reset flag
	ip="$(wget -4 -q -O- "${ip_get_address}")"
	time="$(date +%H:%M)"
	date="$(date +%d.%m.%Y)"
	failed='false'

	# Check if ip correct
	if [[ "${ip}" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		# Check if ip changed - prevent from web host denial
		if [ "${last_ip}" = "${ip}" ] && [ ! "${last_ip}" = 'failed' ]; then
			log "Not updating, IP ${ip} not changed"
		else
			# Send data to server
			log '-n' "Updating ddns ${ip} "
			[ "${client_name}" = '' ] && result="$(wget -4 -q -O- "${host}?user=${user}&password=${password}&ip=${ip}&time=${time}&date=${date}")" || result="$(wget -4 -q -O- "${host}?user=${user}&password=${password}&client=${client_name}&ip=${ip}&time=${time}&date=${date}")"

			# Log results
			if [ "$?" = '0' ]; then
				loga 'OK '
			else
				loga 'Network failed '
				failed='true'
			fi
			if [ "${result}" = 'OK' ]; then
				logb 'OK'
			else
				logb 'PHP failed'
				failed='true'
			fi

			# Save actual ip
			"${failed}" && last_ip='failed' || last_ip="${ip}"
		fi
	else
		log "IP address mailformed"
		failed='true'
	fi

	# Wait for next update
	"${failed}" && sleep '10' || sleep "${sleep_time}"
done

exit 0
