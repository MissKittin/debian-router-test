# webadmin
This package contains router modules for server-admin-page v3.1u2

### Extras
* notify-daemon: php orphaned sessions cleaner

### Building
1. Run `chmod 755 .build.sh; chmod 755 .build-modules.sh; ./.build.sh`
2. Clone https://github.com/MissKittin/server-admin-page
3. Move `share/webadmin` to `server-admin-page`
4. Follow steps from `server-admin-page/README.md`
5. Move `server-admin-page/merged` to `share/webadmin`
6. Run `./install.sh` (and `./install-extras.sh`, but it's not necessary) and follow instructions
