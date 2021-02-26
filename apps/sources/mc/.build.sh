#!/bin/sh
extract_libs()
{
	print_S1()
	{
		echo -n "$1"
	}
	print_S3()
	{
		echo -n "$3"
	}
	print_S5()
	{
		echo -n "$5"
	}

	ldd "$1" | while read line; do
		if echo $line | grep '=>' > /dev/null 2>&1; then
			echo -n $(print_S3 $line)
			if file $(print_S3 $line) | grep 'symbolic link' > /dev/null 2>&1; then
				echo -n " and $(print_S5 $(file $(print_S3 $line)))"
				cp -Lr $(print_S3 $line) $(print_S5 $(file $(print_S3 $line)))
				linkname=`print_S3 $line`; ln -s $(print_S5 $(file $(print_S3 $line))) ./${linkname##*/}
			else
				cp $(print_S3 $line) .
			fi
			echo '' # Newline
		else
			if [ -e $(print_S1 $line) ]; then
				echo $(print_S1 $line)
				cp $(print_S1 $line) .
			fi
		fi
	done
}


if [ -e ./mc.tar.gz ]; then
	echo 'mc tarball already exists'
	exit 1
fi
if [ ! -e /usr/bin/mc ]; then
	echo 'Install mc first'
	exit 1
fi
if [ ! -e /usr/bin/file ]; then
	echo 'Install `file` utility first'
	exit 1
fi

echo -n 'Are you sure? (y/[n]) '
read answer
if [ "$answer" = 'y' ]; then
	mkdir ./.mc
	cd ./.mc
	mkdir ./bin ./etc ./lib ./share
	cp -rfp /usr/bin/mc ./bin/mc-bin
	for i in mcdiff mcedit mcview; do
		ln -s mc-bin ./bin/${i}-bin
	done
	cd ./lib
	for i in mc; do
		for x in 1 2 3 4 5; do
			extract_libs ../bin/${i}-bin
		done
	done
	cp -rfp /usr/lib/mc ./mc
	cd ..
	cp -rfp /etc/mc ./etc/mc
	cp -rfp /usr/share/mc ./share/mc
	cd ..
	tar cvf mc.tar .mc
	gzip -9 mc.tar
	rm -r -f .mc

	for i in mcdiff mcedit mcview; do
		ln -s mc ${i}
	done
fi

exit 0
