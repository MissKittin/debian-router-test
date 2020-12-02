# debian router PXE
Boot PCs over network  
Based on PXELINUX  
UEFI is not supported yet

### Source setup (1)
1) chmod 755 and run `source/.build.sh`
2) send all files from `source` dir to eg `/home/pxe` on server

### Tarball method (2)
1) download `pxe-tarball.tar.gz`
2) send this to the server, unpack to eg `/home/pxe`

### How to
3) run `apt-get install pxelinux` on server
4) run `/home/pxe/pxelinux/update-links.sh`
5) edit config files listed below
6) configure firewall: allow in `69/udp` (tftp)
7) restart isc-dhcp-server and dnsmasq
8) place OS files to the eg `/home/pxe/root/OSNAME`
9) edit `/home/pxe/pxelinux/pxelinux.cfg/default`

### Configs
DHCP: `configs/sources/isc-dhcp-server/etc/dhcp/subnet-lan.conf`  
TFTP: `configs/sources/dnsmasq/etc/dnsmasq.d/pxe.conf`
