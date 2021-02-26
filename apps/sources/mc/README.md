# Midnight commander
Use mc without installing unnecessary packages.

# Building
Use the same OS version as build environment or `plain-overlay` container.  
Run `.build.sh` and copy all files to the target location.

# Linking
Link `mc`, `mcdiff` `mcedit` and `mcview` scripts to `/usr/local/bin`. Done!

# Tweaks
Add to ~/.bashrc:
```
# mc appimage patch
if [ ! "${MC_TMPDIR}" = '' ]; then
	alias mcedit="/tmp/.mc/bin/mcedit-bin"
	alias smcedit="sudo LD_LIBRARY_PATH=/tmp/.mc/lib /tmp/.mc/bin/mcedit-bin"
fi
```
