#!/bin/sh
### acpid choice by power button click v2
### 23.06.2020

# Settings
functions='/usr/local/etc/acpid-choice.rc'
indicator='/var/run/.acpid-choice-indicator'
beep='beep'
beep_length='60'
beep_frequency='440'
sleep_length='0.1'
wait_for_others='2'

# Started - notify
$beep -f $beep_frequency -l $beep_length

# Iterate or make indicator - first click or next
if [ -e "${indicator}" ]; then
	# iterate only
	echo -n "$(($(cat "${indicator}")+1))" > ${indicator}
	exit 0
else
	# main
	echo -n '1' > ${indicator}
fi

# Builtin functions
acpid_choice_beep()
{
	for i in $(seq 1 ${1}); do
		$beep -f $beep_frequency -l $beep_length
		sleep $sleep_length;
	done
}

# Wait for other instances
sleep $wait_for_others

# Execute click_n function
. ${functions}
click_$(cat "${indicator}") 2>/dev/null || click_last

# Remove indicator
rm "${indicator}"

exit 0
