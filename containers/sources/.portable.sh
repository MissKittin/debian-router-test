#!/bin/sh

for i in *; do
	find $i -type l | while read line; do
		source=$(readlink -f $line)
		rm $line
		cp -rfp "${source}" $line
	done
done

chmod 644 .portable.sh
exit 0
