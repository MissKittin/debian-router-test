#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, readlink, cat, grep, sed

# Settings
PPPD_CHAP_SECRETS='/etc/ppp/chap-secrets'
RACOON_PSK_SECRET='/usr/local/etc/racoon/psk.txt'

# Import PATH variable
. ./lib/shell/path.rc

# No links are allowed
PPPD_CHAP_SECRETS=$(readlink -f "${PPPD_CHAP_SECRETS}")
RACOON_PSK_SECRET=$(readlink -f "${RACOON_PSK_SECRET}")

case $1 in
	'vpn')
		tab=$'\t'
		print_S1()
		{
			echo -n "$1"
		}
		print_S3()
		{
			echo -n "$3"
		}
		case $2 in
			'get')
				# Can get only login, no passwords
				case $3 in
					'pptp')
						string=`cat ${PPPD_CHAP_SECRETS} | grep 'pptpd'`
						print_S1 $string
					;;
					'l2tp')
						string=`cat ${PPPD_CHAP_SECRETS} | grep 'xl2tpd'`
						print_S1 $string
					;;
				esac
			;;
			'set')
				[ "$5" = '' ] && exit 0
				case $3 in
					'pptp')
						string=`cat ${PPPD_CHAP_SECRETS} | grep 'pptpd'`
						login=`print_S1 $string`
						password=`print_S3 $string`
						case $4 in
							'login')
								[ "$login" = "$5" ] && exit 0
								sed -i 's/'"$string"'/'"${5}${tab}"'pptpd'"${tab}${password}${tab}${tab}"'/g' ${PPPD_CHAP_SECRETS}
							;;
							'password')
								[ "$password" ="$5" ] && exit 0
								sed -i 's/'"$string"'/'"${login}${tab}"'pptpd'"${tab}${5}${tab}${tab}"'/g' ${PPPD_CHAP_SECRETS}
							;;
						esac
					;;
					'l2tp')
						string=`cat ${PPPD_CHAP_SECRETS} | grep 'xl2tpd'`
						login=`print_S1 $string`
						password=`print_S3 $string`
						server_password_string=`cat ${RACOON_PSK_SECRET}`
						server_password=`cat ${RACOON_PSK_SECRET} | awk '{print $2}'`
						case $4 in
							'login')
								[ "$login" = "$5" ] && exit 0
								sed -i 's/'"$string"'/'"${5}${tab}"'xl2tpd'"${tab}${password}${tab}${tab}"'/g' ${PPPD_CHAP_SECRETS}
							;;
							'password')
								[ "$password" = "$5" ] && exit 0
								sed -i 's/'"$string"'/'"${login}${tab}"'xl2tpd'"${tab}${5}${tab}${tab}"'/g' ${PPPD_CHAP_SECRETS}
							;;
							'serverpassword')
								[ "$server_password" = "$5" ] && exit 0
								sed -i 's/'"$server_password_string"'/* '"$5"'/g' ${RACOON_PSK_SECRET}
							;;
						esac
					;;
				esac
			;;
		esac
	;;
esac

exit 0
