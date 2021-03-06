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
if [ ! -e "${DESTINATION}/${CONTAINER_ROOT}" ]; then
	echo 'Wrong configuration'
	exit 1
fi
if "${CONTAINER_ON_RAM}"; then
	if ! mountpoint -q "${DESTINATION}/${CONTAINER_ROOT}/mnt" > /dev/null 2>&1; then
		echo 'Container stopped'
		exit 1
	fi
fi
############################################################

if [ "$(whoami)" = 'root' ]; then
	remove_first_arg() { local skip='true'; local i; for i in $@; do "${skip}" && skip='false' || echo -n "${i} "; done; }
	HOME="${1}"
	[ ! -e "./.container/mnt/root/.Xauthority" ] && cp "${HOME}/.Xauthority" "./.container/mnt/root/.Xauthority"
echo $2
	export HOME='/root'; export XAUTHORITY='/root/.Xauthority'
	chroot "./.container/mnt" qemu-system-x86_64 $(remove_first_arg ${@})	
else
	sudo "${0}" "${HOME}" "${@}"
fi

exit 0
