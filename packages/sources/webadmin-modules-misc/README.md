# webadmin misc modules
This package contains modules and extras for server-admin-page v3.1

### Installing with deprecated modules
Run `./install.sh --install-deprecated`

### Configuration
After installing packages, `cd /usr/local/share/webadmin`
2. Run `./lib/console/check-command-stack.sh` as root and inspect if required utilities are installed
3. Run `php ./lib/console/update-shebang.php` to update all shellscripts
4. Run `php ./lib/console/generate-cache.php` to enable optimizations

# wicd-php-gui
Instructions how to extract standalone version from webadmin module are in `webadmin/net-wicd/README.TXT`.
