#!/bin/bash
# Auto disable fancontrol
# 12.06.2019
# Patch 04.09.2019
# Activation time calculation function and patch 11.10.2019
# Debug log 22.07.2020
# Packaged version, local mode and install prefix 30.07.2020
# Minor improvements 10.08.2020
# Restore fancontrol state on exit 24.08.2020

### Howto:
# If temperature is above limit, shutdown fancontrol for better cooling
# If is winter, shutdown fancontrol every $winter_wait_cycles
##########

# Settings
INSTALL_PREFIX='/usr/local'
CHECK_INTERNET='true'
echo "import ${INSTALL_PREFIX}/etc/fancontrol-weather.rc"
. ${INSTALL_PREFIX}/etc/fancontrol-weather.rc

# Simple functions
echo 'define dlog() edlog() log()'
dlog()
{
	echo "$@"
}
edlog()
{
	# this is only used in fancontrol_get_temperature_info()
	>&2 echo "$@"
}
log()
{
	local date="$(date '+%d.%m.%Y %H:%M:%S')"
	echo "${date} ${@}" >> ${log_file} 2>&1
	dlog "log() ${date} ${@}"
}

# Log parameters
dlog "INSTALL_PREFIX=${INSTALL_PREFIX}"
log 'fancontrol-weather started'
log "Configuration: activate: ${activate_at_hour} o'clock, deactivate: ${deactivate_at_hour} o'clock, limit temperature: ${limit_temperature} C"
log "Local scrapper args: ${scrapper_local_args}"
log "Remote scrapper args: ${scrapper_remote_args}"
dlog "server=${server}"; dlog "log_file=${log_file}"; dlog "winter_wait_cycles=${winter_wait_cycles}"
dlog "wget_ping_options=${wget_ping_options}"
dlog "wget_options=${wget_options}"

