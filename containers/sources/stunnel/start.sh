#!/bin/sh
#################### Config ################################
#CONTAINER_NAME='stunnel'
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
if [ "${1}" = 'generate-certificate' ] && [ "${2}" = '' ]; then
	echo 'usage: generate-certificate hostname.domain'
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
if [ ! -e ${DESTINATION}/${CONTAINER_ROOT}/.configured ]; then # configure only if it is first boot
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-${CONTAINER_NAME}.sh << EOF
#!/bin/sh
	echo pid \$$ >> /tmp/.debug.txt
		echo -n \$$ > /tmp/.start-${CONTAINER_NAME}.sh.pid
	echo start > /tmp/.debug.txt

		echo -n Waiting for network...
		PING_HOST='http://ftp.debian.org/'
		while ! wget -q --tries=10 --timeout=20 --spider \$PING_HOST; do
			sleep 1
			echo sleep >> /tmp/.debug.txt
			echo -n .
		done
		echo .
	echo update > /tmp/.debug.txt
		echo Updating apt database...
		apt-get update >> /tmp/.debug.txt
	echo install >> /tmp/.debug.txt
		echo Installing packages...
		apt-get install -y stunnel4 >> /tmp/.debug.txt 2>&1
	# debug tool
	#	apt-get install -y strace
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

echo -n '' > ${DESTINATION}/${CONTAINER_ROOT}/.configured
fi
############################################################

#################### Bind directories ######################
#if [ -e "${DESTINATION}/.ssl" ]; then
#	echo 'Mounting certificates directory...'
#	[ -e "${DESTINATION}/${CONTAINER_ROOT}/mnt/ssl" ] || mkdir ${DESTINATION}/${CONTAINER_ROOT}/mnt/ssl
#	mount --bind ${DESTINATION}/.ssl ${DESTINATION}/${CONTAINER_ROOT}/mnt/ssl
#fi
#mount --bind /tmp ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp

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

#################### Generate certificate ##################
if [ "${1}" = 'generate-certificate' ]; then
echo 'Generating certificates...'
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/generate-certificate.sh << EOF
#!/bin/sh
[ -e '/ssl' ] || mkdir /ssl
cd /ssl

# CA
openssl genrsa -out ./rootCA.key 2048
openssl req -x509 -new -nodes -key ./rootCA.key -sha256 -days 36500 -out ./rootCA.pem -subj '/CN=${2}/O=${2}/OU=${2}'

# Server - config
echo 'authorityKeyIdentifier=keyid,issuer' > /v3.ext
echo 'basicConstraints=CA:FALSE' >> /v3.ext
echo 'keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment' >> /v3.ext
echo 'subjectAltName = @alt_names' >> /v3.ext
echo '' >> /v3.ext
echo '[alt_names]' >> /v3.ext
echo "DNS.1 = ${2}" >> /v3.ext

# Server - certificate
openssl req -new -newkey rsa:2048 -nodes -keyout ./server.key -subj '/C=SE/ST=None/L=NB/O=${2}/CN=${2}' -out ./server.csr
openssl x509 -req -in ./server.csr -CA ./rootCA.pem -CAkey ./rootCA.key -CAcreateserial -out ./server.crt -days 36500 -sha256 -extfile /v3.ext

# key+certificate for stunnel
cat ./server.key ./server.crt > ./server.pem
chmod 600 ./server.pem

# remove config
rm /v3.ext

echo ' ! send /ssl/rootCA.pem to the client'
echo ' ! copy rootCA.pem and server.pem from the /ssl directory'
echo ' ! point to /ssl/server.pem in stunnel config file'
exit 0
EOF
chmod 755 ${DESTINATION}/${CONTAINER_ROOT}/mnt/generate-certificate.sh
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /generate-certificate.sh
rm ${DESTINATION}/${CONTAINER_ROOT}/mnt/generate-certificate.sh
fi
############################################################

#################### Secure container ######################
echo 'Removing system mountpoints...'
for i in proc sys; do
	umount ${DESTINATION}/${CONTAINER_ROOT}/mnt/${i}
done
############################################################

#################### Configure service #####################
echo 'Configuring service...'
[ -e ${DESTINATION}/.config.tar.gz ] && tar xf ${DESTINATION}/.config.tar.gz -C ${DESTINATION}/${CONTAINER_ROOT}/mnt
############################################################

#################### Strip container #######################
if [ "$1" = 'strip' ] && [ -e ${DESTINATION}/${CONTAINER_ROOT}/diff ] && [ ! -e ${DESTINATION}/${CONTAINER_ROOT}/.configured ]; then
	echo 'Removing unnecessary files...'
	# etc
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/init.d/.depend.boot
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/init.d/.depend.start
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/init.d/.depend.stop
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/logrotate.d
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/ppp
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/rc*.d
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/.pwd.lock
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/group-
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/gshadow-
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/passwd-
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/etc/shadow-
	
	# usr
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/usr/share

	# var
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/cache
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/lib/apt
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/lib/dpkg
	rm -r -f ${DESTINATION}/${CONTAINER_ROOT}/diff/var/log/apt
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/var/log/dpkg.log
	rm ${DESTINATION}/${CONTAINER_ROOT}/diff/var/log/lastlog

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
###########################################################

logger --tag containers container ${CONTAINER_NAME} started
[ -e ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid ] && rm ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # remove start.sh PID
exit 0
