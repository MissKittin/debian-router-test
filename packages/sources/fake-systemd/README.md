# Fake systemd - local apt repo
Debian systemd crack for buster and newer.  
In buster, any `libpam-systemd` dependent package also requires `systemd-sysv`, which conflicts with `sysvinit-core` (`systemd-shim` was removed).  
This package allows you to install systemd dependent packages without all that crap.

### Warning
**Do not use this if you are using systemd!**  
**Do not install this on production environments.**  
**Only install it when you really need it. This is a very dirty hack.**  
**If you only know the basics of apt, don't install this.**  
**By installing this package, you are creating the FrankenDebian which the debian team is warning about** (see Debian Wiki -> DontBreakDebian).  
**Think twice before installing this package.**  
**You use this package at your own risk.**

### Fake packages
* `libpam-systemd`
* `systemd`
* `systemd-shim`
* `systemd-sysv`

### Users and groups
If you removed systemd from your OS, there are a few users and groups left that will no longer be used.  

You can safely remove the following users:
* `systemd-timesync`
* `systemd-network`
* `systemd-coredump`

and groups:
* `systemd-journal`
* `systemd-timesync`
* `systemd-network`
* `systemd-resolve`
* `systemd-coredump`