# Check local scrapper
dlog "if [ mode=${mode} = local ] => ? (default: false)"
if [ "${mode}" = 'local' ]; then
	log 'Daemon running in local mode'
	dlog "if [ mode=${mode} = local ] => true"
	dlog "if ! ${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper scrapper_test => ? (default: false)"
	if ! ${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper scrapper_test > /dev/null 2>&1; then
		dlog "if ! ${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper scrapper_test => true"
		log "Local scrapper ${scrapper} is not working, exiting..."
		dlog 'exit 1'
		exit 1
	fi

	dlog "import ${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper/scrapper.rc"
	. ${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper.rc
	dlog 'if ! ${scrapper_internet_required} => ? (default: false)'
	if ! ${scrapper_internet_required}; then
		dlog 'if ! ${scrapper_internet_required} => true'
		log 'Internet connection will not be checked'
		CHECK_INTERNET='false'
		dlog "CHECK_INTERNET=${CHECK_INTERNET}"
	fi
fi

dlog 'define fancontrol_weather_activated()'
fancontrol_weather_activated() # Activation time calculation
{
	local i=$activate_at_hour
	local hour_now=$(date '+%H')
	while [ ! $i -eq $deactivate_at_hour ]; do
		if [ $i -eq $hour_now ]; then
			dlog "fancontrol_weather_activated() i=${i} == hour_now=${hour_now} -> return true"
			return 0
			break
		fi
		if [ $i -ge 24 ]; then
			i=0
		else
			i=$((i+1))
		fi
	done
	dlog 'fancontrol_weather_activated() while ended -> return false'
	return 1
}
dlog 'define fancontrol_get_temperature_info()'
fancontrol_get_temperature_info() # function created for local/remote mode
{
	edlog 'define local $TEMP'
	local TEMP

	# get temperature and catch error
	edlog "if [ mode=${mode} = local ] => ?"
	if [ "${mode}" = 'local' ]; then # use local mode
		edlog "if [ mode=${mode} = local ] => true"

		edlog "if ! TEMP=${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper ${scrapper_local_args} -> ? (default: false)"
		if ! TEMP="$(${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper ${scrapper_local_args})"; then
			edlog "if ! TEMP=${INSTALL_PREFIX}/share/fancontrol-weather/${scrapper}/scrapper ${scrapper_local_args} -> true"

			echo -n "${TEMP}" # reason in output

			edlog 'fancontrol_get_temperature_info() return 1'
			return 1
		fi
	else # use remote mode (default)
		edlog "if [ mode=${mode} = local ] => false"

		edlog "if ! TEMP=wget ${wget_options} -q -O- ${server}?${scrapper_remote_args} -> ? (default: false)"
		if ! TEMP="$(wget ${wget_options} -q -O- "${server}?${scrapper_remote_args}")"; then
			edlog "if ! TEMP=wget --no-check-certificate -q -O- ${server}?${scrapper_remote_args} -> true"
			edlog 'fancontrol_get_temperature_info() return 1'
			return 1
		fi
	fi

	# success, print saved temperature
	edlog "fancontrol_get_temperature_info() TEMP=${TEMP}"
	echo -n "${TEMP}"

	edlog 'fancontrol_get_temperature_info() return 0'
	return 0
}
dlog 'define fancontrol_weather_exit()'
fancontrol_weather_exit()
{
	dlog 'fancontrol_weather_exit() case ${fancontrol_default_state}'
	case ${fancontrol_default_state} in
		'true')
			dlog 'fancontrol_weather_exit() ${fancontrol_default_state} == true'
			log 'Shutdown signal received, starting fancontrol...'
			dlog 'fancontrol_weather_exit() /etc/init.d/fancontrol start'
			/etc/init.d/fancontrol start > /dev/null 2>&1 && dlog 'fancontrol_weather_exit() fancontrol started successfully' || dlog 'fancontrol_weather_exit() fancontrol start failed'
		;;
		'false')
			dlog 'fancontrol_weather_exit() ${fancontrol_default_state} == false'
			log 'Shutdown signal received, stopping fancontrol...'
			dlog 'fancontrol_weather_exit() /etc/init.d/fancontrol stop'
			/etc/init.d/fancontrol stop > /dev/null 2>&1 && dlog 'fancontrol_weather_exit() fancontrol stopped successfully' || dlog 'fancontrol_weather_exit() fancontrol stop failed'
		;;
		*)
			dlog 'fancontrol_weather_exit() ${fancontrol_default_state} == ???'
			log 'Shutdown signal received, fancontrol was in unknown state - no action...'
		;;
	esac
	dlog 'fancontrol_weather_exit() exit 0 <- END OF SCRIPT'
	exit 0
}

# Trap exit signals
dlog 'trap fancontrol_weather_exit SIGINT'
trap fancontrol_weather_exit SIGINT
dlog 'trap fancontrol_weather_exit SIGTERM'
trap fancontrol_weather_exit SIGTERM

# Check if fancontrol is running
dlog 'if /etc/init.d/fancontrol status -> ?'
if /etc/init.d/fancontrol status > /dev/null 2>&1; then
	dlog 'if /etc/init.d/fancontrol status -> true'
	log 'fancontrol is running'
	fancontrol_default_state=true # for exit function
	RUNNING=true
else
	dlog 'if /etc/init.d/fancontrol status -> false'
	log 'fancontrol is stopped'
	fancontrol_default_state=false # for exit function
	RUNNING=false
fi

log 'waiting for boot...'
dlog 'sleep 60'
sleep 60

# log if started out of time interval
#[ $(date '+%H') -ge $activate_at_hour ] || log "started out of time, will be activated at ${activate_at_hour} o'clock"
fancontrol_weather_activated || log "started out of time, will be activated at ${activate_at_hour} o'clock"

# Infinity loop
activated=false
winter_indicator=0 # special for cold days

