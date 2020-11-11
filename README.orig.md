# Debian router
Create your router/server from scratch  
debian stretch version

### Content
* **Apps** applications without installing
* **Configs** sample configurations
* **Containers** simple containers
* **Docs** tutorials
* **Packages** debian-router repository
* **Tweaks** OS tweaks
* **VMs** Qemu daemons
* **User packages** small packages for non-privileged user
* **PXE** server

### History
The project was created a few years ago after the power supply in my AP burned out. Due to difficulties with the selection of the power supply, I replaced it with an old Compaq laptop - the Armada E500 with a WiFi USB card and Windows 7, and later with Debian with unofficial drivers. Everything was fine, but the protruding cables and the handling of this equipment were not very pleasant. I decided to build a dedicated PC for this task.  
So the project of a debian-router was born, which for several years has grown from an old PC with a motherboard lying on two sheets of paper to the size of a small server.

## My configuration
### Hardware
Motherboard: Gigabyte 880GA-UD3H rev 2.2  
CPU: AMD Athlon II X2 260u  
RAM: Kingston HyperX Savage DDR3 HX318C9SRK2/8 4GB overclocked to 1866MHz  
HDD: Kingston SSDNow V100 32GB Internal 2.5" (SV100S2/32G) SSD  
PSU: BeQuiet SYSTEM POWER S6-SYS-UA-300W  
WiFi AP: TP-LINK TL-WN881ND Rev:2.0  
LAN 1Gbps: TP-LINK TG-3468v2  
LAN 100Mbps: Realtek RTL8139D  
Case: old AT/ATX case with psu parallel to the motherboard
### Software
Init: SysVinit with init-parallel package (boot time: 6s max)  
Networking: LANs and WLAN bridged, PPTP and L2TP interfaces separated
