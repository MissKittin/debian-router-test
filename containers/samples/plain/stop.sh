#!/bin/sh
#################### Config ################################
CONTAINER_NAME='plain'
DESTINATION=$(dirname $0)
#DESTINATION='/home/containers/'"${CONTAINER_NAME}"
CONTAINER_ROOT='.container'
############################################################

#################### Internal functions ####################
container_umount(){ mountpoint -q "${1}" && for i in $(seq 1 6); do if umount "${1}" > /dev/null 2>&1; then break; else [ "$i" = 6 ] && umount -l "${1}" > /dev/null 2>&1; sleep 1; fi; done; }
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

#################### Kill start.sh #########################
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && kill -9 $(cat ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid)
############################################################

#################### Stop container ########################
echo 'Stopping container...'
for i in dev/pts dev proc sys; do
	container_umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
container_umount ${DESTINATION}/${CONTAINER_ROOT}
############################################################

logger --tag containers container ${CONTAINER_NAME} stopped
exit 0
