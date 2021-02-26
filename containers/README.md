# Containers
Keep your system tidy

## How to use
1) create directory for containers (eg `/home/containers`)

### First method
2) run `.build.sh`
3) copy `.bin` `.samples` `.webadmin` from `sources` directory, chmod 755 all `*.sh` files
4) copy container directory
5) cd to the container directory
6) `mkdir .container`
7) `./start.sh`

### Second method
2) download and unpack `tools.tar.gz`
3) download and unpack tarball with container
4) `./start.sh`

### Configuration
1) edit `.config.rc`
2) start container and configure services
3) create root tree and copy config files onto it
4) tar the root tree and gzip it
5) copy tarball to the container directory and change name to `.config.tar.gz`

## webadmin module
(uses scripts from `.bin` directory)
1) `cd .webadmin`
2) `./install.sh`

## Warning
**This is not a security feature - process with root privileges can escape from the container.**  
**Run trusted binaries only in this containers.**  
**For true contenerization use docker or lxc.**
