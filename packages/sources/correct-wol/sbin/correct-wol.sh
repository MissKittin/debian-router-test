#!/bin/sh
# Check and correct the wake-on-lan feature on all NICs
# and send logs to kernel log

WOL_OPTION='d' # read "Supported Wake-on" row from ethtool $iface
install_dir='/usr/local'

[ -e "${install_dir}/etc/correct-wol.rc" ] && . ${install_dir}/etc/correct-wol.rc
[ "${1}" = '' ] || WOL_OPTION="${1}"

if ! ${ENABLED}; then
	echo 'WOL correction disabled in settings'
	exit 0
fi

cd '/sys/class/net' || exit 1
for i in *; do
	ethtool ${i} 2>/dev/null | grep -v 'Supports Wake-on: ' | grep 'Wake-on: ' | while read line; do
		[ "${line}" = "Wake-on: ${WOL_OPTION}" ] || if ethtool -s ${i} wol ${WOL_OPTION} > /dev/null 2>&1; then
			echo "correct-wake-on-lan.sh: corrected wake-on-lan option for ${i} to ${WOL_OPTION}" > /dev/kmsg
		else
			echo "correct-wake-on-lan.sh: correction wake-on-lan option for ${i} to ${WOL_OPTION} failed" > /dev/kmsg
		fi

		if [ -e '/sys/class/net/'"${i}"'/device/power/wakeup' ]; then
			if [ "$(cat '/sys/class/net/'"${i}"'/device/power/wakeup')" = 'disabled' ]; then
				if echo 'enabled' > '/sys/class/net/'"${i}"'/device/power/wakeup'; then
					echo "correct-wake-on-lan.sh: changed ACPI wakeup option for ${i} from disabled to enabled" > /dev/kmsg
				else
					echo "correct-wake-on-lan.sh: change ACPI wakeup option for ${i} failed" > /dev/kmsg
				fi
			fi
		else
			echo "correct-wake-on-lan.sh: ${i} does not support ACPI wakeup" > /dev/kmsg
		fi
	done
done

exit 0
