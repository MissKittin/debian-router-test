#!/bin/sh
# webadmin-modules-misc package
# jQuery downloader

# Check root
if [ ! "$(whoami)" = 'root' ]; then
	echo ".build-jquery.sh: I don't have the required power"
	exit 1
fi

# Check wget
if ! command -v wget > /dev/null 2>&1; then
	echo '.build-jquery.sh: wget not installed'
	exit 1
fi

cd "$(dirname "$(readlink -f "${0}")")"
cd './webadmin/lib'

echo ''
if [ ! -e './jquery-3.3.1.min.js' ]; then
	echo '.build-jquery.sh: downloading jQuery 3.3.1 ...'
	wget --no-check-certificate 'https://code.jquery.com/jquery-3.3.1.min.js' && ln -s jquery-3.3.1.min.js jquery.js
else
	echo '.build-jquery.sh: jQuery 3.3.1 already exists'
fi

echo ''
if [ ! -e './jquery-1.9.1.min.js' ]; then
	echo '.build-jquery.sh: downloading jQuery 1.9.1 ...'
	wget --no-check-certificate 'https://code.jquery.com/jquery-1.9.1.min.js' && ln -s jquery-3.3.1.min.js jquery-old.js
else
	echo '.build-jquery.sh: jQuery 1.9.1 already exists'
fi

cd '../..'
chmod 644 ./.build-jquery.sh

exit 0
