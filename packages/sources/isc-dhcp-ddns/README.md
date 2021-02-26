# isc-dhcp-ddns
This package was extracted from misc, and contains improved versions of `generate-ddns-hosts.sh`,  
both for IPv4 and IPv6.  
`isc-dhcp-server` and `dnsmasq` packages are recommended.

### Scripts
`isc-dhcp-ddns4.sh` - creates/updates the DNS records (in `/var/run/.isc-dhcp-ddns4.hosts`) with data from isc-dhcp-server  
`isc-dhcp-ddns6.sh` - looks for link-local IPv6 address in the neighborhood by MAC address and only creates DNS records (in `/var/run/.isc-dhcp-ddns6.hosts`)

### Achtung
`isc-dhcp-ddns6.sh` is prepared for stateless radvd configuration, so only IPv4 version of isc-dhcp-server can be used.  
`isc-dhcp-ddns4.sh` cannot be used in IPv6 version of isc-dhcp-server due to sed's IPv4 regex in the update condition.  
If client not using IPv4 DHCP, these scripts will not run.

### Configuration
For dnsmasq configuration just `install-extras.sh`.  
Add content from `dhcpd.conf.sample` at the bottom to the isc-dhcp-server configuration (`/etc/dhcp/dhcpd.conf`).
