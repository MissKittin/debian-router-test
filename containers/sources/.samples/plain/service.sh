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

#################### Check environment #####################
if [ ! "$(whoami)" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
if [ ! -e ${DESTINATION}/${CONTAINER_ROOT} ]; then
	echo 'Wrong configuration'
	exit 1
fi
if "${CONTAINER_ON_RAM}"; then
	if ! mountpoint -q ${DESTINATION}/${CONTAINER_ROOT} > /dev/null 2>&1; then
		echo 'Container stopped'
		exit 1
	fi
fi
############################################################

if [ "${CONTAINER_SERVICES}" = '' ]; then
	exec chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt $@
else
	if [ ! "${2}" = '' ]; then
		exec chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt ${@}
	fi

	if [ "${1}" = 'autostart' ] && [ ! "${CONTAINER_AUTOSTART_SERVICES}" = '' ]; then
		for service in ${CONTAINER_AUTOSTART_SERVICES}; do
			chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt ${service} start
		done
	else
		EXIT_SUCCESS='true'
		for service in ${CONTAINER_SERVICES}; do
			chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt ${service} $@ || EXIT_SUCCESS='false'
		done
		${EXIT_SUCCESS} && exit 0 || exit 1
	fi
fi
