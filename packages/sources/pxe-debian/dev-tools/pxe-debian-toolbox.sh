#!/bin/sh
# PXE Debian build toolbox
# 08.10.2020

cd "$(dirname "$(readlink -f "${0}")")"

if [ ! "$(whoami)" = 'root' ]; then
	echo "I don't have required power"
	exit 1
fi

setup_build_env()
{
		[ -e './img' ] || mkdir ./img
		if [ ! -e './.build_env' ]; then
			echo 'copying rootfs to .build_env...'
			cp -rfp ./rootfs ./.build_env || exit 1
		fi
		cd ./.build_env || exit 1
		[ -e './build' ] || mkdir ./build
		mount --bind .. ./build
		if [ ! -e './usr/bin/mksquashfs' ]; then
			mount --bind /dev ./dev
			mount --bind /dev/pts ./dev/pts
			cat /etc/resolv.conf > ./etc/resolv.conf
			chroot . apt-get update
			chroot . apt-get install -y squashfs-tools cpio
			rm ./etc/resolv.conf
			umount ./dev/pts
			umount ./dev
		fi
}

case ${1} in
	'bootstrap')
		[ -e './rootfs' ] || mkdir rootfs
		cd ./rootfs || exit 1
		if [ "${2}" = '' ]; then
			echo 'usage: bootstrap ARCHITECTURE'
			exit 1
		fi
		if debootstrap --help > /dev/null 2>&1; then
			debootstrap --arch "${2}" --variant=minbase buster . http://deb.debian.org/debian
		else
			echo 'debootstrap not installed'
			echo 'install debootstrap first'
			echo 'or put rootfs files to the rootfs directory'
			exit 1
		fi
	;;
	'bootstrap-clear')
		cd ./rootfs || exit 1
		rm -r -f ./dev/*
		rm ./etc/resolv.conf
		echo 'debian' > ./etc/hostname
		rm -r -f ./run/*
	;;
	'install-packages')
		cd ./rootfs || exit 1
		mount --bind /dev ./dev
		mount --bind /dev/pts ./dev/pts
		cat /etc/resolv.conf > ./etc/resolv.conf
		chroot . apt-mark auto $(chroot . apt-mark showmanual)
		chroot . apt-get update
		chroot . apt-get install -y --no-install-recommends busybox-static kmod sysvinit-core udev
		rm ./etc/resolv.conf
		umount ./dev/pts
		umount ./dev
	;;
	'strip')
		cd ./rootfs || exit 1
		chroot . apt-get purge -y --allow-remove-essential e2fsprogs tzdata
		chroot . apt-get autoremove --purge -y
		chroot . apt-get clean
		rm ./var/cache/ldconfig/aux-cache
		rm ./var/cache/debconf/*.dat-old
		rm ./var/lib/dpkg/*-old
		rm ./var/lib/ucf/hashfile.*
		rm ./var/lib/ucf/registry.*
		for i in group- gshadow- passwd- shadow- subgid- subuid-; do
			rm ./etc/${i}
		done
		find ./usr/share/doc -depth -type f ! -name copyright | xargs rm
		for i in 1 2 3 4 5 6 7 8 9 10; do
			find ./usr/share/doc -empty | xargs rmdir
		done
		rm -rf ./usr/share/man/* ./usr/share/groff/* ./usr/share/info/* ./usr/share/lintian/* ./usr/share/linda/* ./var/cache/man/*
		find ./usr/share/locale -mindepth 1 -maxdepth 1 | xargs rm -r
		rm ./usr/share/bash-completion/completions/*
		find ./usr/share/python -type f -name *.pyc | xargs rm
		find ./usr/share/pixmaps -type f -or -type l | xargs rm
		rm -r -f ./usr/includes/*
		for i in $(ls ./sbin/*fdisk | xargs) ./usr/share/doc/fdisk/copyright; do
			[ -e "${i}" ] && echo -n '' > ${i}
		done
		echo -n '' > ./lib/startpar/startpar
		echo -n '' > ./usr/share/doc/startpar/copyright
		for i in ./var/lib/apt/lists/*; do
			[ "${i}" = './var/lib/apt/lists/*' ] && break
			if [ "${i}" = './var/lib/apt/lists/auxfiles' ] || [ "${i}" = './var/lib/apt/lists/lock' ] || [ "${i}" = './var/lib/apt/lists/partial' ]; then
				echo " i ${i}"
			else
				rm "${i}"
			fi
		done
		rm ./root/.bash_history
	;;
	'install-pxe-debian-package')
		cd ./rootfs || exit 1
		if [ "${2}" = '' ]; then
			install-pxe-debian /path/to/package
			exit 1
		fi
		if [ -e ./${2}/install.sh ]; then
			chroot . ${2}/install.sh --force
			chroot . ${2}/extras-install.sh
		else
			echo 'wrong path'
			exit 1
		fi
	;;
	'setup-boot-queue')
		cd ./rootfs || exit 1

		if cd ./etc/rcS.d > /dev/null 2>&1; then
			if ls *pxe-debian.sh > /dev/null 2>&1; then
				if ls S00pxe-debian.sh > /dev/null 2>&1; then
					echo 'pxe-debian.sh script is ok - not processing'
				else
					echo 'processing script pxe-debian.sh'
					mv *pxe-debian.sh S00pxe-debian.sh
				fi
			else
				echo 'error: package pxe-debian not installed'
			fi
			cd ../..
		fi
		if [ "${2}" = 'pxe-debian-only' ]; then
			echo 'pxe-debian-only - not processing other scripts'
			exit 0
		fi

		for runlevel in 0 6; do
			if cd ./etc/rc${runlevel}.d > /dev/null 2>&1; then
				echo "processing runlevel ${runlevel}"
				for script in brightness umountroot; do
					if [ -e ./K*${script} ]; then
						echo " processing script ${script}"
						script_queue="$(ls *${script} | sed -e 's/^K//g')"
						mv K${script_queue} S${script_queue}
					fi
				done
				cd ../..
			fi
		done
		if cd ./etc/rcS.d; then
			echo 'processing runlevel S'
			for script in checkroot.sh checkfs.sh checkroot-bootclean.sh mountall.sh mountall-bootclean.sh brightness mountnfs-bootclean.sh; do
				if [ -e ./S*${script} ]; then
					echo " processing script ${script}"
					script_queue="$(ls *${script} | sed -e 's/^S//g')"
					mv S${script_queue} K${script_queue}
				fi
			done
			cd ../..
		fi
		for runlevel in 1 2 3 4 5; do
			if cd ./etc/rc${runlevel}.d > /dev/null 2>&1; then
				echo "processing runlevel ${runlevel}"
				for script in bootlogs; do
					if [ -e ./S*${script} ]; then
						echo " processing script ${script}"
						script_queue="$(ls *${script} | sed -e 's/^S//g')"
						mv S${script_queue} K${script_queue}
					fi
				done
				cd ../..
			fi
		done
	;;
	'mkinitrd')
		setup_build_env
		if [ ! -e './build-initrd.sh' ]; then
			echo '#!/bin/sh' > ./build-initrd.sh
			echo 'cd /build/initrd' >> ./build-initrd.sh
			echo '[ -e "../img/initrd.img" ] && rm ../img/initrd.img' >> ./build-initrd.sh
			echo 'find | cpio --create --format=newc > ../img/initrd.img' >> ./build-initrd.sh
			echo 'cd ../img' >> ./build-initrd.sh
			echo 'gzip -9 ./initrd.img' >> ./build-initrd.sh
			echo 'mv ./initrd.img.gz ./initrd.img' >> ./build-initrd.sh
			echo 'exit 0' >> ./build-initrd.sh
			chmod 755 ./build-initrd.sh
		fi
		chroot . /build-initrd.sh
		umount ./build
	;;
	'mkinitrd-bin')
		setup_build_env
		if [ ! -e './build-initrd-bin.sh' ]; then
			echo '#!/bin/sh' > ./build-initrd-bin.sh
			echo 'cd /build' >> ./build-initrd-bin.sh
			echo 'mkdir ./.initrd-bin' >> ./build-initrd-bin.sh
			echo 'cd ./.initrd-bin' >> ./build-initrd-bin.sh
			echo 'mkdir ./bin' >> ./build-initrd-bin.sh
			echo 'cd ./bin' >> ./build-initrd-bin.sh
			echo 'cp -rfp /bin/busybox ./busybox' >> ./build-initrd-bin.sh
			echo 'cd ..' >> ./build-initrd-bin.sh
			echo '[ -e "../img/initrd-bin.img" ] && rm ../img/initrd-bin.img' >> ./build-initrd-bin.sh
			echo 'find | cpio --create --format=newc > ../img/initrd-bin.img' >> ./build-initrd-bin.sh
			echo 'cd ../img' >> ./build-initrd-bin.sh
			echo 'gzip -9 ./initrd-bin.img' >> ./build-initrd-bin.sh
			echo 'mv ./initrd-bin.img.gz ./initrd-bin.img' >> ./build-initrd-bin.sh
			echo 'cd ..' >> ./build-initrd-bin.sh
			echo 'rm -r -f ./.initrd-bin' >> ./build-initrd-bin.sh
			echo 'exit 0' >> ./build-initrd-bin.sh
			chmod 755 ./build-initrd-bin.sh
		fi
		chroot . /build-initrd-bin.sh
		umount ./build
	;;
	'mksquashfs-rootfs')
		setup_build_env
		if [ ! -e './build-root.sh' ]; then
			echo '#!/bin/sh' > ./build-root.sh
			echo 'cd /build' >> ./build-root.sh
			echo 'mkdir ./.rootfs.sqs' >> ./build-root.sh
			echo 'mkdir ./.rootfs.sqs/img' >> ./build-root.sh
			echo 'cd /build/rootfs' >> ./build-root.sh
			echo '[ -e "../.rootfs.sqs/img/rootfs.sqs" ] && rm ../.rootfs.sqs/img/rootfs.sqs' >> ./build-root.sh
			echo 'mksquashfs . ../.rootfs.sqs/img/rootfs.sqs -b 1048576 -comp xz -Xdict-size 100%' >> ./build-root.sh
			echo 'cd ../.rootfs.sqs' >> ./build-root.sh
			echo '[ -e "../img/rootfs.img" ] && rm ../img/rootfs.img' >> ./build-root.sh
			echo 'find | cpio --create --format=newc > ../img/rootfs.img' >> ./build-root.sh
			echo 'cd /build' >> ./build-root.sh
			echo 'rm -r -f ./.rootfs.sqs' >> ./build-root.sh
			echo 'exit 0' >> ./build-root.sh
			chmod 755 ./build-root.sh
		fi
		chroot . /build-root.sh
		umount ./build
	;;
	'mksquashfs-kernel')
		if [ "${3}" = '' ]; then
			echo 'usage: mksquashfs-kernel linux-image-package kernel-ARCH [ARCH-FOR-DPKG-ADD-ARCH]'
			exit 1
		fi
		setup_build_env
		mount --bind /dev ./dev
		mount --bind /dev/pts ./dev/pts
		cat /etc/resolv.conf > ./etc/resolv.conf
		if ! ls ./usr/local/sbin/make-kernel-image > /dev/null 2>&1; then
			echo 'run install-pxe-debian first'
			exit 1
		fi
		[ ! "${4}" = '' ] && chroot . dpkg --add-architecture "${4}" && chroot . apt-get update
		chroot . /usr/local/sbin/make-kernel-image ${2} ${3} && echo 'Not needed, I taken files automatically' || exit 0
		rm ./etc/resolv.conf
		umount ./dev/pts
		umount ./dev
		[ -e './img' ] || mkdir ./img
		mv ./pxe-debian/* ../img
		rm -r -f ./pxe-debian
		umount ./build
	;;
	'make-tarball')
		[ -e './pxe-debian.tar' ] && exit 1
		[ -e './pxe-debian.tar.gz' ] && exit 1
		cd ./img || exit 1
		tar cvf ../pxe-debian.tar *
		cd ..
		echo 'zipping...' gzip -9 ./pxe-debian.tar
	;;
	*)
		echo 'PXE Debian build toolbox'
		echo ''
		echo 'Available commands:'
		echo ' bootstrap ARCH'
		echo ' bootstrap-clear'
		echo ' install-packages'
		echo ' strip'
		echo ' install-pxe-debian-package /path/to/package'
		echo ' setup-boot-queue [pxe-debian-only]'
		echo ' mkinitrd'
		echo ' mkinitrd-bin'
		echo ' mksquashfs-rootfs'
		echo ' mksquashfs-kernel linux-image-package kernel-ARCH [ARCH-FOR-DPKG-ADD-ARCH]'
		echo ' make-tarball'
	;;
esac

exit 0