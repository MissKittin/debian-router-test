#!/bin/sh
# TUT: https://wiki.alpinelinux.org/wiki/Alpine_Linux_in_a_chroot

#################### Config - container ####################
#CONTAINER_NAME='alpine'
#DESTINATION=$(dirname $0)
#MOUNT_LABEL="${CONTAINER_NAME}"
#CONTAINER_ROOT='.container'
#################### Config - build ########################
#mirror='http://dl-cdn.alpinelinux.org/alpine'
#arch='x86_64'
#alpine_version='latest-stable'
##apk_version='2.10.5-r0' # force version
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
mkdir ${DESTINATION}/${CONTAINER_ROOT}/build
cd ${DESTINATION}/${CONTAINER_ROOT}/build

echo 'Downloading build tool...'
[ "$apk_version" = '' ] && apk_version=$(wget -O- -q http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/x86_64 | grep -o 'href="apk-tools-static-[^"]*' | sed -E -e 's/href="apk-tools-static-|.apk//g')
wget ${mirror}/${alpine_version}/main/${arch}/apk-tools-static-${apk_version}.apk > /dev/null 2>&1
tar xzf apk-tools-static-${apk_version}.apk > /dev/null 2>&1
rm apk-tools-static-${apk_version}.apk

echo 'Copying DNS config...'
cd $pwd
mkdir ${DESTINATION}/${CONTAINER_ROOT}/etc
cat /etc/resolv.conf > ${DESTINATION}/${CONTAINER_ROOT}/etc/resolv.conf

echo 'Downloading alpine linux...'
chroot ${DESTINATION}/${CONTAINER_ROOT} /build/sbin/apk.static -X ${mirror}/latest-stable/main -U --allow-untrusted --root . --initdb --no-cache add alpine-base > /dev/null 2>&1

echo 'Configuring alpine linux...'
echo '# added by start.sh' > ${DESTINATION}/${CONTAINER_ROOT}/etc/apk/repositories
echo "${mirror}/${alpine_version}/main" >> ${DESTINATION}/${CONTAINER_ROOT}/etc/apk/repositories

echo 'Starting container (2/2)...'
rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/build
for i in dev dev/pts proc sys; do
	mount --bind /${i} ${DESTINATION}/${CONTAINER_ROOT}/${i}
done
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
