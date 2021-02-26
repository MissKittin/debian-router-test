#!/bin/sh
#################### Config ################################
config_rc_path="$(dirname "$(readlink -f "${0}")")/.config.rc"
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
	if ! mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}/mnt" > /dev/null 2>&1; then
		echo 'Container stopped'
		exit 1
	fi
fi
############################################################

#################### Configure shell #######################
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.bashrc << EOF
PS1='${SHELL_PROMPT}'
EOF
############################################################

#################### Run shell #############################
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /bin/bash --rcfile /tmp/.bashrc
############################################################

exit 0
