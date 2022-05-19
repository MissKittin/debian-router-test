#!/bin/sh
# Remove webadmin code
# DO NOT RUN THIS IN PRODUCTION !!!

cd "$(dirname $(readlink -f "${0}"))"

# confirm
echo ''; echo 'DO NOT RUN THIS IN PRODUCTION !!!'
echo "type: YES, I'M SURE!"; echo -n ' > '
read answer
if [ ! "${answer}" = "YES, I'M SURE!" ]; then
	echo 'you are not sure'
	exit 1
fi
echo 'OK!'; echo ''

# copy jQuery/create download-jquery.sh
if [ -e '../lib/jquery-3.3.1.min.js' ]; then
	cd js
		cp '../../lib/jquery-3.3.1.min.js' './jquery-3.3.1.min.js'
		ln -s 'jquery-3.3.1.min.js' 'jquery.js'
	cd ..
else
	echo 'download-jquery.sh'
	echo '#!/bin/sh' > 'download-jquery.sh' || exit 1
	cat << EOF >> 'download-jquery.sh'
		cd "\$(dirname "\$(readlink -f "\${0}")")/js"

		if wget 'https://code.jquery.com/jquery-3.3.1.min.js'; then
			ln -s 'jquery-3.3.1.min.js' 'jquery.js'
			cd ..
			rm "\${0}"
			echo ''; echo 'done'
			exit 0
		else
			echo 'jQuery download error'
			echo 'check internet connection and run download-jquery.sh again'
			exit 1
		fi
EOF
	chmod 755 'download-jquery.sh'
fi

# remove webadmin code
find -name '*.php' -type f | while read line; do
	echo -n "${line#??} "
	sed -i '/\/\* _webadmin \*\//d' "${line}" > /dev/null 2>&1 && echo ' [ OK ]' || echo ' [FAIL]'
done

# remove webadmin superuser shebang
cd api
for i in shell.sh wicd-config-injection.sh; do
	failed='false'
	echo -n "${i}"
	sed -i '1s/.*/#!\/bin\/dash/' "${i}" > /dev/null 2>&1 || failed='true'
	sed -i '2d' "${i}" > /dev/null 2>&1 || failed='true'
	"${failed}" && echo ' [FAIL]' || echo ' [ OK ]'
done
cd ..

# extract second index.php
echo -n 'index.php'
sed -i '1,41d' index.php > /dev/null 2>&1 && echo ' [ OK ]' || echo ' [FAIL]'

# remove other files
for i in README.TXT description.php; do
	echo -n "${i}"
	rm "${i}" > /dev/null 2>&1 && echo ' [ OK ]' || echo ' [FAIL]'
done

# move range_icons
echo -n 'range_icons'
mv ../lib/range_icons ./range_icons > /dev/null 2>&1 && echo ' [ OK ]' || echo ' [FAIL]'

# remove this script
echo -n 'remove-webadmin-code.sh'
rm "${0}" > /dev/null 2>&1 && echo ' [ OK ]' || echo ' [FAIL]'

echo''; echo 'done!'
echo 'now run download-jquery.sh'
exit 0
