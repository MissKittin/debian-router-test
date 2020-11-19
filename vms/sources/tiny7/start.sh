#!/bin/sh
#################### Config ################################
VM_NAME='tiny7'
DESTINATION=$(dirname $0)
VNC_PASSWORD='yourvncpassword'
VNC_PORT='1' # 590?
QEMU_WORKSPACE="/tmp/vm_${VM_NAME}"
QEMU_MONITOR_PORT='1234' # telnet
QEMU_USER='user'

# Hard drive
if [ -e "${DESTINATION}/hdd/tiny7-snapshot.qcow2" ]; then 
	QEMU_HDD="${DESTINATION}/hdd/tiny7-snapshot.qcow2"
elif [ -e "${DESTINATION}/hdd/tiny7-configured.qcow2" ]; then
	QEMU_HDD="${DESTINATION}/hdd/tiny7-configured.qcow2"
else
	QEMU_HDD="${DESTINATION}/hdd/tiny7.qcow2"
fi
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

#################### Print status ##########################
if [ "$1" = 'status' ]; then
	if [ -e ${QEMU_WORKSPACE}/.qemu.ind ]; then
		echo 'Virtual machine already started'
		exit 0
	fi
	echo 'Virtual machine stopped'
	exit 1
fi
############################################################

#################### Print info ############################
echo ' VNC port: 590'"${VNC_PORT}"
echo ' VNC password: '"${VNC_PASSWORD}"
echo ' QEMU monitor: ../.bin/telnet 127.0.0.1 '"${QEMU_MONITOR_PORT}"
echo ' QEMU vvfat: '"${QEMU_WORKSPACE}"'/qemu-vvfat'
echo ' QEMU log: '"${QEMU_WORKSPACE}"'/qemu.log'
[ "$1" = 'print-info' ] && exit 0
############################################################

#################### Startup scripts #######################
loaded_kvm=false;	${DESTINATION}/.scripts/kvm_amd.sh start ${DESTINATION} > /dev/null 2>&1	&& loaded_kvm=true
loaded_sound=false;	${DESTINATION}/.scripts/sound_dummy.sh start ${DESTINATION} > /dev/null 2>&1	&& loaded_sound=true;	. ${DESTINATION}/.scripts/alsa_parameters.rc
loaded_network=false;	${DESTINATION}/.scripts/network_bridge.sh start ${DESTINATION} > /dev/null 2>&1	&& loaded_network=true;	network_iface=$(${DESTINATION}/.scripts/network_bridge.sh iface ${DESTINATION}) # only net needs ${DESTINATION}
############################################################

#################### Start qemu ############################
[ -e ${QEMU_WORKSPACE} ] || mkdir ${QEMU_WORKSPACE}; touch ${QEMU_WORKSPACE}/.qemu.ind
[ -e ${QEMU_WORKSPACE}/qemu-vvfat ] || mkdir ${QEMU_WORKSPACE}/qemu-vvfat; chown ${QEMU_USER} ${QEMU_WORKSPACE}/qemu-vvfat

cmd_hdd="-object iothread,id=iothread1 -device virtio-scsi-pci,id=scsi1,iothread=iothread1 -drive if=none,id=hd1,file=${QEMU_HDD},format=qcow2,aio=threads,cache=none -device scsi-hd,bus=scsi1.0,drive=hd1,bootindex=1"
#cmd_net='-net nic -net user' # NAT
cmd_net="-netdev tap,id=vmnet0,ifname=${network_iface},script=no,downscript=no -device e1000,netdev=vmnet0,mac=52:54:00:12:34:56" # bridged

echo "set_password vnc ${VNC_PASSWORD}" | qemu-system-x86_64 \
	-cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -smp $(nproc),sockets=1,cores=$(nproc),threads=1 \
	${cmd_hdd} \
	-drive file=fat:rw:${QEMU_WORKSPACE}/qemu-vvfat \
	-boot c \
	-display vnc=:${VNC_PORT},password \
	${cmd_net} \
	-enable-kvm \
	-mem-prealloc -m 2G \
	${cmd_snd} \
	-localtime \
	-vga std \
	-monitor stdio -monitor telnet:127.0.0.1:${QEMU_MONITOR_PORT},server,nowait \
	-runas ${QEMU_USER} $(echo -n $@ | sed -e 's/snd-pcspk//g') \
>> ${QEMU_WORKSPACE=}/qemu.log 2>&1 || \
	echo ' ! Abnormal exit, check log'

rm ${QEMU_WORKSPACE}/.qemu.ind
############################################################

#################### Shutdown scripts ######################
${loaded_kvm}		&& ${DESTINATION}/.scripts/kvm_amd.sh stop ${DESTINATION} > /dev/null 2>&1
${loaded_sound}		&& ${DESTINATION}/.scripts/sound_dummy.sh stop ${DESTINATION} > /dev/null 2>&1
${loaded_network}	&& ${DESTINATION}/.scripts/network_bridge.sh stop ${DESTINATION} > /dev/null 2>&1
############################################################

exit 0

# Snapshots:
# qemu-img create -f qcow2 -b tiny7.qcow2 tiny7-configured.qcow2
# qemu-img create -f qcow2 -b tiny7-configured.qcow2 tiny7-snapshot.qcow2
