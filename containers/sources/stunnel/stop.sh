#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='stunnel'
#DESTINATION=$(dirname $0)
#CONTAINER_ROOT='.container'

config_rc_path="$(dirname "$(readlink -f "${0}")")/.config.rc"
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
if [ ! "`whoami`" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
if [ ! -e ${DESTINATION}/${CONTAINER_ROOT} ]; then
	echo 'Wrong configuration'
	exit 1
fi
if ! mountpoint -q ${DESTINATION}/${CONTAINER_ROOT} > /dev/null 2>&1; then
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
[ -e ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh.pid ] && kill -9 $(cat ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh.pid)
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && kill -9 $(cat ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid)
############################################################

#################### Unbind directories ####################
#echo 'Unmounting certificates directory...'
#mountpoint -q ${DESTINATION}/${CONTAINER_ROOT}/mnt/ssl && container_umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/ssl
#mountpoint -q ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp && container_umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp

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
############################################################

#################### Stop container ########################
echo 'Stopping container...'
for i in dev/pts dev proc sys; do
	container_umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
container_umount ${DESTINATION}/${CONTAINER_ROOT}/mnt
container_umount ${DESTINATION}/${CONTAINER_ROOT}
############################################################

logger --tag containers container ${CONTAINER_NAME} stopped
exit 0
