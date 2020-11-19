# webadmin
This package contains router modules for server-admin-page v3.1

### Extras
* notify-daemon: php orphaned sessions cleaner

### Building
1. Run `chmod 755 .build.sh; chmod 755 .build-modules.sh; ./.build.sh`
2. Clone https://github.com/MissKittin/server-admin-page
3. Move `share/webadmin` to `server-admin-page`
4. Follow steps from `server-admin-page/README.md`
5. Move `server-admin-page/merged` to `share/webadmin`
6. Run `./install.sh` (and `./install-extras.sh`, but it's not necessary) and follow instructions

### Configuration
After installing packages, `cd /usr/local/share/webadmin`
1. Run `php ./lib/console/passwdhash.php`, enter password and copy password hash  
	edit `./lib/login/login-config.php` and paste hash over "your_plain_(...)_multi_bcrypt"
2. Run `./lib/console/check-command-stack.sh` as root and inspect if required utilities are installed
3. Run `php ./lib/console/update-shebang.php` to update all shellscripts
4. Run `php ./lib/console/generate-cache.php` to enable optimizations
