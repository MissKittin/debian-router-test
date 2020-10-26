#!/bin/sh
pwd=$(pwd)
cd /
tar xf ${pwd}/telnet-menu_1.0.tar
rm ${pwd}/telnet-menu_1.0.tar
rm ${pwd}/*.txt
rm ${pwd}/unpack.sh
exit 0
