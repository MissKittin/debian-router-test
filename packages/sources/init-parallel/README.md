# init-parallel
Tweak for sysvinit that allows aggressive parallelization startup scripts.

### Warning
**DO NOT PARALELIZE SCRIPTS LIKE `check*`, `mount*`, `udev*`, `kmod`, `bootmisc`, `rc.local` and `rmnologin` ON BOOT.**  
**DO NOT PARALELIZE SCRIPTS LIKE `sendsigs`, `umount*`, `halt` and `reboot` ON REBOOT/SHUTDOWN.**  
**IF YOU DO THIS, YOU CAN DESTROY YOUR OS!**  
**RACE CONDITION MAY OCCUR** eg. between networking and hostapd: when hostapd first starts it will create a bridge which will not be configured by `/etc/init.d/networking`  
**YOU USE THIS PACKAGE AT YOUR OWN RISK.**

### Configuration
Go to `/usr/local/etc/init-parallel`
* in runlevel directory (rcS.d or rc2.d) link /etc/init.d/daemon to S01daemon
* or use TEMPLATE script

### Libraries
* `required_start` -> stop the script and wait for the another daemon(s) to start

### Logs
init-parallel saves logs in `/var/run/.init-parallel` directory or `/var/run/.init-parallel.tar.gz` by default.  
The rcdown.local script also compresses the entire directory.  
<del>Due to non-standard location in the rcS/rc2 queue, the rcdown.local script checks and corrects the init-parallel prefix.</del>

### Shutdown oneshot debugging
Run `/etc/init.d/init-parallel-shutdown debug` and restart/shutdown system.  
Logs will be saved in `/init-parallel-shutdown.DATE.log`.

### Deprecated files
* etc/rcdown.local.d/Sx_init-parallel-queue.rc
