#!/bin/sh
# Check and correct the wake-on-lan feature on all NICs
# and send logs to kernel log

WOL_OPTION='d' # read "Supported Wake-on" row from ethtool $iface
[ "${1}" = '' ] || WOL_OPTION="${1}"

cd /sys/class/net
for i in *; do
	ethtool ${i} 2>/dev/null | grep -v 'Supports Wake-on: ' | grep 'Wake-on: ' | while read line; do
		[ "${line}" = "Wake-on: ${WOL_OPTION}" ] || if ethtool -s ${i} wol ${WOL_OPTION} > /dev/null 2>&1; then
			echo "correct-wake-on-lan.sh: corrected wake-on-lan option for ${i} to ${WOL_OPTION}" > /dev/kmsg
		else
			echo "correct-wake-on-lan.sh: correction wake-on-lan option for ${i} to ${WOL_OPTION} failed" > /dev/kmsg
		fi
	done
done

exit 0
