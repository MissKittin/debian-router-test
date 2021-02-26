#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, readlink

# Data provider - OS backend
# This script don't need superuser, but scripts in /usr/local/sbin may need root

# Import PATH variable
. ./lib/shell/path.rc

read_file() { [ -e "${1}" ] && while IFS= read -r line || [ -n "${line}" ]; do echo ${2} "${line}"; done < "${1}"; }
remove_first_arg() { local skip='true'; local i; for i in $@; do "${skip}" && skip='false' || echo -n "${i} "; done; }
dir_name_of() { echo "${1%/*}"; }

case $1 in
	'queryInterfaces')
		[ "$2" = '' ] && exit 0
		interfaces=$(remove_first_arg ${@}) # arg filter

		# RX/TX to B/s converter
		interfaceUtilization()
		{
			# input: $interface
			# output: Received $1 B/s Sent $2 B/s
			# source: https://stackoverflow.com/a/17102611

			if [ ! -e "/sys/class/net/${1}" ]; then
				# Interface not exists, abort
				echo -n 'null|null'
				return 1
			fi
			RXPREV='-1'
			TXPREV='-1'
			while true; do
				RX=$(read_file /sys/class/net/${1}/statistics/rx_bytes '-n')
				TX=$(read_file /sys/class/net/${1}/statistics/tx_bytes '-n')
				case ${RXPREV} in
					'-1')
						RXPREV="${RX}"
						TXPREV="${TX}"
					;;
					*)
						BWRX=$((${RX}-${RXPREV}))
						BWTX=$((${TX}-${TXPREV}))
						echo -n "${BWRX}|${BWTX}"
						break
					;;
				esac
				sleep 0.1
			done
		}

		# Run converter in loop
		for i in ${interfaces}; do
			echo "$(interfaceUtilization ${i})" # B/s B/s (array delimiter in function)
		done

		exit 0
	;;
	'getInterfaces')
		# Read interfaces from system
		for str in /sys/class/net/*; do
			[ "${str}" = '/sys/class/net/*' ] && break
			i="$(readlink -f "${str}")"; i="${i##*/sys/devices/}"
			[ ! "${i%%/*}" = 'virtual' ] && echo -n "${str##*/} "
		done

		# Read custom interfaces
		[ -e "$(dir_name_of "$(readlink -f "${0}")")/../config.rc" ] && . $(dir_name_of "$(readlink -f "${0}")")/../config.rc
		echo -n "${additional_interfaces}"

		exit 0
	;;
	'getInterfacesInfo')
		[ "$2" = '' ] && exit 0
		interfaces=$(remove_first_arg "${@}") # arg filter
		[ -e "$(dir_name_of "$(readlink -f "${0}")")/../config.rc" ] && . $(dir_name_of "$(readlink -f "${0}")")/../config.rc # Read the rest of the config

		# Parse config file
		for i in ${interfaces}; do
			# Read interface speed
			interface_speed=$(read_file /sys/class/net/${i}/speed '-n' 2>/dev/null) # Ethernet speed
			[ -e "/sys/class/net/${i}/wireless/link" ] && interface_speed=$(read_file /sys/class/net/${i}/wireless/link '-n' 2>/dev/null) # WiFi speed
			[ "$(eval echo -n \${speed_${i}})" = '' ] || interface_speed="$(eval echo -n \${speed_${i}})" # Custom interface speed

			# Check if speed is defined
			if [ "${interface_speed}" = '' ]; then # Unknown speed/Not connected
				echo "${i}|null|$(eval echo -n \${label_${i}})"
			else # Standard output
				echo "${i}|${interface_speed}|$(eval echo -n \${label_${i}})" # Mb/s
			fi
		done

		exit 0
	;;
esac

exit 0
