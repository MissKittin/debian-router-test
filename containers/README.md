# Containers
Keep your system tidy

## How to use
1) create directory for containers (eg `/home/containers`)

### First method
2) copy files from `tools` directory, chmod 755 all `*.sh` files
3) copy container directory
4) cd to the container directory
5) `mkdir .container`
6) `./start.sh`

### Second method
2) download and unpack `tools.tar.gz`
3) download and unpack tarball with container
4) `./start.sh`

## Configuration
1) start container and configure services
2) create root tree and copy config files onto it
3) tar the root tree and gzip it
4) copy tarball to the container directory and change name to `.config.tar.gz`
