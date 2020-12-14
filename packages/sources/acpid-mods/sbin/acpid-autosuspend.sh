#!/bin/bash
# Autosuspend daemon
# 11,13.01.2020
# oneshot config 26.05.2020
# operating mode, debug messages 22.06.2020
# autoreload settings 25.08.2020
# new acpid_autosuspend_activated() 31.08.2020
# suspend command logging, reimport settings removed, ls removed, acpid_autosuspend_allowed function 08.12.2020

# Settings
echo 'define hardcoded settings'
config_dir='/usr/local/etc/acpid-autosuspend'
log_file='/var/log/acpid-autosuspend.log'

# Import settings
echo 'import config file'
. ${config_dir}/config.rc

# Simple function
echo 'define log and dlog functions'
dlog()
{
	echo "$@"
}
log()
{
	echo "`date '+%d.%m.%Y %H:%M:%S'` $@" >> $log_file
	dlog "log() $@"
}
log 'Started'

# Activation time calculation
dlog 'define time calculation function'
#acpid_autosuspend_activated()
#{
#	local time=$(date '+%H:%M'); dlog "acpid_autosuspend_activated() time=${time}"
#	if [[ "$time" > "${activate_at_hour}:${activate_at_min}" ]] && [[ "$time" < "${deactivate_at_hour}:${deactivate_at_min}" ]]; then
#		dlog 'acpid_autosuspend_activated() -> true'
#		return 0
#	fi
#	dlog 'acpid_autosuspend_activated() -> false'
#	return 1
#}
acpid_autosuspend_activated()
{
	# ${1} -> start hour
	# ${2} -> start minute
	# ${3} -> end hour
	# ${4} -> end minute
	# ${5} -> current hour
	# ${6} -> current minute

	if [ "${1}" = "${3}" ]; then # start hour === end hour
		[ "${6}" -ge "${2}" ] && [ "${6}" -lt "${4}" ] && return 0 || return 1 # if between start and end minute
	elif [ "${5}" = "${1}" ]; then # lower limit
		[ "${6}" -ge "${2}" ] && return 0 || return 1
	elif [ "${5}" = "${3}" ]; then # upper limit
		[ "${6}" -lt "${4}" ] && return 0 || return 1
	else # between or beyond lower and upper
		local i="${1}"
		while true; do
			[ "${i}" = "${3}" ] && return 1 # cut at the upper limit
			[ "${i}" = "${5}" ] && return 0 # between lower and upper
			if [ "${i}" = '23' ]; then # midnight is next hour
				i='00'
			else
				if [ "${i}" = '08' ] || [ "${i}" = '09' ]; then # skip value too great for base
					i="$((${i#0}+1))"
				else # standard addition operation
					i="$((i+1))"
				fi
				[ "${i}" -le '9' ] && i="0${i}" # zero for i<10
			fi
		done
	fi
}

# Allow or block suspend
dlog 'define acpid_autosuspend_allowed function'
acpid_autosuspend_allowed()
{
	# variables
	dlog 'acpid_autosuspend_allowed(): local variables'
	local BREAK
	local REASON
	local i

	# flags
	dlog 'acpid_autosuspend_allowed(): BREAK REASON flags'
	BREAK=false
	REASON=''

	# do checklist
	for i in ${config_dir}/checklist.d/S*.rc; do
		if [ "${i}" = "${config_dir}/checklist.d/S*.rc" ]; then
			log 'acpid_autosuspend_allowed queue is empty'
			break
		fi

		dlog "checklist ${i}"
		. $i
		[ ! "${BREAK}" = '' ] && ${BREAK} && dlog " ${i} break" && break
		dlog " ${i} success"
	done

	if ${BREAK}; then
		log "suspend blocked: ${REASON}"
		dlog "acpid_autosuspend_allowed(): return 1"
		return 1
	fi

	dlog "acpid_autosuspend_allowed(): return 0"
	return 0
}

# Operating mode
if ${continuous_mode}; then
	dlog 'acpid_autosuspend_activated() -> redefined continuous mode'
	acpid_autosuspend_activated()
	{
		dlog 'continuous mode -> acpid_autosuspend_activated() -> true'
		return 0
	}
fi

