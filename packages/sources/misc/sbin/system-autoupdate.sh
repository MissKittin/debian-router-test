#!/bin/bash
### System autoupdate daemon for debian
### 25.01.2019, 29.01.2019, 05.06.2020
### apt-get clean switch, apt_check_path, debug messages 07.07.2020

# Settings
[ "$1" = 'status' ] || echo 'define hardcoded settings'
check_every='20' # ~ hours
apt_get_clean=false
apt_check_path='apt-check'
#log_file='/tmp/.system_autoupdate.log'
log_file="${1}/.system_autoupdate.log"

# Get status
if [ "$1" = 'status' ]; then
	ps -Aef | grep -v 'grep' | grep -v 'status' | grep $0 > /dev/null 2>&1 && exit 0 || exit 1
fi

# Log functions
echo 'define log and dlog functions'
dlog()
{
	echo "$@"
}
log()
{
	echo ":: `date +'%d.%m.%Y %H:%M:%S'` $@" >> $log_file 2>&1
	dlog "log() $@"
}

# Log start
log 'System autoupdate daemon started'

# Recalc hours to seconds
check_every_mins=$((check_every * 60)); dlog "check_every_mins=${check_every_mins}"
check_every_secs=$((check_every_mins * 60)); dlog "check_every_secs=${check_every_secs}"
log 'Sleep time recalculated, sleeping after first run...'

# Keep calm
dlog 'sleep 120'
sleep 120

# Start main loop
dlog '------------------------------------------'; dlog 'while true'
while true; do
	# Log
	log 'Loop started'

	# Check for internet
	PING_HOST='http://ftp.debian.org/'; dlog "PING_HOST=${PING_HOST}"
	while ! wget -q --tries=10 --timeout=20 --spider $PING_HOST; do
		# Keep calm
		log 'No internet'
		dlog 'sleep 10'
		sleep 10
	done

	# Check if is not locked
	dlog 'if [ -e /tmp/.system-autoupdate-noupdate ] -> check'
	if [ -e /tmp/.system-autoupdate-noupdate ]; then
		dlog 'if [ -e /tmp/.system-autoupdate-noupdate ] -> true'
		log 'Not updating, /tmp/.system-autoupdate-noupdate exists'
	else
		dlog 'if [ -e /tmp/.system-autoupdate-noupdate ] -> false'
		# Do update
		log 'Updating...'
		dlog "while ! apt-get update >> $log_file"
		while ! apt-get update >> $log_file 2>&1; do
			log 'Failed, waiting...'
			dlog 'sleep 60'
			sleep 60
			log 'Re-updaing...'
		done
		log 'Updated, checking...'

		# Read how many packages can be upgraded
		dlog "${apt_check_path} -h -c -f >> $log_file"
		/usr/local/sbin/apt-check -h -c -f >> $log_file 2>&1

		# Clean
		dlog 'if ${apt_get_clean} -> check'
		if ${apt_get_clean}; then
			dlog 'if ${apt_get_clean} -> true'
			log 'Cleaning...'
			apt-get clean
		else
			dlog 'if ${apt_get_clean} -> false (empty block)'
		fi
	fi

	# Sleep
	log 'OK, sleeping...'
	dlog "sleep ${check_every_secs}"
	sleep $check_every_secs
done

log 'Error! Out of loop! Exiting...'
dlog 'exit 1'
exit 1
