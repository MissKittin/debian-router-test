#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash

# Import PATH variable
. ./lib/shell/path.rc

case "${1}" in
	'splash-info')
		# Global settings
		newline='<br>'
		export LANG='C'

		plugin_dir="$(dirname "${0}")"
		if [ -e "${plugin_dir}/modules-cache.rc" ]; then
			. "${plugin_dir}/modules-cache.rc"
		else
			for module in ${plugin_dir}/modules/*.rc; do
				[ "${module}" = "${plugin_dir}/modules/*.rc" ] && break
				. "${module}"
			done
		fi
	;;
esac

exit 0
