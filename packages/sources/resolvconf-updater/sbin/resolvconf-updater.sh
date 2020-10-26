#!/bin/sh
# Add to /etc/resolv.conf and guard
# 22.09.2019
# Patch 03.10.2019
# Improvements & new features 28.07.2020
# Pause script 04.08.2020

# Settings
home_dir='/usr/local/etc/resolvconf-updater.d'
resolvconf='/etc/resolv.conf'

# Logs
dlog()
{
	echo "${@}"
}
log()
{
	logger --priority daemon.debug --tag resolvconf-updater ${@}
	dlog "log() ${@}"
}
dlog "home_dir=${home_dir}"
dlog "resolvconf=${resolvconf}"
dlog "resolv.conf real path: $(readlink -f "${resolvconf}")"

dlog "if [ ! -e ${home_dir} ] => ? (default: false)"
if [ ! -e $home_dir ]; then
	dlog "if [ ! -e ${home_dir} ] => true"
	dlog 'exit 1'
	exit 1
fi

NOTIFY_PAUSED='false'; dlog "NOTIFY_PAUSED=${NOTIFY_PAUSED}"
log 'resolvconf-updater started'
dlog '------------------------------------------'; dlog 'while true'
while true; do
	dlog 'if [ -e "/tmp/.resolvconf-updater.pause" ] => ?'
	if [ -e '/tmp/.resolvconf-updater.pause' ]; then
		dlog 'if [ -e "/tmp/.resolvconf-updater.pause" ] => true'
		dlog 'if ! ${NOTIFY_PAUSED} => ? (default: false)'
		if ! ${NOTIFY_PAUSED}; then
			dlog 'if ! ${NOTIFY_PAUSED} => true'
			log 'resolvconf-updater paused'
			NOTIFY_PAUSED='true'
			dlog "NOTIFY_PAUSED=${NOTIFY_PAUSED}"
		fi
	else
		dlog 'if [ -e '/tmp/.resolvconf-updater.pause' ] => false'
		dlog 'if ${NOTIFY_PAUSED} => ? (default: false)'
		if ${NOTIFY_PAUSED}; then
			dlog 'if ${NOTIFY_PAUSED} => true'
			log 'resolvconf-updater resumed'
			NOTIFY_PAUSED='false'
			dlog "NOTIFY_PAUSED=${NOTIFY_PAUSED}"
		fi

		LOG='true' # send message to syslog only once
		dlog "LOG=${LOG}"
	
		dlog 'if [ ! "$(ls ${home_dir}/*.top.conf)" = "" ] => ? (default: false)'
		if [ ! "$(ls ${home_dir}/*.top.conf)" = '' ]; then
			dlog 'if [ ! "$(ls ${home_dir}/*.top.conf)" = "" ] => true'
			dlog 'for i in ${home_dir}/*.top.conf'
			for i in ${home_dir}/*.top.conf; do
				dlog "tac $i | while read line"
				tac $i | while read line; do
					dlog 'if ! cat $resolvconf | grep $line => ? (default: false)'
					if ! cat $resolvconf | grep "$line" > /dev/null 2>&1; then
						dlog 'if ! cat $resolvconf | grep $line => true'
						${LOG} && log "editing ${resolvconf}"; LOG='false'
						dlog "adding ${line}"
						sed -i '1s/^/'"${line}"'\n/' "$(readlink -f "${resolvconf}")"
					fi
					dlog 'if ! cat $resolvconf | grep $line => END'
				done
				dlog "tac $i | while read line => END"
			done
			dlog 'for i in ${home_dir}/*.top.conf => END'
		fi
	
		dlog 'if [ ! "$(ls ${home_dir}/*.bottom.conf)" = "" ] => ? (default: false)'
		if [ ! "$(ls ${home_dir}/*.bottom.conf)" = '' ]; then
			dlog 'if [ ! "$(ls ${home_dir}/*.bottom.conf)" = "" ] => true'
	
			#touch /tmp/.resolvconf-updater__add_blank_line
	
			dlog 'for i in ${home_dir}/*.bottom.conf'
			for i in ${home_dir}/*.bottom.conf; do
				dlog "cat $i | while read line"
				cat $i | while read line; do
					dlog 'if ! cat $resolvconf | grep "$line" => ? (default: false)'
					if ! cat $resolvconf | grep "$line" > /dev/null 2>&1; then
						dlog 'if ! cat $resolvconf | grep "$line" => true'
	
						#if [ -e /tmp/.resolvconf-updater__add_blank_line ]; then
						#	#echo '' >> $resolvconf
						#	rm /tmp/.resolvconf-updater__add_blank_line
						#fi
						#cat $resolvconf | grep '# Added by resolvconf-updater.sh' > /dev/null 2>&1 || echo '# Added by resolvconf-updater.sh' >> $resolvconf
	
						${LOG} && log "editing ${resolvconf}"; LOG='false'
						dlog "adding ${line}"
						echo "$line" >> $resolvconf
					fi
					dlog 'if ! cat $resolvconf | grep "$line" => END'
				done
				dlog "cat $i | while read line => END"
			done
			dlog 'for i in ${home_dir}/*.bottom.conf => END'
	
			# Old version based by one config file
			#add_blank_line=true
			#cat $home_dir | while read line; do
			#	if ! cat $resolvconf | grep "$line" > /dev/null 2>&1; then
			#		if $add_blank_line; then
			#			echo '' >> $resolvconf
			#			add_blank_line=false
			#		fi
			#		cat $resolvconf | grep '# Added by resolvconf-updater.sh' > /dev/null 2>&1 || echo '# Added by resolvconf-updater.sh' >> $resolvconf
			#		echo "$line" >> $resolvconf
			#	fi
			#done

			if ! cat ${resolvconf} | grep '# This file was edited by resolvconf-updater' > /dev/null 2>&1; then
				echo '# This file was edited by resolvconf-updater' >> ${resolvconf}
				dlog "added # This file was edited by resolvconf-updater to ${resolvconf}"
			fi
		fi
	fi

	dlog 'sleep 30'; dlog ''
	sleep 30
done

dlog 'exit 0'
exit 0
