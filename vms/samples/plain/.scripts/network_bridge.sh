#!/bin/sh
/usr/local/sbin/firewall.sh where-are-you > /dev/null 2>&1 && . $(/usr/local/sbin/firewall.sh where-are-you)/networks.rc
#################### Config ################################
DESTINATION=$2
BRIDGE_NAME=${LAN}
VM_IFACE_NAME='vm-test'
############################################################

#################### Check environment #####################
if [ ! "`whoami`" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
if [ ! -e ${DESTINATION} ]; then
	echo 'Wrong configuration'
	exit 1
fi
############################################################

[ -e "${DESTINATION}/../.bin" ] && PATH="${PATH}:${DESTINATION}/../.bin"
case $1 in
	'start')
		if ifconfig ${VM_IFACE_NAME} > /dev/null 2>&1; then
			echo 'Network already configured'
			exit 1
		fi
		tunctl -t ${VM_IFACE_NAME} > /dev/null 2>&1
		brctl addif ${BRIDGE_NAME} ${VM_IFACE_NAME}
		ifconfig ${VM_IFACE_NAME} up
	;;
	'status')
		if ifconfig ${VM_IFACE_NAME} > /dev/null 2>&1; then
			echo 'Network configured'
			exit 0
		fi
		echo 'Network not configured'
		exit 1
	;;
	'stop')
		if ! ifconfig ${VM_IFACE_NAME} > /dev/null 2>&1; then
			echo 'Network already not configured'
			exit 1
		fi
		ifconfig ${VM_IFACE_NAME} down
		brctl delif ${BRIDGE_NAME} ${VM_IFACE_NAME}
		tunctl -d ${VM_IFACE_NAME} > /dev/null 2>&1
	;;
	'iface')
		echo -n ${VM_IFACE_NAME}
	;;
	*)
		echo 'start|status|stop'
	;;
esac

exit 0
