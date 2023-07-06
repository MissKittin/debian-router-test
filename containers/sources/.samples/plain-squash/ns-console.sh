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
if [ ! -x "${DESTINATION}/console.sh" ]; then
	echo 'console.sh not exists nor executable'
	exit 1
fi
if ! mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}-ns" > /dev/null 2>&1; then
	echo 'Container stopped (ns)'
	exit 1
fi
############################################################

nsenter \
	--pid="${DESTINATION}/${CONTAINER_ROOT}-ns/ns-pid" \
	--mount="${DESTINATION}/${CONTAINER_ROOT}-ns/ns-mount" \
	--ipc="${DESTINATION}/${CONTAINER_ROOT}-ns/ns-ipc" \
	"$(realpath "${DESTINATION}")/console.sh"

exit 0
