#!/bin/sh
#################### Config - container ####################
CONTAINER_NAME='plain'
DESTINATION=$(dirname $0)
#DESTINATION='/home/containers/'"${CONTAINER_NAME}"
MOUNT_LABEL="${CONTAINER_NAME}"
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
if mountpoint -q ${DESTINATION}/${CONTAINER_ROOT} > /dev/null 2>&1; then
	echo 'Container started'
	exit 1
fi
############################################################

#################### Start container #######################
echo 'Starting container'
mount -t tmpfs -o suid,nodev,exec,noatime,nodiratime,mode=0755 ${MOUNT_LABEL} ${DESTINATION}/${CONTAINER_ROOT}
echo -n "$$" > ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # save start.sh PID

if [ ! -e ${DESTINATION}/${CONTAINER_ROOT}/.configured ]; then # configure only if it is first boot
	# Write script here
	echo -n '' > ${DESTINATION}/${CONTAINER_ROOT}/.configured
fi

#for i in dev dev/pts proc sys; do
#	mount --bind /${i} ${DESTINATION}/${CONTAINER_ROOT}/${i}
#done
############################################################

#################### Configure service #####################
#echo 'Configuring service...'
#[ -e ${DESTINATION}/.config.tar.gz ] && tar xf ${DESTINATION}/.config.tar.gz -C ${DESTINATION}/${CONTAINER_ROOT}/mnt
############################################################

#################### Start service #########################
#echo 'Starting service...'
#chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /etc/init.d/service start
############################################################

logger --tag containers container ${CONTAINER_NAME} started
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && rm ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # remove start.sh PID
exit 0
