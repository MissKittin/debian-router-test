BackupOS v1 - OS for doing backup of main os

System is prepared for headless PCs, controlled by telnet.
You can add programs in /usr/share/packages.

Additional commands:
boot_to_main => remove indicator and boot to main os
mount-cifs => mount samba share (it loads modules)
mount-ext4 => mount ext4 fs (it also loads modules)

Boot prompt:
	rdinit=/sbin/init => this must be
	quiet loglevel=0 => quiet boot
	hostname=backupos => set custom hostname (not necessary)
network:
	nodhcp => disable dhcp negotiation (it must be if you want static ip)
	network_ip=10.0.0 => first (static) part of computer's IP
	start_ip=10 => second (dynamic) part of c's IP
	netmask=255.255.255.0 => network mask
init script assigns for each nic ip address in format
	network_ip.start_ip
	network_ip.start_ip+1
	network_ip.start_ip+2
		...
	network_ip.start_ip+n
telnet:
	telnet_password=mypassword => password to telnet console
