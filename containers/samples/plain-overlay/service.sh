#!/bin/sh
#################### Config ################################
CONTAINER_NAME='plain-overlay'
DESTINATION=$(dirname $0)
#DESTINATION='/home/containers/'"${CONTAINER_NAME}"
CONTAINER_ROOT='.container'
SERVICE_NAME=''
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

[ "$SERVICE_NAME" = '' ] && exec chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt $@ || exec chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt ${SERVICE_NAME} $@
