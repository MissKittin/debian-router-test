#!/bin/sh
#################### Config - container ####################
config_rc_path="$(dirname "${0}")/.config.rc"
#config_rc_path="$(dirname "$(readlink -f "${0}")")/.config.rc"
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
	if mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}" > /dev/null 2>&1; then
		echo 'Container started'
		exit 1
	fi
fi
############################################################

#################### Start container #######################
echo 'Starting container'
"${CONTAINER_ON_RAM}" && mount -t tmpfs -o suid,nodev,exec,noatime,nodiratime,mode=0755 "${MOUNT_LABEL}" "${DESTINATION}/${CONTAINER_ROOT}"
echo -n "$$" > "${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid" # save start.sh PID

if [ ! -e "${DESTINATION}/${CONTAINER_ROOT}/.configured" ] && [ -e "${DESTINATION}/.configure.rc" ]; then # configure only if it is first boot
	. "${DESTINATION}/.configure.rc"
	echo -n '' > "${DESTINATION}/${CONTAINER_ROOT}/.configured"
fi

if [ ! "${BIND_SYSTEM_MOUNTPOINTS}" = '' ]; then
	for i_bind_mountpoint in ${BIND_SYSTEM_MOUNTPOINTS}; do
		mount --bind "/${i_bind_mountpoint}" "${DESTINATION}/${CONTAINER_ROOT}/mnt/${i_bind_mountpoint}"
	done
	unset i_bind_mountpoint
fi
############################################################

#################### Pre-configure bind directories ########
bindDirectory(){ [ "${2}" = '' ] && return 1; mount --bind "${1}" "${2}"; }
if [ -e "${DESTINATION}/.pre-configure-binds.rc" ]; then
	echo 'Binding directories...'
	cat "${DESTINATION}/.pre-configure-binds.rc" | while read bindSource; do
		bindSource="$(eval echo -n "${bindSource}")"
		if [ ! "${bindSource%"${bindSource#?}"}" = '#' ] && [ -e "${bindSource}" ]; then
			read bindDestination
			bindDestination="$(eval echo -n "${bindDestination}")"
			[ ! -e "${bindDestination}" ] && mkdir -p "${bindDestination}"
			bindDirectory "${bindSource}" "${bindDestination}"
		fi
	done
fi
unset bindDirectory
############################################################

#################### Mount tmpfs ###########################
if [ -e "${DESTINATION}/.tmpfs.rc" ]; then
	echo 'Mounting tmpfs...'
	cat "${DESTINATION}/.tmpfs.rc" | while read tmpfsDestination; do
		tmpfsDestination="$(eval echo -n "${tmpfsDestination}")"
		if [ ! "${tmpfsDestination%"${tmpfsDestination#?}"}" = '#' ] && [ ! "${tmpfsDestination}" = '' ]; then
			[ ! -e "${tmpfsDestination}" ] && mkdir -p "${tmpfsDestination}"
			read tmpfsParams
			tmpfsParams="$(eval echo -n "${tmpfsParams}")"
			[ ! "${tmpfsParams}" = '' ] && tmpfsParams="-o ${tmpfsParams}"
			mount -t tmpfs ${tmpfsParams} "${CONTAINER_NAME}-tmpfs" "${tmpfsDestination}"
		fi
	done
fi
############################################################

#################### Configure container ###################
if [ -e "${DESTINATION}/.configure.rc" ] && [ ! -e "${DESTINATION}/${CONTAINER_ROOT}/.configured" ]; then # configure only if it is first boot
cat > "${DESTINATION}/${CONTAINER_ROOT}/mnt/.start-${CONTAINER_NAME}.sh" << EOF
#!/bin/sh
	echo pid \$$ >> /.debug.txt
		echo -n \$$ > /.start-${CONTAINER_NAME}.sh.pid
EOF

cat "${DESTINATION}/.configure.rc" >> ${DESTINATION}/${CONTAINER_ROOT}/mnt/.start-${CONTAINER_NAME}.sh

cat >> "${DESTINATION}/${CONTAINER_ROOT}/mnt/.start-${CONTAINER_NAME}.sh" << EOF
	echo rmpid >> /.debug.txt
		rm /.start-${CONTAINER_NAME}.sh.pid
exit 0
EOF

chmod 755 "${DESTINATION}/${CONTAINER_ROOT}/mnt/.start-${CONTAINER_NAME}.sh"
chroot "${DESTINATION}/${CONTAINER_ROOT}/mnt" "/.start-${CONTAINER_NAME}.sh"
echo -n '' > "${DESTINATION}/${CONTAINER_ROOT}/.configured"

fi

if [ -e "${DESTINATION}/service.sh" ] && [ ! "${CONTAINER_SERVICES}" = '' ]; then
	echo 'Stopping services...'
	${DESTINATION}/service.sh stop
fi
############################################################

#################### Secure container ######################
if [ ! "${REMOVE_SYSTEM_MOUNTPOINTS}" = '' ]; then
	echo 'Removing system mountpoints...'
	for i_remove_mountpoint in ${REMOVE_SYSTEM_MOUNTPOINTS}; do
		umount "${DESTINATION}/${CONTAINER_ROOT}/mnt/${i_remove_mountpoint}"
	done
	unset i_remove_mountpoint
fi
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
			[ ! -e "${bindDestination}" ] && mkdir -p "${bindDestination}"
			bindDirectory "${bindSource}" "${bindDestination}"
		fi
	done
fi
unset bindDirectory
############################################################

#################### Configure services ####################
if [ -d "${DESTINATION}/.config" ]; then
	echo 'Configuring services...'
	cp -rfp ${DESTINATION}/.config/* "${DESTINATION}/${CONTAINER_ROOT}/mnt"
else
	if [ ! "${CONFIG_TARBALLS}" = '' ]; then
		echo 'Configuring services...'
		for configTarball in ${CONFIG_TARBALLS}; do
			if [ -e "${DESTINATION}/${configTarball}" ]; then
				tar xf "${DESTINATION}/${configTarball}" -C "${DESTINATION}/${CONTAINER_ROOT}/mnt"
			else
				echo " ${DESTINATION}/${configTarball} not exists"
			fi
		done
		unset configTarball
	fi
fi
############################################################

#################### Start services ########################
if [ ! "${CONTAINER_AUTOSTART_SERVICES}" = '' ] && [ -e "${DESTINATION}/service.sh" ]; then
	echo 'Starting services...'
	${DESTINATION}/service.sh autostart
fi
###########################################################

logger --tag containers container ${CONTAINER_NAME} started
[ -e "${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid" ] && rm "${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid" # remove start.sh PID
exit 0
