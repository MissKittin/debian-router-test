BackupOS - OS for doing backup of main OS
System is prepared for headless PCs, controlled by telnet.

BackupOS v1 26.02.2019-28.02.2019
BackupOS v1.1 12.06.2020
BackupOS v2.0 09.04.2021

standard boot prompt:
	rdinit=/sbin/init ro => this must be
	quiet loglevel=0 => quiet boot (remove to debug)
	apparmor=0 => disable AppArmor
	hostname=backupos => set custom hostname (not necessary, default: backupos)

network:
	nodhcp => disable dhcp negotiation (it must be if you want static ip), set this only if you want to disable network configuration
	wait_for_dhcp=15 => wait 15 seconds after udhcpc call
	network_ip=10.0.0 => first (static) part of computer's IP
	start_ip=10 => second (dynamic) part of c's IP
	netmask=255.255.255.0 => network mask
init script assigns for each nic ip address in format
	network_ip.start_ip
	network_ip.start_ip+1
	network_ip.start_ip+2
		...
	network_ip.start_ip+n
Note: DNS and default gateway adresses won't be configured with static IP assignment

loading modules on boot:
	add modules in /etc/modules-load.rc
	or create .rc file in /etc/modules-load.d
Note: do not add comments on these files

default modules options: read BusyBox docs about /etc/modules.conf file

debugging:
	debug_norootfsclean => do not remove files during boot to free ram space
	debug_no_modprobe => do not run modprobe script on boot
