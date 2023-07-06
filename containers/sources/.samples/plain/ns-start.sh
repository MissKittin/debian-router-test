#!/bin/sh
#################### Config ################################
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
if [ ! "$$" = '1' ]; then
	if [ ! "$(whoami)" = 'root' ]; then
		echo 'No superuser'
		exit 1
	fi
	if [ ! -x "${DESTINATION}/start.sh" ]; then
		echo 'start.sh not exists nor executable'
		exit 1
	fi
	if [ ! -x "${DESTINATION}/stop.sh" ]; then
		echo 'stop.sh not exists nor executable'
		exit 1
	fi
	if [ ! -e "${DESTINATION}/${CONTAINER_ROOT}-ns" ]; then
		echo "${CONTAINER_ROOT}-ns directory not exists"
		exit 1
	fi
	if mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}-ns" > /dev/null 2>&1; then
		echo 'Container started (ns)'
		exit 1
	fi
fi
############################################################

#################### Start container #######################
if [ ! "$$" = '1' ]; then
	echo 'Starting container (ns)...'

	mount -t tmpfs -o nosuid,nodev,noexec,noatime,nodiratime,mode=0700 "${MOUNT_LABEL}-ns" "${DESTINATION}/${CONTAINER_ROOT}-ns"
	mount --make-private "${DESTINATION}/${CONTAINER_ROOT}-ns"

	echo -n '' > "${DESTINATION}/${CONTAINER_ROOT}-ns/ns-mount"
	echo -n '' > "${DESTINATION}/${CONTAINER_ROOT}-ns/ns-pid"
	echo -n '' > "${DESTINATION}/${CONTAINER_ROOT}-ns/ns-ipc"

	start-stop-daemon \
		--start \
		--quiet \
		--background \
		--make-pidfile --pidfile "${DESTINATION}/${CONTAINER_ROOT}-ns/container.pid" \
		--exec $(which unshare) -- \
			--pid="$(realpath "${DESTINATION}")/${CONTAINER_ROOT}-ns/ns-pid" \
			--mount="$(realpath "${DESTINATION}")/${CONTAINER_ROOT}-ns/ns-mount" \
			--ipc="$(realpath "${DESTINATION}")/${CONTAINER_ROOT}-ns/ns-ipc" \
			--fork --mount-proc \
			"$(realpath "${0}")" ${@}
	exit "$?"
fi

"${DESTINATION}/start.sh" ${@}

mkfifo "${DESTINATION}/${CONTAINER_ROOT}-ns/container.stop"
chmod 600 "${DESTINATION}/${CONTAINER_ROOT}-ns/container.stop"
IFS='' read sleep < "${DESTINATION}/${CONTAINER_ROOT}-ns/container.stop"

"${DESTINATION}/stop.sh"
echo '' > "${DESTINATION}/${CONTAINER_ROOT}-ns/container.stop"
############################################################

exit 0
