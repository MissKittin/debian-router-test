#!/bin/sh
#################### Config ################################
VM_NAME='plain'
DESTINATION=$(dirname $0)
#DESTINATION="/home/user_files/vms/${VM_NAME}"
QEMU_WORKSPACE="/tmp/vm_${VM_NAME}"
############################################################

#################### Check environment #####################
if [ ! -e ${DESTINATION} ]; then
	echo 'Wrong configuration'
	exit 1
fi
if [ ! -e ${QEMU_WORKSPACE}/.qemu.ind ]; then
	echo 'Virtual machine stopped'
	exit 1
fi
############################################################

case $1 in
	'power')
		echo -n 'Sending power button signal... '
		echo 'system_powerdown' | ${DESTINATION}/../.bin/telnet 127.0.0.1 1234 > /dev/null 2>&1
		echo '[ OK ]'
	;;
	*)
		echo 'button.sh power'
	;;
esac

exit 0
