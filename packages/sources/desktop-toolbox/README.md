# Desktop toolbox
Set of GTK and command line utilities from my PC  
built on gtkdialog.

### Modules
* `alsa-hotkeys` automation for keyboard shortcuts
* `gnome-screenshot-hotkey` automation for keyboard shortcuts
* `gtk-list-daemons` start/restart/stop daemons quickly
* `sudo-gtk` GUI for sudo

### Extras
* `apt-updater` notifies user about updates and doing update if accepted (apt-check package required)
* `apt-updaterd` update apt database on boot (required for `apt-updater` module)
* menu launchers (you need to create `/usr/local/share/applications` directory)

### Modules configuration
All config files (with functions and variables) are in `etc/desktop-toolbox`.  
You can create `etc/desktop-toolbox/global-config.rc` - this file will be imported by all modules.

### gtk-list-daemons module configuration
To configure gtk-list-daemons, cd to `etc/desktop-toolbox/mod_gtk-list-daemons.rc.d`, copy `TEMPLATE` to `your-daemon-name.rc` and edit.

### Own translation
Files with translation are imported before configuration file:  
copy variables from `share/desktop-toolbox/mod_modname.lang.d/default.rc` to the configuration file and edit.

### apt-updaterd configuration
All configuration is in `etc/apt-updaterd.rc`.  
You shouldn't need to edit this file.

### Get gtkdialog.deb
gtkdialog package is obsolete, but it's working on newer systems.  
First search for gtkdialog package:  
[Sourceforge/makulu](https://sourceforge.net/projects/makulu/files/repository-u/packages/gtkdialog_0.8.3-1_trusty0_i386.deb/download) for i386  
[Launchpad/inameiname](https://launchpad.net/~inameiname/+archive/ubuntu/stable/+files/gtkdialog_0.8.3-1~trusty0_i386.deb) for i386  
[Sourceforge/makulu](https://sourceforge.net/projects/makulu/files/repository-u/packages/gtkdialog_0.8.3-1_trusty0_amd64.deb/download) for amd64  
[Launchpad/inameiname](https://launchpad.net/~inameiname/+archive/ubuntu/stable/+files/gtkdialog_0.8.3-1~trusty0_amd64.deb) for amd64  
[archive.org/puppy linux quirky xerus raspi](https://archive.org/download/Puppy_Linux_Quirky_Xerus_Raspi/gtkdialog-0.8.4-r514-xerus-armv7.pet) for armv7 (you need to unpack archive and copy `gtkdialog` binary to the `/usr/local/bin`)
