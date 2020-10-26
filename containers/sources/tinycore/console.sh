#!/bin/sh
#################### Config ################################
CONTAINER_NAME='corelinux'
DESTINATION=$(dirname $0)
#DESTINATION='/home/containers/'"${CONTAINER_NAME}"
SHELL_PROMPT="${CONTAINER_NAME}"'@\\w::'
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

#################### Run shell #############################
echo 'Logged as user "tc"'
chroot ${DESTINATION}/${CONTAINER_ROOT} su tc -c 'env PS1='"${SHELL_PROMPT}"' /bin/sh -c "cd; sh"'
############################################################

exit 0
