#!/bin/sh
pwd=$(pwd)

cd /
tar xf ${pwd}/mc-4.8.0-pre2-git30-04-2011.tar
rm ${pwd}/mc-4.8.0-pre2-git30-04-2011.tar
rm ${pwd}/*.txt

mkdir /opt/ncurses; mkdir /opt/ncurses/share
ln -s /lib/terminfo /opt/ncurses/share/terminfo
ln -s /opt/mc-4.8.0-pre2-git30-04-2011/bin/mc /usr/bin/mc
ln -s /opt/mc-4.8.0-pre2-git30-04-2011/bin/mcdiff /usr/bin/mcdiff
ln -s /opt/mc-4.8.0-pre2-git30-04-2011/bin/mcedit /usr/bin/mcedit
ln -s /opt/mc-4.8.0-pre2-git30-04-2011/bin/mcview /usr/bin/mcview

rm ${pwd}/unpack.sh
exit 0
