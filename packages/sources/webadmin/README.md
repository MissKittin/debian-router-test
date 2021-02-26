# webadmin
This package contains server-admin-page core v3.1

### Warning
**Do not use `multi` login method in production - do not store plain password in config.**

### Extras
* notify-daemon: php orphaned sessions cleaner

### Configuration
After installing packages, `cd /usr/local/share/webadmin`
1. Run `php ./lib/console/passwdhash.php`, enter password and copy password hash  
	edit `./lib/login/login-config.php` and paste hash over "your_plain_(...)_multi_bcrypt"
2. Run `php ./lib/console/generate-cache.php` to enable optimizations  
	or first add modules, and then run generate-cache.php

### Empty directories
If you don't want to install the `webadmin-modules-misc` package,  
you can remove `share/webadmin/lib/shell` directory.  
Also if you don't have minified html headers,  
you can remove `share/webadmin/lib/htmlheaders_min` directory.

## Deprecated files
* etc/rc.local.d/PKx_webadmin.rc
* sbin/webadmin.sh
