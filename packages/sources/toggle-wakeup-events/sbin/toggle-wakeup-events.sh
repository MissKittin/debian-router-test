#!/bin/sh

if [ ! -e '/usr/local/etc/toggle-wakeup-events.rc' ]; then
	echo 'No /usr/local/etc/toggle-wakeup-events.rc'
	exit 1
fi

if [ ! -e '/proc/acpi/wakeup' ]; then
	echo 'No /proc/acpi/wakeup'
	exit 1
fi

. '/usr/local/etc/toggle-wakeup-events.rc'

if [ ! "${ENABLE_EVENTS}" = '' ]; then
	for event in ${ENABLE_EVENTS}; do
		if cat '/proc/acpi/wakeup' | grep "${event}" | grep 'disabled' > /dev/null 2>&1; then
			echo "Enabling ${event}"
			echo "${event}" > '/proc/acpi/wakeup'
		else
			echo "${event} already enabled"
		fi
	done
fi

if [ ! "${DISABLE_EVENTS}" = '' ]; then
	for event in ${DISABLE_EVENTS}; do
		if cat '/proc/acpi/wakeup' | grep "${event}" | grep 'enabled' > /dev/null 2>&1; then
			echo "Disabling ${event}"
			echo "${event}" > '/proc/acpi/wakeup'
		else
			echo "${event} already disabled"
		fi
	done
fi

exit 0
