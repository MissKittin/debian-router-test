#!/bin/bash

reserved_vram_size='8' # Mi

print_S1() { echo -n "${1}"; }
print_S5() { echo -n "${5}"; }
print_S9() { echo -n "${9}"; }

echo -n "lspci binary check"
if command -v 'lspci' > /dev/null 2>&1; then
	echo ' [ OK ]'
else
	echo ' [FAIL]'
	exit 1
fi

echo -n "modprobe binary check"
if command -v 'modprobe' > /dev/null 2>&1; then
	echo ' [ OK ]'
else
	echo ' [FAIL]'
	exit 1
fi

echo -n "phram module check"
if cat '/proc/modules' | grep '^phram' > /dev/null 2>&1; then
	echo ' [FAIL]'
	exit 1
else
	echo ' [ OK ]'
fi

vga_addr=$(print_S1 $(lspci | grep 'VGA compatible controller:'))
echo -n "VGA controller address: ${vga_addr}"
if [ "${vga_addr}" = '' ]; then
	echo '[FAIL]'
	exit 1
else
	echo ' [ OK ]'
fi

vga_params=$(lspci -s "${vga_addr}" -vvv | grep ' prefetchable' | tr -d '[' | tr -d ']' | tr '=' ' ')
vram_addr=0x$(print_S5 ${vga_params})
echo -n "Video RAM address: ${vram_addr}"
if [ "${vram_addr}" = '0x' ]; then
	echo '???????? [FAIL]'
	exit 1
else
	echo ' [ OK ]'
fi

vram_size=$(print_S9 ${vga_params})
vram_size=${vram_size%?}
echo -n "Video RAM size: ${vram_size}"
if [ "${vram_size}" = '' ]; then
	echo '[FAIL]'
	exit 1
else
	if [ "${vram_size}" -gt "${reserved_vram_size}" ]; then
		echo 'M [ OK ]'
	else
		echo 'M [FAIL]'
		exit 1
	fi
fi
echo "New video RAM size: ${reserved_vram_size}Mi"

swap_size="$((${vram_size}-${reserved_vram_size}))Mi"
echo "Swap size: ${swap_size}"

mtdblocks='0'
for mtdblock in /dev/mtdblock*; do
	[ "${mtdblock}" = '/dev/mtdblock*' ] && break
	mtdblocks="$((${mtdblocks}+1))"
done
echo "Swap device: /dev/mtdblock${mtdblocks}"

if ! modprobe phram phram=VRAM,${vram_addr},${swap_size}; then
	echo 'modprobe phram failed'
	exit 1
fi
if ! modprobe mtdblock; then
	echo 'modprobe mtdblock failed'
	exit 1
fi

if [ ! -b "/dev/mtdblock${mtdblocks}" ]; then
	echo "/dev/mtdblock${mtblocks} is not a block device"
	exit 1
fi

mkswap "/dev/mtdblock${mtdblocks}"
swapon -p 10 "/dev/mtdblock${mtdblocks}"

exit 0
