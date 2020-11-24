#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='stunnel'
#DESTINATION=$(dirname $0)
#CONTAINER_ROOT='.container'
#CONTAINER_SERVICES='/etc/init.d/stunnel4'

config_rc_path="$(dirname "$(readlink -f "${0}")")/.config.rc"
if [ ! -e "${config_rc_path}" ]; then
	echo "error: ${config_rc_path} not found"
	exit 1
fi
. "${config_rc_path}"
unset config_rc_path
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

if [ "${CONTAINER_SERVICES}" = '' ]; then
	exec chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt $@
else
	for service in ${CONTAINER_SERVICES}; do
		exec chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt ${service} $@
	done
fi