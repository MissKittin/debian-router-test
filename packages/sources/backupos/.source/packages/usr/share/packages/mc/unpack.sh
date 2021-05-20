#!/bin/sh
pwd="$(pwd)"

cd /
tar xf "${pwd}/mc-4.8.0-pre2-git30-04-2011.tar"

for i in 'mc' 'mcdiff' 'mcedit' 'mcview'; do
	ln -s "/opt/mc-4.8.0-pre2-git30-04-2011/bin/${i}" "/usr/bin/${i}" &
done

# ncurses patch
mkdir -p '/opt/ncurses/share'; ln -s '/usr/share/terminfo' '/opt/ncurses/share/terminfo' &

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	mv "${pwd}/minimize-mc.sh" '/tmp/minimize-mc.sh'
	'/tmp/minimize-mc.sh' > '/dev/null' 2>&1 &

	rm "${pwd}/mc-4.8.0-pre2-git30-04-2011.tar" "${pwd}/dependencies.txt" "${pwd}/source.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
