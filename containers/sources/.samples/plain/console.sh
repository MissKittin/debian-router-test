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
if [ ! -e "${DESTINATION}/${CONTAINER_ROOT}" ]; then
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

#################### Run shell #############################
chroot ${DESTINATION}/${CONTAINER_ROOT} su -c 'env PS1='"${SHELL_PROMPT}"' /bin/sh -c "cd; sh"'
############################################################

exit 0
