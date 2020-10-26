# Fake libpam-systemd
Debian systemd crack for buster and newer.  
In buster, any `libpam-systemd` dependent package also requires `systemd-sysv`, which conflicts with `sysvinit-core`.  
This package allows you to install systemd dependent packages without all that crap.

### Warning
**Do not use this if you are using systemd!**  
**Do not install this on production environments.**  
**Only install it when you really need it. This is a very dirty hack.**  
**If you only know the basics of apt, don't install this.**  
**By installing this package, you are creating the FrankenDebian which the debian team is warning about** (see Debian Wiki -> DontBreakDebian).  
**Think twice before installing this package.**  
**You use this package at your own risk.**
