#!/bin/sh

for i in 'AUTHORS' 'NEWS' 'readme.txt' 'ChangeLog' 'photorec.8' 'testdisk.8' 'COPYING' 'INFO' 'documentation.html' 'README_dev_photorec.txt' 'THANKS' 'fidentify.8' 'README.md' 'VERSION'; do
	rm "/usr/share/testdisk/${i}" > '/dev/null' 2>&1 &
done

for i in 'icons' 'jni'; do
	rm -r -f "/usr/share/testdisk/${i}" > '/dev/null' 2>&1 &
done

rm "${0}"
exit 0
