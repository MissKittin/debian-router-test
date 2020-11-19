#!/bin/sh
#################### Config ################################
VM_NAME='plain'
DESTINATION=$(dirname $0)
#DESTINATION="/home/user_files/vms/${VM_NAME}"
QEMU_WORKSPACE='/tmp/vm_${VM_NAME}'
# More config in start.sh
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
if [ -e ${QEMU_WORKSPACE}/.qemu.ind ] && [ ! "$1" = 'status' ]; then
	echo 'Virtual machine already started'
	exit 1
fi
############################################################

#################### Get status ############################
[ "$1" = 'status' ] && exec ${DESTINATION}/start.sh status
############################################################

#################### Print info ############################
${DESTINATION}/start.sh print-info
echo ' Starting daemon...'
############################################################

#################### Start daemon ##########################
nohup ${DESTINATION}/start.sh $@ > /dev/null 2>&1 &
############################################################

logger --tag vms virtual machine ${CONTAINER_NAME} started
exit 0
