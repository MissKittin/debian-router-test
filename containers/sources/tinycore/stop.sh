#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='corelinux'
#DESTINATION=$(dirname $0)
#CONTAINER_ROOT='.container'

config_rc_path="$(dirname "$(readlink -f "${0}")")/.config.rc"
if [ ! -e "${config_rc_path}" ]; then
	echo "error: ${config_rc_path} not found"
	exit 1
fi
. "${config_rc_path}"
unset config_rc_path
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
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start-${CONTAINER_NAME}.sh.pid ] && kill -9 $(cat ${DESTINATION}/${CONTAINER_ROOT}/.start-${CONTAINER_NAME}.sh.pid)
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && kill -9 $(cat ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid)
############################################################

#################### Unbind directories ####################
unbindDirectory(){ [ "${2}" = '' ] && return 1; container_umount "${2}"; }
if [ -e "${DESTINATION}/.binds.rc" ]; then
	echo 'Unbinding directories...'
	cat "${DESTINATION}/.binds.rc" | while read unbindSource; do
		if [ ! "${unbindSource%"${unbindSource#?}"}" = '#' ]; then
			read unbindDestination
			unbindDestination="$(eval echo -n "${unbindDestination}")"
			mountpoint -q "${unbindDestination}" && unbindDirectory "${unbindSource}" "${unbindDestination}"
		fi
	done
fi
############################################################

#################### Stop container ########################
cat << EOF > ${DESTINATION}/${CONTAINER_ROOT}/umount.sh
#!/bin/sh
echo Unmounting packages...
for i in \$(mount | grep '/tmp/tcloop' | awk '{print \$3}'); do
	umount /\${i} || umount -l /\${i}
done
EOF
chmod 755 ${DESTINATION}/${CONTAINER_ROOT}/umount.sh
chroot ${DESTINATION}/${CONTAINER_ROOT} /umount.sh

echo 'Stopping container...'
for i in dev/pts dev proc sys; do
	container_umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
container_umount ${DESTINATION}/${CONTAINER_ROOT}
############################################################

logger --tag containers container ${CONTAINER_NAME} stopped
exit 0
