#!/bin/sh
#################### Config ################################
VM_NAME='plain'
DESTINATION=$(dirname $0)
#DESTINATION="/home/user_files/vms/${VM_NAME}"
QEMU_USER='user'

# Hard drive
QEMU_HDD="${DESTINATION}/hdd/hdd.qcow2" # 'hdd' dir created in 'Setup HDD image' section
QEMU_HDD_SIZE='7010M'
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

#################### Startup scripts #######################
loaded_kvm=false;	${DESTINATION}/.scripts/kvm_amd.sh start ${DESTINATION} > /dev/null 2>&1	&& loaded_kvm=true
loaded_sound=false;	${DESTINATION}/.scripts/sound_dummy.sh start ${DESTINATION} > /dev/null 2>&1	&& loaded_sound=true
loaded_network=false;	${DESTINATION}/.scripts/network_bridge.sh start ${DESTINATION} > /dev/null 2>&1	&& loaded_network=true; network_iface=$(${DESTINATION}/.scripts/network_bridge.sh iface ${DESTINATION}) # only net needs ${DESTINATION}
############################################################

#################### Setup HDD image #######################
echo -n 'Setup HDD image (y/[n])? '
read answer
if [ "${answer}" = 'y' ]; then
	if [ ! -e ${DESTINATION}/hdd ]; then
		mkdir ${DESTINATION}/hdd
		chown ${QEMU_USER} ${DESTINATION}/hdd
	fi
	qemu-img create -f qcow2 ${QEMU_HDD} ${QEMU_HDD_SIZE}
	chown ${QEMU_USER} ${QEMU_HDD}
fi
############################################################

#################### Start qemu ############################
qemu-system-x86_64 \
	-cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -smp $(nproc),sockets=1,cores=$(nproc),threads=1 \
	-object iothread,id=iothread1 -device virtio-scsi-pci,id=scsi1,iothread=iothread1 -drive if=none,id=hd1,file=${QEMU_HDD},format=qcow2,aio=threads,cache=none -device scsi-hd,bus=scsi1.0,drive=hd1,bootindex=1 \
	-fda ${DESTINATION}/../.drivers/virtio-win-0.1.141_x86.vfd \
	-net none \
	-enable-kvm \
	-mem-prealloc -m 2G \
	-localtime \
	-vga std \
	-runas ${QEMU_USER} $@
############################################################

#################### Shutdown scripts ######################
${loaded_kvm}		&& ${DESTINATION}/.scripts/kvm_amd.sh stop ${DESTINATION} > /dev/null 2>&1
${loaded_sound}		&& ${DESTINATION}/.scripts/sound_dummy.sh stop ${DESTINATION} > /dev/null 2>&1
${loaded_network}	&& ${DESTINATION}/.scripts/network_bridge.sh stop ${DESTINATION} > /dev/null 2>&1
############################################################

exit 0
