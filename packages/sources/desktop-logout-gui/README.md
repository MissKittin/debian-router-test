# Desktop logout GUI
Logout window replacement for XFCE4  
without policykit, logind and other crap  
built on gtkdialog - minimal version 0.8.3 is required.

### Get gtkdialog.deb
gtkdialog package is obsolete, but it's working on newer systems.  
First search for gtkdialog package:  
[Sourceforge/makulu](https://sourceforge.net/projects/makulu/files/repository-u/packages/gtkdialog_0.8.3-1_trusty0_i386.deb/download) for i386  
[Launchpad/inameiname](https://launchpad.net/~inameiname/+archive/ubuntu/stable/+files/gtkdialog_0.8.3-1~trusty0_i386.deb) for i386  
[Sourceforge/makulu](https://sourceforge.net/projects/makulu/files/repository-u/packages/gtkdialog_0.8.3-1_trusty0_amd64.deb/download) for amd64  
[Launchpad/inameiname](https://launchpad.net/~inameiname/+archive/ubuntu/stable/+files/gtkdialog_0.8.3-1~trusty0_amd64.deb) for amd64  
[archive.org/puppy linux quirky xerus raspi](https://archive.org/download/Puppy_Linux_Quirky_Xerus_Raspi/gtkdialog-0.8.4-r514-xerus-armv7.pet) for armv7 (you need to unpack archive and copy `gtkdialog` binary to the `/usr/local/bin`)

### Configuration
Go to the `/usr/local/etc/desktop-logout-gui`:
* `general-config.rc`
* `lang.rc` - define custom labels
* `methods-enabled.rc` - enable or disable buttons
* `methods.rc` - configure actions for buttons

### Helper (from extras)
First edit `/etc/sudoers.d/z-desktop-logout-gui-helper`  
and change `user` to your user name.  
Then go to the `/usr/local/etc/desktop-logout-gui-helper`  
and edit rc files. All commands in these files will be executed as root.  
If you are not using one of the methods, you can delete the file.
