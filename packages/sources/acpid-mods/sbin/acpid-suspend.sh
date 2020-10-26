#!/bin/bash
### Suspend script with auto wake-up for acpid
### Push da button to suspend, host will wake up automatically
### 25.01.2019, 26.01.2019, 30.01.2019
### Config mod 11.01.2020
### More logs 27.07.2020
### Config file 12.08.2020

# Settings
conf_dir='/usr/local/etc/acpid-suspend'
. ${conf_dir}/config.rc

# Lock file with acpid patch
if [ "$1" = 'acpid-patch' ]; then
	echo "`date '+%d.%m.%Y %H:%M:%S'` acpid patch activated" >> $log_file 2>&1
	if [ -e /tmp/.acpid-suspend.lock ]; then
		echo "!! `date '+%d.%m.%Y %H:%M:%S'` $PPID lock file exists, removing, exiting..." >> $log_file 2>&1
		rm /tmp/.acpid-suspend.lock
		exit 0
	fi
else
	if [ -e /tmp/.acpid-suspend.lock ]; then
		echo "!! `date '+%d.%m.%Y %H:%M:%S'` $PPID lock file exists, exiting..." >> $log_file 2>&1
		exit 0
	fi
fi
touch /tmp/.acpid-suspend.lock
echo "`date '+%d.%m.%Y %H:%M:%S'` executing locked" >> $log_file 2>&1

# Functions
pre_suspend()
{
	ls ${conf_dir}/pre_suspend.d/S*.rc > /dev/null 2>&1 && for i in ${conf_dir}/pre_suspend.d/S*.rc; do
		log "pre_suspend() importing ${i}"
		. $i
	done
}
post_suspend()
{
	ls ${conf_dir}/post_suspend.d/S*.rc > /dev/null 2>&1 && for i in ${conf_dir}/post_suspend.d/S*.rc; do
		log "post_suspend() importing ${i}"
		. $i
	done
}
log()
{
	echo ":: `date '+%d.%m.%Y %H:%M:%S'` $PPID $@" >> $log_file 2>&1
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
	log 'wakeup time correct'
	corrected_wakeup_time=$wakeup_time
fi

# Calculate difference
wakeup_in=$((corrected_wakeup_time - actual_time))
log 'wakeup time calculated'

# Call suspend
if $wakeup_enabled; then
	log 'autowakeup enabled, calling rtcwake...'
	rtcwake -s $wakeup_in -m mem >> $log_file 2>&1
	log 'woke up'
	rtcwake -m disable
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
if [ "$1" = 'acpid-patch' ]; then
	log 'acpid patch active, not removing lock file'
else
	rm /tmp/.acpid-suspend.lock
	log 'executing unlocked'
fi

# Exit
log 'exiting...'
exit 0
