#!/bin/sh
pwd=$(pwd)
cd /
tar xf ${pwd}/ncurses-base_6.1+20181013-2_all.tar
rm ${pwd}/ncurses-base_6.1+20181013-2_all.tar
rm ${pwd}/*.txt
rm ${pwd}/unpack.sh
exit 0
