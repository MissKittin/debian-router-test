# networking-mod
A simple hack that runs `/etc/init.d/networking start` in the background and logs the output to `/tmp/.networking.log`.  
If you are using `init-parallel` package, you don't need this.  
Run `extras-install.sh` to compress `/tmp/.networking.log` on boot.
