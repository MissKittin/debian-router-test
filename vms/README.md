# VM daemons
Simple wrappers for qemu

## How to use
1) create directory for VMs (eg `/home/vms`)

### First method
2) run `.build.sh`
3) copy `.drivers` `.samples` `.webadmin` from `tools` directory, chmod 755 all `*.sh` files
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

### webadmin module
(uses scripts from `.bin` directory)
1) `cd .webadmin`
2) `./install.sh`
