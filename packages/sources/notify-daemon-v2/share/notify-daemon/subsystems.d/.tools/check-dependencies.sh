#!/bin/sh

cd "$(dirname "$(readlink -f ${0})")/.."
checking_success='0' # exit code
echo ''

for i in *; do
	[ "${i}" = '*' ] && break

	if [ -d "${i}" ]; then # check if is link
		if [ -L "${i}" ]; then
			destination_subsystem="$(readlink -f "${i}")"
			destination_subsystem="${destination_subsystem##*/}"
			echo " ${i} is a link to ${destination_subsystem}"
			echo ''
		elif [ -e "${i}/DEPENDENCIES.txt" ]; then # check if has dependencies
			echo " ${i}:"

			# check for while exit code
			if ! \
				cat ${i}/DEPENDENCIES.txt | while read line; do
					if [ -e "./${line}" ]; then # subsystem exists, check if is enabled
						[ -e "./${line}/.subsystem_enabled" ] && \
							echo "  [ OK ]          ${line}" || \
							echo "  [DISABLED]      ${line}"
					else # check if any subsystem provides a dependent subsystem
						provides='false'
						for x in *; do
							[ "${x}" = '*' ] && break
	
							if [ -e "${x}/setup_subsystem-provides-${line}" ]; then
								provides='true'
								break
							fi
						done

						if "${provides}"; then
							echo "  [ASSURED]       ${line}"
						else
							echo "  [NOT EXISTS]    ${line}"
							exit 1 # for ${checking_success}
						fi
					fi
				done
			then
				checking_success='1'
			fi

			echo ''
		else
			echo " ${i} has no dependencies"
			echo ''
		fi
	fi
done

exit "${checking_success}"
