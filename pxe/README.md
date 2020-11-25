# debian router PXE
Boot PCs over network  
Based on PXELINUX  
UEFI is not supported yet

### How to
1) chmod 755 and run `source/.build.sh`
2) send all files from `source` dir to eg `/home/pxe` on server
3) run `apt-get install pxelinux` on server
4) run `/home/pxe/pxelinux/update-links.sh`
5) edit config files listed below
6) restart isc-dhcp-server and dnsmasq
7) place OS files to the eg `/home/pxe/root/OSNAME`
8) edit `/home/pxe/pxelinux/pxelinux.cfg/default`

### Configs
DHCP: `configs/sources/isc-dhcp-server/etc/dhcp/subnet-lan.conf`  
TFTP: `configs/sources/dnsmasq/etc/dnsmasq.d/pxe.conf`
