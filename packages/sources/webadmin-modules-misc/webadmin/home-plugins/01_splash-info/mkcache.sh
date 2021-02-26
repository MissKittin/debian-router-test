#!/bin/sh
cd "$(dirname "$(readlink -f "${0}")")"
read_file() { while IFS= read -r line || [ -n "${line}" ]; do echo "${line}"; done < "${1}"; }

if [ -e './modules-cache.rc' ]; then
	echo 'Deleting old cache file'
	rm './modules-cache.rc'
fi

for cache_file in ./modules/*.rc; do
	echo "Caching module ${cache_file##*/}"
	read_file "${cache_file}" >> ./modules-cache.rc
done

if command -v 'sed' > /dev/null 2>&1; then
	echo 'Compressing cache file'

	# remove comments - https://unix.stackexchange.com/questions/157328/how-can-i-remove-all-comments-from-a-file
	sed -i '/^[[:blank:]]*#/d;s/#.*//' 'modules-cache.rc'

	# remove empty lines and tabs - https://www.cyberciti.biz/tips/delete-leading-spaces-from-front-of-each-word.html
	sed -i '/^$/d' 'modules-cache.rc'
	sed -i -e 's/^[ \t]*//' 'modules-cache.rc'
fi

exit 0