#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='plain-squash'
#DESTINATION=$(dirname $0)
#MOUNT_LABEL="${CONTAINER_NAME}"
#CONTAINER_ROOT='.container'
#CONTAINER_ON_RAM=true
#CONTAINER_ROOTFS_IMAGE='.rootfs.img'

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
if [ ! -e ${DESTINATION}/${CONTAINER_ROOTFS_IMAGE} ]; then
	echo "No ${CONTAINER_ROOTFS_IMAGE}"
	exit 1
fi
if mountpoint -q ${DESTINATION}/${CONTAINER_ROOT}/mnt > /dev/null 2>&1; then
	echo 'Container started'
	exit 1
fi
############################################################

#################### Start container #######################
echo 'Starting container...'
${CONTAINER_ON_RAM} && mount -t tmpfs -o suid,nodev,exec,noatime,nodiratime,mode=0755 ${MOUNT_LABEL} ${DESTINATION}/${CONTAINER_ROOT}
echo -n "$$" > ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # save start.sh PID
[ -e ${DESTINATION}/${CONTAINER_ROOT}/diff ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/diff
[ -e ${DESTINATION}/${CONTAINER_ROOT}/mnt ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/mnt
[ -e ${DESTINATION}/${CONTAINER_ROOT}/rootfs ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/rootfs
[ -e ${DESTINATION}/${CONTAINER_ROOT}/tmp ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/tmp

mount -o loop,suid,nodev,exec,noatime,nodiratime ${DESTINATION}/${CONTAINER_ROOTFS_IMAGE} ${DESTINATION}/${CONTAINER_ROOT}/rootfs
mount -t overlay -o suid,nodev,exec,noatime,nodiratime,lowerdir=${DESTINATION}/${CONTAINER_ROOT}/rootfs,upperdir=${DESTINATION}/${CONTAINER_ROOT}/diff,workdir=${DESTINATION}/${CONTAINER_ROOT}/tmp ${MOUNT_LABEL} ${DESTINATION}/${CONTAINER_ROOT}/mnt
for i in dev dev/pts proc sys; do
	mount --bind /${i} ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
############################################################

#################### Configure container ###################
if [ ! -e ${DESTINATION}/${CONTAINER_ROOT}/.configured ]; then # configure only if it is first boot
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh << EOF
#!/bin/sh
	echo pid \$$ >> /tmp/.debug.txt
		echo -n \$$ > /tmp/.start-${CONTAINER_NAME}.sh.pid
	echo start > /tmp/.debug.txt

		# write commands here

	echo rmpid >> /tmp/.debug.txt
		rm /tmp/.start-${CONTAINER_NAME}.sh.pid
	echo stop >> /tmp/.debug.txt
exit 0
EOF
chmod 755 ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /tmp/.start-${CONTAINER_NAME}.sh
echo -n '' > ${DESTINATION}/${CONTAINER_ROOT}/.configured
fi

#echo 'Stopping service...'
#chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /etc/init.d/service stop > /dev/null 2>&1
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

#################### Secure container ######################
#echo 'Removing system mountpoints...'
#for i in dev dev/pts sys proc dev; do
#	umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
#done
############################################################

#################### Configure service #####################
#echo 'Configuring service...'
#[ -e ${DESTINATION}/.config.tar.gz ] && tar xf ${DESTINATION}/.config.tar.gz -C ${DESTINATION}/${CONTAINER_ROOT}/mnt
############################################################

#################### Strip container #######################
if [ "$1" = 'strip' ] && [ -e ${DESTINATION}/${CONTAINER_ROOT}/diff ] && [ ! -e ${DESTINATION}/${CONTAINER_ROOT}/.configured ]; then
	echo 'Removing unnecessary files...'

	# tmp
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/tmp/.start-${CONTAINER_NAME}.sh
	gzip -9 ${DESTINATION}/${CONTAINER_ROOT}/diff/tmp/.debug.txt &
fi
############################################################

#################### Start service #########################
#echo 'Starting service...'
#chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /etc/init.d/service start
############################################################

logger --tag containers container ${CONTAINER_NAME} started
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && rm ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # remove start.sh PID
exit 0
