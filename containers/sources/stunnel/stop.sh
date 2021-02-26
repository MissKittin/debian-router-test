#!/bin/sh
#################### Config ################################
config_rc_path="$(dirname "${0}")/.config.rc"
#config_rc_path="$(dirname "$(readlink -f "${0}")")/.config.rc"
if [ ! -e "${config_rc_path}" ]; then
	echo "error: ${config_rc_path} not found"
	exit 1
fi
. "${config_rc_path}"
unset config_rc_path
############################################################

#################### Internal functions ####################
container_umount(){ mountpoint -q "${1}" && for i in $(seq 1 6); do if umount "${1}" > /dev/null 2>&1; then break; else [ "$i" = 6 ] && umount -l "${1}" > /dev/null 2>&1; sleep 1; fi; done; }
############################################################

#################### Check environment #####################
if [ ! "$(whoami)" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
if [ ! -e "${DESTINATION}/${CONTAINER_ROOT}" ]; then
	echo 'Wrong configuration'
	exit 1
fi
if ! mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}" > /dev/null 2>&1; then
	echo 'Container stopped'
	exit 1
fi
############################################################

#################### Stop services #########################
if [ -e "${DESTINATION}/service.sh" ]; then
	echo 'Stopping services...'
	${DESTINATION}/service.sh stop
	sleep 1
fi
############################################################

#################### Kill start.sh #########################
[ -e "${DESTINATION}/${CONTAINER_ROOT}/mnt/.start-${CONTAINER_NAME}.sh.pid" ] && kill -9 "$(cat ${DESTINATION}/${CONTAINER_ROOT}/mnt/.start-${CONTAINER_NAME}.sh.pid)"
[ -e "${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid" ] && kill -9 "$(cat ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid)"
############################################################

#################### Unmount tmpfs #########################
if [ -e "${DESTINATION}/.tmpfs.rc" ]; then
	echo 'Unmounting tmpfs...'
	cat "${DESTINATION}/.tmpfs.rc" | while read tmpfsDestination; do
		tmpfsDestination="$(eval echo -n "${tmpfsDestination}")"
		if [ ! "${tmpfsDestination%"${tmpfsDestination#?}"}" = '#' ] && [ ! "${tmpfsDestination}" = '' ]; then
			mountpoint -q "${tmpfsDestination}" && container_umount "${tmpfsDestination}"
			read tmpfsParams # ignore this line
		fi
	done
fi
############################################################

#################### Unbind directories ####################
unbindDirectory(){ [ "${2}" = '' ] && return 1; container_umount "${2}"; }
if [ -e "${DESTINATION}/.binds.rc" ]; then
	echo 'Unbinding directories...'
	cat "${DESTINATION}/.binds.rc" | while read unbindSource; do
		if [ ! "${unbindSource%"${unbindSource#?}"}" = '#' ]; then
			read unbindDestination
			unbindDestination="$(eval echo -n "${unbindDestination}")"
			mountpoint -q "${unbindDestination}" && unbindDirectory "${unbindSource}" "${unbindDestination}"
		fi
	done
fi
unset unbindDirectory
############################################################

#################### Unbind pre-configure directories ######
unbindDirectory(){ [ "${2}" = '' ] && return 1; container_umount "${2}"; }
if [ -e "${DESTINATION}/.pre-configure-binds.rc" ]; then
	echo 'Unbinding directories...'
	cat "${DESTINATION}/.pre-configure-binds.rc" | while read unbindSource; do
		if [ ! "${unbindSource%"${unbindSource#?}"}" = '#' ]; then
			read unbindDestination
			unbindDestination="$(eval echo -n "${unbindDestination}")"
			mountpoint -q "${unbindDestination}" && unbindDirectory "${unbindSource}" "${unbindDestination}"
		fi
	done
fi
unset unbindDirectory
############################################################

#################### Stop container ########################
echo 'Stopping container...'
unbind_system_mountpoints=''
for i_unbind_system_mountpoint in ${BIND_SYSTEM_MOUNTPOINTS}; do
	unbind_system_mountpoints="${i_unbind_system_mountpoint} ${unbind_system_mountpoints}"
done
for i_unbind_system_mountpoint in ${unbind_system_mountpoints}; do
	container_umount "${DESTINATION}/${CONTAINER_ROOT}/mnt/${i_unbind_system_mountpoint}"
done
unset i_unbind_system_mountpoint
unset unbind_system_mountpoints

container_umount "${DESTINATION}/${CONTAINER_ROOT}/mnt"
container_umount "${DESTINATION}/${CONTAINER_ROOT}"
############################################################

logger --tag containers container ${CONTAINER_NAME} stopped
exit 0