dlog '------------------------------------------'; dlog 'while true'
while true; do
	dlog "activated=${activated}"
	$activated && log 'main loop started'

	# check time
	dlog 'if fancontrol_weather_activated || $activated -> ? (default: false)'
	if fancontrol_weather_activated || $activated; then
		dlog 'if fancontrol_weather_activated || $activated -> true'

		# set activated flag
		dlog 'set activated=true'
		$activated || log 'daemon activated'
		activated=true

		# check internet connection
		if ${CHECK_INTERNET}; then
			log 'waiting for internet connection...'
			dlog "while ! wget -q --tries=10 --timeout=20 --spider ${wget_ping_options}"
			while ! wget -q --tries=10 --timeout=20 --spider ${wget_ping_options}; do
				dlog 'sleep 5'
				sleep 5
			done
		fi

		# get temperature info
		log 'getting temperature info...'
		dlog "if TEMP=fancontrol_get_temperature_info -> ?"
		if TEMP=$(fancontrol_get_temperature_info); then
			dlog "if TEMP=fancontrol_get_temperature_info -> true"
			log "temperature: $TEMP C"

			# Stop fancontrol or start
			dlog "TEMP=${TEMP} >= limit_temperature=${limit_temperature}"
			if [ $TEMP -ge $limit_temperature ]; then
				/etc/init.d/fancontrol status > /dev/null 2>&1 && log "temp above ${limit_temperature} C, shutting down fancontrol" || log 'fancontrol already stopped'
				/etc/init.d/fancontrol status > /dev/null 2>&1 && /etc/init.d/fancontrol stop > /dev/null 2>&1

				winter_indicator=0 # reset
				dlog "winter_indicator=${winter_indicator}"
			else
				/etc/init.d/fancontrol status > /dev/null 2>&1 && log 'fancontrol already started' || log "temp below ${limit_temperature} C, starting fancontrol"
				/etc/init.d/fancontrol status > /dev/null 2>&1 || /etc/init.d/fancontrol start > /dev/null 2>&1

				winter_indicator=$((winter_indicator+1)) # iterate
				dlog "winter_indicator=${winter_indicator}"
			fi

			wait=1800 # 30 min
			dlog "wait=${wait}"
		else
			dlog 'if TEMP=fancontrol_get_temperature_info -> false'

			log "server connection failed, reason: ${TEMP}"
			log 'waiting a sec...'

			wait=5
			dlog "wait=${wait}"
		fi

		# for cold days
		dlog "if [ ! winter_wait_cycles=${winter_wait_cycles} == 0 ] && [ winter_indicator=${winter_indicator} == $((winter_wait_cycles+1)) ] -> ? (default: false)"
		if [ ! $winter_wait_cycles = 0 ] && [ $winter_indicator = $((winter_wait_cycles+1)) ]; then
			dlog "if [ ! winter_wait_cycles=${winter_wait_cycles} == 0 ] && [ winter_indicator=${winter_indicator} == $((winter_wait_cycles+1)) ] -> true"
			log "winter cooling is activated, indicator==$((winter_indicator-1))"

			/etc/init.d/fancontrol status > /dev/null 2>&1 && log "shutting down fancontrol" || log 'fancontrol already stopped'
			/etc/init.d/fancontrol status > /dev/null 2>&1 && /etc/init.d/fancontrol stop > /dev/null 2>&1

			dlog 'sleep 900'
			sleep 900 # 15 min

			/etc/init.d/fancontrol status > /dev/null 2>&1 && log 'fancontrol already started' || log "starting fancontrol"
			/etc/init.d/fancontrol status > /dev/null 2>&1 && /etc/init.d/fancontrol stop > /dev/null 2>&1

			log 'winter cooling deactivated'
			winter_indicator=0 # reset
			dlog "winter_indicator=${winter_indicator}"
		fi

		# check if i have to shutdown now
		dlog 'if ! fancontrol_weather_activated -> ? (default: false)'
		if ! fancontrol_weather_activated; then
			dlog 'if ! fancontrol_weather_activated -> true'
			log "daemon deactivated, will be activated at ${activate_at_hour} o'clock"

			activated=false
			dlog "activated=${activated}"

			dlog "RUNNING=${RUNNING} && fancontrol start || fancontrol stop"
			$RUNNING && /etc/init.d/fancontrol start > /dev/null 2>&1 || /etc/init.d/fancontrol stop > /dev/null 2>&1
		fi

		dlog 'if fancontrol_weather_activated || $activated -> end'
	fi

	if $activated && [ $wait = 1800 ]; then log 'done, standby...'; fi
	dlog "sleep ${wait}"
	sleep $wait
done

exit 0
