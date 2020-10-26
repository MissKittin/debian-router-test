#!/bin/sh
#################### Check environment #####################
if [ ! "`whoami`" = 'root' ]; then
	echo 'No superuser'
	exit 1
fi
############################################################

[ -e "${DESTINATION}/../.bin" ] && PATH="${PATH}:${DESTINATION}/../.bin"
case $1 in
	'start')
		if lsmod | grep kvm_amd > /dev/null 2>&1; then
			echo 'KVM already loaded'
			exit 1
		fi
		modprobe kvm_amd
	;;
	'status')
		if lsmod | grep kvm_amd > /dev/null 2>&1; then
			echo 'KVM loaded'
			exit 0
		fi
		echo 'KVM not loaded'
		exit 1
	;;
	'stop')
		if ! lsmod | grep kvm_amd > /dev/null 2>&1; then
			echo 'KVM already not loaded'
			exit 1
		fi
		for i in kvm_amd kvm irqbypass ccp; do
			rmmod $i
		done
	;;
	*)
		echo 'start|status|stop'
	;;
esac

exit 0
