#!/bin/sh
#################### Config ################################
CONTAINER_NAME='vnc'
DESTINATION=$(dirname $0)
#DESTINATION='/home/containers/'"${CONTAINER_NAME}"
SHELL_PROMPT="${CONTAINER_NAME}"'> '
CONTAINER_ROOT='.container'
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

#################### Configure shell #######################
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.bashrc << EOF
cd
PS1='${SHELL_PROMPT}'
EOF
############################################################

#################### Run shell #############################
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt su user -c '/bin/bash --rcfile /tmp/.bashrc'
############################################################

exit 0
