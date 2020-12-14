#!/bin/bash
### Suspend script with auto wake-up for acpid
### Push da button to suspend, host will wake up automatically
### 25.01.2019, 26.01.2019, 30.01.2019
### Config mod 11.01.2020
### More logs 27.07.2020
### Config file 12.08.2020
### Log file permissions 04.12.2020
### Removed ls and acpid-patch, moved log function, check for log file in log(), rtcwake path config, removed touch 08.12.2020

# Log function
log()
{
	# Check for log file
	if [ ! -e "${log_file}" ]; then
		echo -n '' > $log_file
		[ ! "${log_file_owner}" = '' ] && chown "${log_file_owner}" "${log_file}"
		[ ! "${log_file_perm}" = '' ] && chmod "${log_file_perm}" "${log_file}"
	fi

	echo ":: `date '+%d.%m.%Y %H:%M:%S'` $PPID $@" >> $log_file 2>&1
}

# Settings
conf_dir='/usr/local/etc/acpid-suspend'
. ${conf_dir}/config.rc

# Lock file with acpid patch
#if [ "$1" = 'acpid-patch' ]; then
#	log 'acpid patch activated'
#	if [ -e /tmp/.acpid-suspend.lock ]; then
#		echo "!! `date '+%d.%m.%Y %H:%M:%S'` $PPID lock file exists, removing, exiting..." >> $log_file 2>&1
#		rm /tmp/.acpid-suspend.lock
#		exit 0
#	fi
#else
	if [ -e /tmp/.acpid-suspend.lock ]; then
		echo "!! `date '+%d.%m.%Y %H:%M:%S'` $PPID lock file exists, exiting..." >> $log_file 2>&1
		exit 0
	fi
#fi
echo -n '' > /tmp/.acpid-suspend.lock
log 'executing locked'

# Functions
pre_suspend()
{
	local i
	for i in ${conf_dir}/pre_suspend.d/S*.rc; do
		if [ "${i}" = "${conf_dir}/pre_suspend.d/S*.rc" ]; then
			log 'pre_suspend() queue is empty'
			break
		fi
		log "pre_suspend() importing ${i}"
		. $i
	done
}
post_suspend()
{
	local i
	for i in ${conf_dir}/post_suspend.d/S*.rc; do
		if [ "${i}" = "${conf_dir}/post_suspend.d/S*.rc" ]; then
			log 'post_suspend() queue is empty'
			break
		fi
		log "post_suspend() importing ${i}"
		. $i
	done
}

# Log starting
log 'acpid-suspend script initialized and started'
log "will wake up at $wakeup_at"

# Call pre_suspend
log 'calling pre_suspend'
pre_suspend >> $log_file 2>&1
log 'pre_suspend end'

# Save date
actual_time=`date '+%s'`
wakeup_time=`date -d $wakeup_at '+%s'`
log 'date saved'

# Check if calculated time is correct
if [ "$actual_time" -gt "$wakeup_time" ]; then
	# Add 24 hours
	log 'wakeup time corrected'
	corrected_wakeup_time=$((wakeup_time + 86400))
else
	log 'wakeup time is correct'
	corrected_wakeup_time=$wakeup_time
fi

# Calculate difference
wakeup_in=$((corrected_wakeup_time - actual_time))
log 'wakeup time calculated'

# Call suspend
if $wakeup_enabled; then
	log "autowakeup enabled, calling ${rtcwake}..."
	${rtcwake} -s $wakeup_in -m mem >> $log_file 2>&1
	log 'woke up'
	${rtcwake} -m disable
	log 'alarm clock disabled'
else
	log 'autowakeup disabled, suspending...'
	echo 'mem' > /sys/power/state
	log 'woke up'
fi

# Suspend end, call post_suspend()
log 'calling post_suspend'
post_suspend >> $log_file 2>&1
log 'post_suspend end'

# Wait to avoid collision
log 'waiting...'
sleep 10

# Remove lock file
#if [ "$1" = 'acpid-patch' ]; then
#	log 'acpid patch active, not removing lock file'
#else
	rm /tmp/.acpid-suspend.lock
	log 'executing unlocked'
#fi

# Exit
log 'exiting...'
exit 0
