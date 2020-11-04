# PXE NAS service installer
User-friendly service installer for PXE Debian.  
Install, configure packages and start daemons automatically.  
**This is a very primitive NAS solution. If you want better functionality, use OpenMediaVault or FreeNAS.**

### What is PXE NAS?
PXE NAS is a prototype of PXE Debian with Samba and OpenSSH server.  
PXE Debian is better solution because is more versatile and image is a lot smaller than PXE NAS.  
All PXE NAS functions have been moved to PXE NAS installer. Moreover, PXE NAS installer is an optional package.  
The downside is that the PXE NAS installer requires internet access.

### Warning
**This package is designed for PXE Debian only.**  
**Do not install it on a normal debian system.**  
**Install this package via `pxe-debian-toolbox.sh`.**

### Usage
Run `pxe-nas-installer` as root and select service  
or type `pxe-nas-installer servicename`.

### Supported services
* **Samba** share files via SMB
* **SSH** enable remote terminal
* **XFCE4** desktop environment
* **Locales** enable language support
