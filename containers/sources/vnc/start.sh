#!/bin/sh
#################### Config ################################
CONTAINER_NAME='vnc'
DESTINATION=$(dirname $0)
MOUNT_LABEL="${CONTAINER_NAME}"
CONTAINER_ROOT='.container'
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
cat > ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-vnc.sh << EOF
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
		apt-get clean
		apt-get install -y tightvncserver xfonts-base >> /tmp/.debug.txt 2>&1
		apt-get install -y xterm icewm rox-filer >> /tmp/.debug.txt 2>&1
	# debug tool
	#	apt-get install -y strace
	echo clean >> /tmp/.debug.txt
		echo Cleaning apt...
		apt-get clean
	echo config >> /tmp/.debug.txt
		echo Configuring user...
			ln -s /home/user/.Xauthority /home/root/.Xauthority # allow X11 programs from root
			echo '#!/bin/sh' > /tmp/.configure-user.sh
			echo 'cd' >> /tmp/.configure-user.sh
			echo 'mkdir ./.vnc' >> /tmp/.configure-user.sh
			echo 'cat << EOOOF > ./.vnc/xstartup' >> /tmp/.configure-user.sh
			echo '#!/bin/sh' >> /tmp/.configure-user.sh
			echo '' >> /tmp/.configure-user.sh
			echo 'xrdb \$HOME/.Xresources' >> /tmp/.configure-user.sh
			echo 'xsetroot -solid grey' >> /tmp/.configure-user.sh
			echo '#x-terminal-emulator -geometry 80x24+10+10 -ls -title "\$VNCDESKTOP Desktop" &' >> /tmp/.configure-user.sh
			echo '#x-window-manager &' >> /tmp/.configure-user.sh
			echo '# Fix to make GNOME work' >> /tmp/.configure-user.sh
			echo 'export XKL_XMODMAP_DISABLE=1' >> /tmp/.configure-user.sh
			echo '/etc/X11/Xsession' >> /tmp/.configure-user.sh
			echo 'EOOOF' >> /tmp/.configure-user.sh
			echo 'chmod 755 ./.vnc/xstartup' >> /tmp/.configure-user.sh
			echo 'echo "cd" >> ./.vnc/xstartup' >> /tmp/.configure-user.sh
			echo 'sed -i "s\/etc/X11/Xsession\#/etc/X11/Xsession\g" ./.vnc/xstartup' >> /tmp/.configure-user.sh
			echo 'echo ""' >> /tmp/.configure-user.sh
			echo 'echo "icewm-session" >> ./.vnc/xstartup' >> /tmp/.configure-user.sh
			echo 'echo -n "Set VNC password: "' >> /tmp/.configure-user.sh
			echo 'vncpasswd' >> /tmp/.configure-user.sh
			echo 'exit 0' >> /tmp/.configure-user.sh
		chmod 755 /tmp/.configure-user.sh
		su user -c /tmp/.configure-user.sh
		rm /tmp/.configure-user.sh
	echo rmpid >> /tmp/.debug.txt
		rm /tmp/.start-${CONTAINER_NAME}.sh.pid
	echo stop >> /tmp/.debug.txt
exit 0
EOF
chmod 755 ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-vnc.sh
chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt /tmp/.start-vnc.sh
rm ${DESTINATION}/${CONTAINER_ROOT}/mnt/tmp/.start-vnc.sh
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

#################### Configure desktop #####################
echo 'Configuring desktop...'
[ -e ${DESTINATION}/.config.tar.gz ] && tar xf ${DESTINATION}/.config.tar.gz -C ${DESTINATION}/${CONTAINER_ROOT}/mnt
############################################################

logger --tag containers container ${CONTAINER_NAME} started
rm ${DESTINATION}/${CONTAINER_ROOT}/.start.sh.pid # remove start.sh PID
exit 0
