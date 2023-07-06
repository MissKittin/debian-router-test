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
if ! mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}-ns" > /dev/null 2>&1; then
	echo 'Container stopped (ns)'
	exit 1
fi
############################################################

#################### Stop container #######################
echo 'Stopping container (ns)...'

echo '' > "${DESTINATION}/${CONTAINER_ROOT}-ns/container.stop"
IFS='' read sleep < "${DESTINATION}/${CONTAINER_ROOT}-ns/container.stop"

container_umount "${DESTINATION}/${CONTAINER_ROOT}-ns/ns-mount"
container_umount "${DESTINATION}/${CONTAINER_ROOT}-ns/ns-pid"
container_umount "${DESTINATION}/${CONTAINER_ROOT}-ns/ns-ipc"
container_umount "${DESTINATION}/${CONTAINER_ROOT}-ns"
############################################################

exit 0
