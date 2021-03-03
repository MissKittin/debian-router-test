#!/bin/bash
# Notify daemon v2
# 26.08.2020 - 02.09.2020

# hardcoded settings
install_dir='/usr/local'
etc_dir="${install_dir}/etc/notify-daemon"
share_dir="${install_dir}/share/notify-daemon"

# functions
debug_log()
{
	echo -n ''
}

# args
for arg in ${@}; do
	case ${arg} in
		'--debug')
			debug_log()
			{
				echo "${@}"
			}
		;;
	esac
done
unset arg

# debug
debug_log 'notify-daemon.sh: debugging enabled'
debug_log "notify-daemon.sh: installed in ${install_dir}"

# help - pt1
main__arg_help='false'
if [ "${1}" = '--help' ]; then
	main__arg_help='true'
	echo ''; echo ' Notify daemon v2'
	echo '  --debug -> enable debug mode'
fi

# import subsystems
for subsystem in ${share_dir}/subsystems.d/*; do
	if [ "${subsystem}" = "${share_dir}/subsystems.d/*" ]; then
		debug_log 'notify-daemon.sh: !!! NO SUBSYSTEMS INSTALLED - ABORTING !!!'
		exit 1
	fi
	if [ -d "${subsystem}" ]; then
		if [ -e "${subsystem}/subsystem.rc" ]; then
			if [ -e "${subsystem}/.subsystem_enabled" ]; then
				debug_log "notify-daemon.sh: importing subsystem ${subsystem##*/}"
				. ${subsystem}/subsystem.rc
			else
				debug_log "notify-daemon.sh: subsystem ${subsystem##*/} is disabled"
			fi
		else
			debug_log "notify-daemon.sh: subsystem ${subsystem##*/} is invalid"
		fi
	fi
done

# help - pt2
${main__arg_help} && echo '' && exit 0
unset main__arg_help

# execute core subsystem
subsystem__core

# execute subsystems
#for subsystem in ${SUBSYSTEMS_LIST}; do
#	debug_log "notify-daemon.sh: executing subsystem ${subsystem}"
#	${subsystem}
#done

debug_log 'notify-daemon.sh: exit 0'
exit 0