log 'waiting for boot...'
dlog 'sleep 60'
sleep 60

# log if started out of time interval
dlog '$daemon_enabled check'
if $daemon_enabled; then
	#acpid_autosuspend_activated || log "started out of time, will be activated at ${activate_at_hour}:${activate_at_min}"
	acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M') || log "started out of time, will be activated at ${activate_at_hour}:${activate_at_min}"
else
	log 'daemon disabled in settings'
fi

# infinity loop
dlog 'activated=false ONESHOT_CONFIG_IMPORTED=false'
activated=false # now only for logging
ONESHOT_CONFIG_IMPORTED=false
dlog '------------------------------------------'; dlog 'while true'
while true; do
	# include oneshot config
	dlog '# include oneshot config (before if ! $ONESHOT_CONFIG_IMPORTED)'
	if ! $ONESHOT_CONFIG_IMPORTED; then
		dlog 'if ! $ONESHOT_CONFIG_IMPORTED -> true'
		[ -e ${oneshot_file} ] && if [ "$(stat -c %U ${oneshot_file})" = "${oneshot_file_owner}" ] && [ "$(stat -c %a ${oneshot_file})" = "${oneshot_file_mode}" ]; then
			. ${oneshot_file}
			ONESHOT_CONFIG_IMPORTED=true
			log "oneshot config imported, will be activated at ${activate_at_hour}:${activate_at_min}"
		fi
	fi

	# refresh the configuration if it was and has been deleted
	dlog '# refresh the configuration if it was and has been deleted'
	if $ONESHOT_CONFIG_IMPORTED && [ ! -e ${oneshot_file} ]; then
		ONESHOT_CONFIG_IMPORTED=false
		. ${config_dir}/config.rc
		log "oneshot config removed by user, settings refreshed, will be activated at ${activate_at_hour}:${activate_at_min}"
	fi

	# re-import settings if oneshot config not present
	dlog '# re-import settings if oneshot config not present'
	if ! $ONESHOT_CONFIG_IMPORTED; then
		dlog "import ${config_dir}/config.rc"
		. ${config_dir}/config.rc
	fi

	# check time
	#if acpid_autosuspend_activated || $activated; then
	dlog "acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M') -> ?"
	if acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M'); then
		#dlog 'if acpid_autosuspend_activated || $activated -> true'
		dlog "acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M') -> true"
		# check if daemon is activated in settings
		if $daemon_enabled; then
			dlog 'if $daemon_enabled -> true'
			# set activated flag
			$activated || log 'daemon activated'
			activated=true

			### This block moved to acpid_autosuspend_allowed() [flags, checklist]

			# block or suspend
			dlog 'if acpid_autosuspend_allowed -> ?'
			if acpid_autosuspend_allowed; then
				dlog 'if acpid_autosuspend_allowed -> false'
				log 'suspending...'
				dlog "suspend_command=${suspend_command}"
				$suspend_command >> $log_file 2>&1
				log 'woke up'
				dlog 'sleep 600'
				sleep 600 # 10 mins
			else
				dlog 'if acpid_autosuspend_allowed -> false'
			fi

			# check if i have to shutdown now
			#if ! acpid_autosuspend_activated; then
			if ! acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M'); then
				#dlog 'if ! acpid_autosuspend_activated -> true'
				dlog "if ! acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M') -> true"
				# Reset oneshot config
				if ${ONESHOT_CONFIG_IMPORTED}; then
					dlog 'if ${ONESHOT_CONFIG_IMPORTED} -> true'
					rm ${oneshot_file} && log 'oneshot config removed by acpid-autosuspend.sh' || log 'oneshot config - removing failed'
					ONESHOT_CONFIG_IMPORTED=false
					. ${config_dir}/config.rc
					log 'settings refreshed'
				fi

				log "daemon deactivated, will be activated at ${activate_at_hour}:${activate_at_min}"
				activated=false
				dlog 'activated=false'
			fi
		fi
	else
		dlog "acpid_autosuspend_activated ${activate_at_hour} ${activate_at_min} ${deactivate_at_hour} ${deactivate_at_min} $(date '+%H %M') -> false"
	fi

	# wait
	dlog 'sleep 60'
	sleep 60
done

exit 0
