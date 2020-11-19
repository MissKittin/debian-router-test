#!/bin/sh
#################### Config - container ####################
#CONTAINER_NAME='corelinux'
#DESTINATION=$(dirname "$(readlink -f ${0})") # Must be absolute path
#MOUNT_LABEL="${CONTAINER_NAME}"
#CONTAINER_ROOT='.container'
#################### Config - build ########################
#mirror='http://tinycorelinux.net'
#version='10.x'
#
## 32bit version
##arch='x86'
##image_name='Core-current.iso'
##rootfs_image_name='core.gz'
#
## 64bit version
#arch='x86_64'
#image_name='CorePure64-current.iso'
#rootfs_image_name='corepure64.gz'
#################### Config ################################
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
echo -n Waiting for network...
PING_HOST='http://ftp.debian.org/'
while ! wget -q --tries=10 --timeout=20 --spider $PING_HOST; do
	sleep 1
	echo -n .
done
echo 

echo 'Starting container (1/2)...'
pwd=$(pwd)
mount -t tmpfs -o noatime,nodiratime,mode=0755 ${MOUNT_LABEL} ${DESTINATION}/${CONTAINER_ROOT}
echo -n "$$" > ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # save start.sh PID
cd ${DESTINATION}/${CONTAINER_ROOT}

echo 'Downloading core image...'
wget ${mirror}/${version}/${arch}/release/${image_name} > /dev/null 2>&1

echo 'Unpacking image...'
mkdir ${DESTINATION}/${CONTAINER_ROOT}/iso; mount -o loop ${DESTINATION}/${CONTAINER_ROOT}/${image_name} ${DESTINATION}/${CONTAINER_ROOT}/iso > /dev/null 2>&1
cp ${DESTINATION}/${CONTAINER_ROOT}/iso/boot/${rootfs_image_name} ${DESTINATION}/${CONTAINER_ROOT}/${rootfs_image_name}
umount ${DESTINATION}/${CONTAINER_ROOT}/iso; rmdir ${DESTINATION}/${CONTAINER_ROOT}/iso
rm ${DESTINATION}/${CONTAINER_ROOT}/${image_name}
zcat ${DESTINATION}/${CONTAINER_ROOT}/${rootfs_image_name} | cpio -id --no-absolute-filenames > /dev/null 2>&1
rm ${DESTINATION}/${CONTAINER_ROOT}/${rootfs_image_name}

echo 'Starting container (2/2)...'
for i in dev dev/pts proc sys; do
	mount --bind /${i} ${DESTINATION}/${CONTAINER_ROOT}/${i}
done
############################################################

#################### Configure distro ######################
echo 'Copying DNS config...'
cd $pwd
echo -n '' > ${DESTINATION}/${CONTAINER_ROOT}/etc/fstab
cat /etc/resolv.conf > ${DESTINATION}/${CONTAINER_ROOT}/etc/resolv.conf

###########################
#echo 'Configuring core linux...'
#echo 'tc' > ${DESTINATION}/${CONTAINER_ROOT}/etc/sysconfig/tcuser
#mkdir -p ${DESTINATION}/${CONTAINER_ROOT}/home/tc
#
## chown, chgrp ids from /etc/passwd and /etc/group
#[ -d "${DESTINATION}/${CONTAINER_ROOT}/usr/local/tce.installed" ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/usr/local/tce.installed
#[ -d "${DESTINATION}/${CONTAINER_ROOT}/tmp/tce" ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce
#[ -d "${DESTINATION}/${CONTAINER_ROOT}/tmp/tce/optional" ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce/optional
#[ -d "${DESTINATION}/${CONTAINER_ROOT}/tmp/tcloop" ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/tmp/tcloop
#ln -sf /tmp/tce ${DESTINATION}/${CONTAINER_ROOT}/etc/sysconfig/tcedir
#chown 1001 ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce/optional
#chgrp 50 ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce/optional ${DESTINATION}/${CONTAINER_ROOT}/usr/local/tce.installed ${DESTINATION}/${CONTAINER_ROOT}/tmp/tcloop
#chmod g+w ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce ${DESTINATION}/${CONTAINER_ROOT}/tmp/tce/optional ${DESTINATION}/${CONTAINER_ROOT}/usr/local/tce.installed ${DESTINATION}/${CONTAINER_ROOT}/tmp/tcloop
#
#chmod u+s ${DESTINATION}/${CONTAINER_ROOT}/bin/busybox.suid ${DESTINATION}/${CONTAINER_ROOT}/usr/bin/sudo
#chroot ${DESTINATION}/${CONTAINER_ROOT} /sbin/ldconfig 2>/dev/null
###########################

echo 'Configuring core linux...'
cat << EOF > ${DESTINATION}/${CONTAINER_ROOT}/setup.sh
#!/bin/sh
	echo -n \$$ > /.start-${CONTAINER_NAME}.sh.pid

	. /etc/init.d/tc-functions

	USER="tc"
	TCEDIR="/tmp/tce"
	TCEOPT="/tmp/tce/optional"
	TCLOOP="/tmp/tcloop"
	TCEINSTALLED="/usr/local/tce.installed"
	VERSION="\$(cat /usr/share/doc/tc/release.txt)"
	LANGUAGE="C" # force

	echo "LANG=\$LANGUAGE" > /etc/sysconfig/language

	echo "\$USER" > /etc/sysconfig/tcuser
	mkdir -p /home/"\$USER"

	[ -d "\$TCEINSTALLED" ] || mkdir "\$TCEINSTALLED"
	[ -d "\$TCEDIR" ] || mkdir "\$TCEDIR"
	[ -d "\$TCEOPT" ] || mkdir "\$TCEOPT"
	[ -d "\$TCLOOP" ] || mkdir "\$TCLOOP"
	ln -sf "\$TCEDIR" /etc/sysconfig/tcedir
	chown "\$USER" "\$TCEOPT"
	chgrp staff "\$TCEDIR" "\$TCEOPT" "\$TCEINSTALLED" "\$TCLOOP"
	chmod g+w "\$TCEDIR" "\$TCEOPT" "\$TCEINSTALLED" "\$TCLOOP"

	chmod u+s /bin/busybox.suid /usr/bin/sudo

	[ -e \${TCEDIR}/onboot.lst ] && su \${USER} -c "tce-load -i \$(cat \${TCEDIR}/onboot.lst | xargs)" > /dev/null 2>&1

	# Delete unnecessary files
	rm -r -f ./etc/udev
	rm -r -f ./lib/modules/*
	rm -r -f ./lib/udev
	rm ./sbin/e2fsck; rm ./sbin/fsck*
	rm ./sbin/loadcpufreq
	rm ./sbin/mke2fs; rm ./sbin/mkfs*; rm ./sbin/tune2fs
	rm ./sbin/pccardctl; rm ./sbin/lspcmcia
	rm -r -f ./usr/share/syslinux
	rm ./init
	rm ./linuxrc

	/sbin/ldconfig 2>/dev/null

	setupHome

	rm /.start-${CONTAINER_NAME}.sh.pid
exit 0
EOF
chmod 755 ${DESTINATION}/${CONTAINER_ROOT}/setup.sh
chroot ${DESTINATION}/${CONTAINER_ROOT} /setup.sh
rm ${DESTINATION}/${CONTAINER_ROOT}/setup.sh
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

logger --tag containers container ${CONTAINER_NAME} started
rm ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # remove start.sh PID
exit 0
