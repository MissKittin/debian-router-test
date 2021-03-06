# debian-router packages
All debian-router packages ready to build (first method).  
You can also download the tarball from repo and install it through `package-manager` (second method, building is not needed).

# Package manager
### first method
1) copy `.package-manager` to the target directory
2) enter into `.package-manager` directory
3) run `.build.sh`
4) run `install.sh`
5) now you can leave the `.package-manager` directory and use the `package-manager.sh` script
### second method
1) download `.package-manager` tarball from repo
2) unpack the tarball to the target directory
3) cd into `.package-manager` directory
4) run `install.sh`
5) now you can leave the `.package-manager` directory and use the `package-manager.sh` script

# First start
1) download and unpack choosen packages
2) run `./.package-manager.sh analyze-dependencies`
3) install debian packages from `Debian dependencies` section
4) optionally install debian packages from `Debian recommends` section
5) check if you have conflicted packages, remove conflicts
6) check if you have dependent packages - install that packages first
7) install rest of the packages

# How to use
1) enter into the package directory
2) `chmod 755 .build.sh` (skip this step if you downloaded the tarball)
3) run `.build.sh` (skip this step if you downloaded the tarball)
4) run `install.sh`
5) if you want to install extras, run `install-extras.sh`

# Warning
Place all packages in one specific directory or badtrip.
