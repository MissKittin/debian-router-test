#!/bin/sh
#################### Config - container ####################
#CONTAINER_NAME='plain'
#DESTINATION=$(dirname $0)
#MOUNT_LABEL="${CONTAINER_NAME}"
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

#################### Bind directories ######################
bindDirectory(){ [ "${2}" = '' ] && return 1; mount --bind "${1}" "${2}"; }
if [ -e "${DESTINATION}/.binds.rc" ]; then
	echo 'Binding directories...'
	cat "${DESTINATION}/.binds.rc" | while read bindSource; do
		bindSource="$(eval echo -n "${bindSource}")"
		if [ ! "${bindSource%"${bindSource#?}"}" = '#' ] && [ -e "${bindSource}" ]; then
			read bindDestination
			bindDestination="$(eval echo -n "${bindDestination}")"
			[ ! -e "${bindDestination}" ] && mkdir "${bindDestination}"
			bindDirectory "${bindSource}" "${bindDestination}"
		fi
	done
fi
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
