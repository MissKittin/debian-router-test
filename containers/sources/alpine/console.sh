#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='alpine'
#DESTINATION=$(dirname $0)
#SHELL_PROMPT="${CONTAINER_NAME}"'@\\w:: '
#CONTAINER_ROOT='.container'

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

#################### Run shell #############################
chroot ${DESTINATION}/${CONTAINER_ROOT} su -c 'env PS1='"${SHELL_PROMPT}"' /bin/sh -c "cd; sh"'
############################################################

exit 0
