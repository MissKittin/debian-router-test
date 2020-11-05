#!/bin/sh
# Umount and fsck all partitions
# ${1} -> PXE NAS log path

# Parent process must be ended
sleep 10

echo 'fsck started' >> ${1}/fsck.log

# Get partitions devies
cd /media
for i in .*; do
	# Convert input
	if [ ! "${i}" = '.' ] && [ ! "${i}" = '..' ]; then
		if umount ./${i} >> ${1}/fsck.log 2>&1; then # Do not fsck if umount failed
			fsck -p $(echo /dev/${i} | tr -d '.') >> ${1}/fsck.log 2>&1
			mount ./${i} >> ${1}/fsck.log 2>&1
		fi
	fi
done

echo 'fsck ended' >> ${1}/fsck.log

# Zip log
gzip -9 ${1}/fsck.log

rm ${0}
exit 0
