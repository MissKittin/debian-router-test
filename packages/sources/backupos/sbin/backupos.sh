#!/bin/sh

echo
echo '====================================='

echo -n ' Are you sure? (y/[n]) '
read answer
if [ ! "${answer}" = 'y' ]; then
	echo '====================================='; echo ''
	exit 1
fi

touch /.boot-to-backupos

# server address dump
nodhcp=false
for i in $(cat /boot/grub/grub.cfg | grep /boot/backupos); do
	case $i in
		nodhcp)
			nodhcp=true
		;;
		network_ip=*)
			network_ip=${i#network_ip=}
		;;
		start_ip=*)
			start_ip=${i#start_ip=}
		;;
		netmask=*)
			netmask=${i#netmask=}
		;;
		telnet_password=*)
			telnet_password=${i#telnet_password=}
		;;
	esac
done

if $nodhcp; then
	echo " IP address starts from ${network_ip}.${start_ip}"
	echo -n ' Try adresses: '
	ls -l /sys/class/net | grep -v 'total' | grep -v 'virtual' | while read line; do
		echo -n "${network_ip}.${start_ip} "
		start_ip=$((start_ip+1))
	done
	echo
	echo " Network mask: ${netmask}"
	echo ' IPv6 address: fe80::1'
else
	echo ' PC will receive address from DHCP'
fi
echo " Telnet password: ${telnet_password}"

echo; echo ' See you in Telnet!';

echo '====================================='
echo

reboot
exit 0
