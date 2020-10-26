#!/bin/sh
# hdparm autospindown
# 24.09.2020

INSTALL_DIR='/usr/local'

echo ' i Importing settings'
. ${INSTALL_DIR}/etc/hdd-autospindown.rc

if ! ${ENABLED}; then
	echo ' ! Autospindown is disabled in settings'
	exit 1
fi

for i in ${INSTALL_DIR}/etc/hdd-autospindown.d/*.rc; do
	if [ "${i}" = "${INSTALL_DIR}/etc/hdd-autospindown.d/*.rc" ]; then
		echo ' ! Config dir is empty'
	else
		echo " i Imporing ${i}"
		. ${i}

		if [ ! "${TIME}" = '' ] && [ ! "${DRIVE}" = '' ]; then
			echo " i Running hdparm for ${DRIVE}"
			${hdparm} -S ${TIME} ${DRIVE}
		else
			echo " ! Configuration for ${i} is invalid"
		fi

		unset TIME
		unset DRIVE
	fi
done

echo ' i The End'
exit 0
