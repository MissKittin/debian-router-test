# resolvconf-updater
The isc-dhcp-client removes DNS servers manually defined by user in `resolv.conf`.  
This script adds defined lists to resolv.conf and guarding it.  
You don't need to edit `/etc/dhcp/dhclient.conf`.

### Configuration
Add files to `etc/resolvconf-updater.d`

### Extras
* acpid-mods: resolvconf-updater pause/resume scripts for acpid-suspend

### Warning
**Read `etc/resolvconf-updater.d/README` before use**

### tmpfs hack
Move `/etc/resolv.conf` to `/run/.resolv.conf` and  
`ln -s /run/.resolv.conf /etc/resolv.conf` to offload the hdd.
