#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='miredo'
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
echo 'Starting container...'
mount -t tmpfs -o suid,nodev,exec,noatime,nodiratime,mode=0755 ${MOUNT_LABEL} ${DESTINATION}/${CONTAINER_ROOT}
echo -n "$$" > ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # save start.sh PID
[ -e ${DESTINATION}/${CONTAINER_ROOT}/diff ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/diff
[ -e ${DESTINATION}/${CONTAINER_ROOT}/mnt ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/mnt
[ -e ${DESTINATION}/${CONTAINER_ROOT}/tmp ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/tmp

mount -t overlay -o suid,nodev,exec,noatime,nodiratime,lowerdir=/,upperdir=${DESTINATION}/${CONTAINER_ROOT}/diff,workdir=${DESTINATION}/${CONTAINER_ROOT}/tmp ${MOUNT_LABEL} ${DESTINATION}/${CONTAINER_ROOT}/mnt
for i in dev dev/pts proc sys; do
	mount --bind /${i} ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
############################################################

#################### Configure container ###################
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh << EOF
#!/bin/sh
	echo pid \$$ >> /tmp/.debug.txt
		echo -n \$$ > /tmp/.start-${CONTAINER_NAME}.sh.pid
	echo start >> /tmp/.debug.txt
		echo -n Waiting for network...
		PING_HOST='http://ftp.debian.org/'
		while ! wget -q --tries=10 --timeout=20 --spider \$PING_HOST; do
			sleep 1
			echo sleep >> /tmp/.debug.txt
			echo -n .
		done
		echo .
	echo update >> /tmp/.debug.txt
		echo Updating apt database...
		apt-get update >> /tmp/.debug.txt
	echo install >> /tmp/.debug.txt
		echo Installing packages...
		apt-get install -y miredo >> /tmp/.debug.txt 2>&1
	echo clean >> /tmp/.debug.txt
		echo Cleaning apt...
		apt-get clean
	echo rmpid >> /tmp/.debug.txt
		rm /tmp/.start-${CONTAINER_NAME}.sh.pid
	echo stop >> /tmp/.debug.txt
exit 0
EOF
chmod 755 ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /tmp/.start-${CONTAINER_NAME}.sh

echo 'Stopping service...'
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /etc/init.d/miredo stop > /dev/null 2>&1
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
echo 'Removing system mountpoints...'
for i in sys proc dev/pts; do
	umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
############################################################

#################### Strip container #######################
if [ "$1" = 'strip' ] && [ -e ${DESTINATION}/${CONTAINER_ROOT}/diff ]; then
	echo 'Removing unnecessary files...'

	# etc
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/init.d/.* > /dev/null 2>&1
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/network
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/rc*.d
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/systemd
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/.pwd.lock

	# home, lib, usr/share
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/home
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/lib
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/usr/share

	# var
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/cache/apt
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/cache/debconf
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/lib
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/log

	# tmp
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/tmp/.start-${CONTAINER_NAME}.sh
	gzip -9 ${DESTINATION}/${CONTAINER_ROOT}/diff/tmp/.debug.txt &
fi
############################################################

#################### Start services ########################
if [ -e "${DESTINATION}/service.sh" ]; then
	echo 'Starting services...'
	${DESTINATION}/service.sh start
fi
############################################################

logger --tag containers container ${CONTAINER_NAME} started
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && rm ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # remove start.sh PID
exit 0
