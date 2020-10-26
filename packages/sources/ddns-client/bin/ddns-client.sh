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
loga()
{
	echo -n "$@" >> $log_file
}
logb()
{
	echo "$@" >> $log_file
}

# Log daemon start
logb " DDNS client started `date +%d.%m.%Y` `date +%H:%M`"

# Loop
while true; do
	# Refresh ip, time, date and reset flag
	ip=`wget -4 -q -O- ${ip_get_address}`
	time=`date +%H:%M`
	date=`date +%d.%m.%Y`
	failed=false

	# Check if ip correct
	if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		# Check if ip changed - prevent from web host denial
		if [ "$last_ip" = "$ip" ] && [ ! "$last_ip" = 'failed' ]; then
			# Log
			logb "Not updating, IP $ip not changed at $date $time"
		else
			# Send data to server
			loga "Updating ddns $ip $date $time "
			[ "$client_name" = '' ] && result=`wget -4 -q -O- "${host}?user=${user}&password=${password}&ip=${ip}&time=${time}&date=${date}"` || result=`wget -4 -q -O- "${host}?user=${user}&password=${password}&client=${client_name}&ip=${ip}&time=${time}&date=${date}"`

			# Log results
			if [ "$?" = 0 ]; then
				loga 'OK '
			else
				loga 'Network failed '
				failed=true
			fi
			if [ "$result" = 'OK' ]; then
				logb 'OK'
			else
				logb 'PHP failed'
				failed=true
			fi

			# Save actual ip
			$failed && last_ip=failed || last_ip=$ip
		fi
	else
		logb "IP address mailformed at $date $time"
		failed=true
	fi

	# Wait for next update
	$failed && sleep 10 || sleep $sleep_time
done

exit 0
