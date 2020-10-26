#!/bin/sh

extract_libs()
{
	print_S1(){ echo -n "$1"; }
	print_S3() { echo -n "$3"; }
	print_S5() { echo -n "$5"; }

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

if [ -e ./php-cli.tar.gz ]; then
	echo 'php-cli tarball already exists'
	exit 1
fi
if [ ! -e /usr/bin/php ]; then
	echo 'Install php first'
	exit 1
fi
if [ ! -e /usr/bin/file ]; then
	echo 'Install `file` utility first'
	exit 1
fi

echo -n 'Are you sure? (y/[n]) '
read answer
if [ "$answer" = 'y' ]; then
	mkdir ./.php-cli
	cd ./.php-cli
	mkdir ./bin ./lib
	cd ./bin
	php_bin="$(readlink -f '/usr/bin/php')"
	cp ${php_bin} ./${php_bin##*/}
	ln -s ${php_bin##*/} php
	cd ..
	cd ./lib
	for i in 1 2 3 4 5; do
		extract_libs ../bin/${php_bin##*/}
	done
	cd ../..
	tar cvf ./php-cli.tar .php-cli
	gzip -9 ./php-cli.tar
	rm -r -f ./.php-cli
fi

exit 0
