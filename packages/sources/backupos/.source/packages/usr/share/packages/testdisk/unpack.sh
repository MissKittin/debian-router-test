#!/bin/sh
pwd="$(pwd)"

mkdir '/usr' '/usr/bin' '/usr/share'> '/dev/null' 2>&1
cd '/usr/share'
tar xf "${pwd}/testdisk.tar"

ln -s 'testdisk-7.1' '/usr/share/testdisk' &
for i in 'fidentify' 'photorec' 'testdisk'; do
	ln -s "/usr/share/testdisk/${i}_static" "/usr/bin/${i}" &
done

if [ ! -e '/var/run/.debug.noroofsclean' ]; then
	mv "${pwd}/minimize-testdisk.sh" '/tmp/minimize-testdisk.sh'
	'/tmp/minimize-testdisk.sh' > '/dev/null' 2>&1 &

	rm ${pwd}/testdisk* "${pwd}/source.txt" "${pwd}/unpack.sh"
	rmdir "${pwd}"
fi

exit 0
