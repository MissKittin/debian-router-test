#!/bin/sh
pwd=$(pwd)
cd /bin
ln -s ${pwd}/bash-static ./bash
rm ${pwd}/*.txt
rm ${pwd}/unpack.sh
exit 0
