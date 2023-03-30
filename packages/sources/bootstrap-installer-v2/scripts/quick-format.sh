#!/bin/sh
exit_code='0'

#esp_partition_size='301' # MiB
esp_partition_size='100' # MiB

firmware_efi='false'
[ -e '/sys/firmware/efi' ] && firmware_efi='true'

parted_mbr()
{
cat << EOF | parted ${1} || exit_code='1'
mklabel msdos
mkpart primary ext4 1MiB 100%
set 1 boot on
quit
EOF
}

fdisk_mbr()
{
cat << EOF | fdisk ${1} || exit_code='1'
o
n
p



a
w
EOF
}

busybox_fdisk_mbr()
{
cat << EOF | busybox fdisk ${1} || exit_code='1'
o
n
p
1


a
1
w
EOF
}

parted_gpt()
{
cat << EOF | parted ${1} || exit_code='1'
mklabel gpt
mkpart "EFI\ system\ partition" fat32 1MiB ${esp_partition_size}MiB
set 1 esp on
mkpart "" ext4 ${esp_partition_size}MiB 100%
quit
EOF
}

gdisk_gpt()
{
cat << EOF | gdisk ${1} || exit_code='1'
o
Y
n


+${esp_partition_size}M
EF00
n




w
Y
EOF
}

if [ ! "$(whoami)" = 'root' ]; then
	echo 'I am not root'
	exit 1
fi

if [ "${1}" = '' ] || [ "${1}" = '-h' ] || [ "${1}" = '--help' ]; then
	echo "Usage: ${0##*/} /dev/sd[a-z] [--gpt=yes|no]"
	echo "Usage: ${0##*/} /dev/vd[a-z] [--gpt=yes|no]"
	echo "Usage: ${0##*/} /dev/xvd[a-z] [--gpt=yes|no]"
	echo "Usage: ${0##*/} /dev/mmcblk[0-9] [--gpt=yes|no]"
	echo "Usage: ${0##*/} /dev/nvme[0-9]n[0-9] [--gpt=yes|no]"
	echo "Usage: ${0##*/} /dev/loop[0-9] [--gpt=yes|no]"

	exit 1
fi

if [ ! "${2}" = '' ]; then
	[ "${2}" = '--gpt=yes' ] && firmware_efi='true'
	[ "${2}" = '--gpt=no' ] && firmware_efi='false'
fi

if "${firmware_efi}"; then
	for cmd in dd blockdev cat mkfs.vfat mkfs.ext4; do
		if ! command -v "${cmd}" > /dev/null 2>&1; then
			echo "${cmd} not installed"
			exit 1
		fi
	done

	partition_method='not-found'
	command -v 'gdisk' > /dev/null 2>&1 && partition_method='gdisk'
	command -v 'parted' > /dev/null 2>&1 && partition_method='parted'
	if [ "${partition_method}" = 'not-found' ]; then
		echo 'gdisk nor parted found'
		exit 1
	fi
else
	for cmd in dd cat mkfs.ext4; do
		if ! command -v "${cmd}" > /dev/null 2>&1; then
			echo "${cmd} not installed"
			exit 1
		fi
	done

	partition_method='not-found'
	command -v 'busybox' > /dev/null 2>&1 && partition_method='busybox_fdisk'
	command -v 'fdisk' > /dev/null 2>&1 && partition_method='fdisk'
	command -v 'parted' > /dev/null 2>&1 && partition_method='parted'
	if [ "${partition_method}" = 'not-found' ]; then
		echo 'busybox nor fdisk nor parted found'
		exit 1
	fi
	[ "${partition_method}" = 'fdisk' ] && readlink -f "$(command -v fdisk)" | grep 'busybox' > /dev/null 2>&1 && partition_method='busybox_fdisk'
	if [ "${partition_method}" = 'busybox_fdisk' ] && ! busybox | grep 'fdisk' > /dev/null 2>&1; then
		echo 'busybox was compiled without fdisk'
		exit 1
	fi
fi

if [ ! -b "${1}" ]; then
	echo "${1} not exists or is not a block device"
	exit 1
fi

if "${firmware_efi}"; then
	dd if=/dev/zero of=${1} bs=512 count=34
	dd if=/dev/zero of=${1} bs=512 count=34 seek=$((`blockdev --getsz ${1}` - 34))
	${partition_method}_gpt "${1}"
	#mkfs.vfat -n 'EFI system partition' -F 32 ${1}1 || exit_code='1'
	mkfs.vfat -F 32 ${1}1 || exit_code='1'
	echo 'y' | mkfs.ext4 ${1}2 || exit_code='1'
else
	dd if=/dev/zero of=${1} bs=512 count=1
	${partition_method}_mbr "${1}"
	echo 'y' | mkfs.ext4 ${1}1 || exit_code='1'
fi

exit "${exit_code}"
