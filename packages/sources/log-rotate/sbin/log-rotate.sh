#!/bin/sh
# log-rotate.sh
# 24.10.2020 - 02.11.2020

# hardcoded options
INSTALL_DIR='/usr/local'

# Import configuration
if ! . ${INSTALL_DIR}/etc/log-rotate.rc > /dev/null 2>&1; then
	echo 'config import failed'
	exit 1
fi

# Secure log
if [ ! -e "${LOG}" ]; then
	echo -n '' > ${LOG}
	chmod 600 "${LOG}"
	chown root:adm "${LOG}"
fi

# Process logs
echo "$(date "+${LOG_DATE_FORMAT}") log-rotate.sh started" >> ${LOG}
for log in ${LOGS_TO_ROTATE}; do
	if [ -e "${log}" ]; then
		if [ -s "${log}" ]; then
			today="$(date "+${DATE_FORMAT}")"

			echo "$(date "+${LOG_DATE_FORMAT}") rotating log ${log}" >> ${LOG}
			cp -p "${log}" "${log}.${today}" >> ${LOG} 2>&1

			echo "$(date "+${LOG_DATE_FORMAT}") clearing log ${log}" >> ${LOG}
			echo -n '' > ${log}

			echo "$(date "+${LOG_DATE_FORMAT}") compressing log ${log}" >> ${LOG}
			gzip -9 "${log}.${today}" >> ${LOG} 2>&1

			if [ ! "${MOVE_LOGS_TO}" = '' ]; then
				echo "$(date "+${LOG_DATE_FORMAT}") moving ${log} to ${MOVE_LOGS_TO}"
				mv "${log}.${today}.gz" "${MOVE_LOGS_TO}" >> ${LOG} 2>&1
			fi

			unset today
		else
			echo "$(date "+${LOG_DATE_FORMAT}") ${log} is empty - not rotating" >> ${LOG}
		fi
	else
		echo "$(date "+${LOG_DATE_FORMAT}") ${log} not exists - not rotating" >> ${LOG}
	fi
done
echo "$(date "+${LOG_DATE_FORMAT}") log-rotate.sh ended" >> ${LOG}

echo '' >> ${LOG}
exit 0
