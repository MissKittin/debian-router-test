# VM daemons
Simple wrappers for qemu

## How to use
1) create directory for VMs (eg `/home/vms`)

### First method
2) copy files from `tools` directory, chmod 755 all `*.sh` files
3) remove `PLACEHOLDER` from `.bin` directory
4) copy vm directory
5) cd to the vm directory
6) configure vm in `*.sh` files, create hdd, etc
7) `./start.sh`, setup guest OS, create snapshots, etc
8) `./daemon.sh`

### Second method
2) download and unpack `tools.tar.gz`
3) download and unpack tarball with vm
4) configure vm in `*.sh` files, create hdd, etc
5) `./start.sh`, setup guest OS, create snapshots, etc
6) `./daemon.sh`
