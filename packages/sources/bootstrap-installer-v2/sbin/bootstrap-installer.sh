#!/bin/bash
# debian bootstrap automated installer
# 20.08.2020, 12-15.10.2020
# v2 23-28.10.2020

SHARE_DIR='/usr/local/share/bootstrap-installer'
PATH_TO_ROOT='.'

# Check if I am root
if [ ! "$(whoami)" = 'root' ]; then
	echo 'I am not root'
	exit 1
fi

# Execute tasks in chroot
if [ "${1}" = 'in-chroot' ]; then
	for inChroot in ${SHARE_DIR}/in-chroot.d/S*.rc; do
		if [ "${inChroot}" = "${SHARE_DIR}/in-chroot.d/S*.rc" ]; then
			echo 'bootstrap-installer.sh in-chroot error'
			exit 1
		fi
		. ${inChroot}
	done
	exit 0
fi

# Check if I am in the new root directory
if [ "$(pwd)" = '/' ]; then
	echo 'execute bootstrap-installer.sh in new OS mountpoint'
	exit 1
fi
if [ ! -e ".${SHARE_DIR}" ]; then
	echo 'execute bootstrap-installer.sh in new OS mountpoint'
	exit 1
fi
for dir in bin boot etc sbin usr var; do
	if [ ! -d "./${dir}" ]; then
		echo 'execute bootstrap-installer.sh in new OS mountpoint'
		exit 1
	fi
done
for dir in dev proc sys; do
	if mountpoint -q "./${dir}"; then
		echo 'execute bootstrap-installer.sh in new OS mountpoint'
		exit 1
	fi
done
unset dir

# Execute tasks before chrooting
for preChroot in ${PATH_TO_ROOT}${SHARE_DIR}/pre-chroot.d/S*.rc; do
	if [ "${preChroot}" = "${PATH_TO_ROOT}${SHARE_DIR}/pre-chroot.d/S*.rc" ]; then
		echo 'bootstrap-installer.sh preChroot error'
		exit 1
	fi
	. ${preChroot}
done

# Chroot and execute tasks
chroot . /usr/local/sbin/bootstrap-installer.sh in-chroot ${in_chroot_params}

# Execute tasks after chrooting
for postChroot in ${PATH_TO_ROOT}${SHARE_DIR}/post-chroot.d/S*.rc; do
	if [ "${postChroot}" = "${PATH_TO_ROOT}${SHARE_DIR}/postChroot/S*.rc" ]; then
		echo 'bootstrap-installer.sh postChroot error'
		exit 1
	fi
	. ${postChroot}
done

exit 0
