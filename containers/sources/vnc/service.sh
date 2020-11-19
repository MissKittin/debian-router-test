#!/bin/sh
#################### Config ################################
CONTAINER_NAME='vnc'
DESTINATION=$(dirname $0)
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
if ! mountpoint -q ${DESTINATION}/${CONTAINER_ROOT} > /dev/null 2>&1; then
	echo 'Container stopped'
	exit 1
fi
############################################################

case $1 in
	'start')
		echo -n 'X server geometry (WxH): '
		read geometry
		# iptables -A INPUT -i br0 -p TCP --dport 5901 -j ACCEPT
		chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt su user -c 'vncserver -geometry '"${geometry}"' :1'
	;;
	'stop')
		# iptables -D INPUT -i br0 -p TCP --dport 5901 -j ACCEPT
		chroot ${DESTINATION}/${CONTAINER_ROOT}/mnt su user -c 'vncserver -kill :1'
	;;
esac

exit 0
