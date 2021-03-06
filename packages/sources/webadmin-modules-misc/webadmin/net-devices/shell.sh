#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, readlink, cat, tr, grep, awk, localdns.sh, sed, ebtables, tac
# Optional command stack: firewall.sh

# Import config
. "${0%/*}/config.rc"

# Import PATH variable
. ./lib/shell/path.rc

# Import routing listing library
. ./lib/shell/net-routing-list.rc

# No links are allowed
DHCP_RESERVATIONS_CONFIG=$(readlink -f "${DHCP_RESERVATIONS_CONFIG}")
LOCALDNS_HOSTS_RESERVATIONS=$(readlink -f "${LOCALDNS_HOSTS_RESERVATIONS}")

case $1 in
	'list-devices')
		# Execution trip: Main -> parse_reserved() -> parse_dhcpd_reservations()
		#	Main -> parse_dhcpd() -> check_reserved() -> check_status() -> buttons_reserve_ban()

		IPs='' # already listed devices

		# helpers
		print_S1()
		{
			echo -n "$1"
		}
		print_S2()
		{
			echo -n "$2"
		}
		print_S6()
		{
			echo -n "$6"
		}

		# parse config with reserved devices
		parse_dhcpd_reservations()
		{
			cat ${DHCP_RESERVATIONS_CONFIG} | grep -v '^#' | while read line; do
				[ "$1" = "`print_S2 $line`" ] && print_S6 $line | tr -d ';'
			done
		}

		# render reserve and ban buttons (check if configs exists) # patch 16.06.2020
		if [ ! -e ${DHCP_RESERVATIONS_CONFIG} ] || [ ! -e ${LOCALDNS_HOSTS_RESERVATIONS} ]; then
			buttons_reserve()
			{
				echo -n ''
			}
		else
			buttons_reserve()
			{
				if echo -n "$2" | grep 'lan' > /dev/null 2>&1; then
					name=$2; ip=$1; mac=''
				else
					name=$3; ip=$1; mac=$2
				fi
				$0 net-reserve check $name $ip $mac && \
					reserve_button='<td style="border: none;"><button class="system_button" name="release" type="submit" value="'"$host_ip $2 $3"'" onclick="return confirm('"'"'Are you sure?'"'"');">Release</button></td>' || \
					reserve_button='<td style="border: none;"><button class="system_button" name="reserve" type="submit" value="'"$host_ip $2 $3"'">Reserve</button></td>'

				echo ${reserve_button}
			}
		fi
		buttons_reserve_ban()
		{
			host_ip=`echo -n "$1" | tr '.' '_'`

			[ "`$0 net-block check $1 $2`" = 'banned' ] && \
				ban_button='<td style="border: none;"><button class="system_button" name="unban" type="submit" value="'"$host_ip $2"'">Unban</button></td>' || \
				ban_button='<td style="border: none;"><button class="system_button" name="ban" type="submit" value="'"$host_ip $2"'">Ban</button></td>'

			echo -n "${ban_button}$(buttons_reserve $@)" # patch 16.06.2020
		}

		# check device status
		check_status()
		{
			if [ "$2" = 'active' ]; then
				echo -n '<span style="font-weight: bold;">&#10004;</span>'
			elif [ "$2" = 'free' ]; then
				echo -n '<span style="font-weight: bold;">&#10008;</span>'
			elif [ "$2" = 'abandoned' ]; then
				echo -n '<span>&#9760;</span>'
			else
				echo -n '<span style="font-weight: bold;">?</span>'
			fi
		}

		# render reserved devices
		parse_reserved()
		{
			[ "${1%${1#?}}"x = '#x' ] && return
			ip=`print_S1 $line`
			hostname=`print_S2 $line`
			#mac=`parse_arp $ip`
			mac=`parse_dhcpd_reservations $hostname`

			echo "<tr><td align="center">`check_status $ip`</td><td>$hostname</td><td>$ip</td><td>$mac</td><td align="center">&#10004;</td>`buttons_reserve_ban $ip $mac $hostname`</tr>"
		}

		# render reserved tick
		check_reserved()
		{
			reserved=false
			[ -e "${LOCALDNS_HOSTS_DIR}" ] || return 1
			cd ${LOCALDNS_HOSTS_DIR}
			for i in *; do
				content=`cat $i`
				value=`print_S1 $content`
				[ "$value" = "$1" ] && reserved=true && break
			done
			$reserved && echo -n '&#10004;' || echo -n '&#10008;'
		}

		# parse dhcpd leases - render rest devices
		parse_dhcpd()
		{
			# $4 is 'active/free' with hostname, empty without
			case $4 in
				'')
					# IP MAC
					reserved=`check_reserved $1`
					if ! echo $IPs | grep $1 > /dev/null 2>&1; then
						echo "<tr><td align="center">`check_status $1 $3`</td><td><!-- hostname --></td><td>$1</td><td>$2</td><td align="center">$reserved</td>`buttons_reserve_ban $1 $2`</tr>"
						IPs="$IPs $1"
					fi
				;;
				*)
					# Hostname IP MAC
					reserved=`check_reserved $2`
					NAME=`echo -n "$1" | tr -d '"'`
					if ! echo $IPs | grep $2 > /dev/null 2>&1; then
						echo "<tr><td align="center">`check_status $2 $4`</td><td>${NAME}${lan_domain}</td><td>$2</td><td>$3</td><td align="center">$reserved</td>`buttons_reserve_ban $2 $3 $NAME`</tr>"
						IPs="$IPs $2"
					fi
				;;
			esac
		}

		# Main

		# add reserved
		if [ -e "${LOCALDNS_HOSTS_DIR}" ]; then
			cat ${LOCALDNS_HOSTS_RESERVATIONS} | while read line; do
				parse_reserved $line
			done
		fi

		# read leases file
		awk 'BEGIN {
			while((getline line < "maclist") > 0) {
				mac[line]
			}
			RS="}"
			FS="\n"
		}
		/lease/{
			hostname=""
			for(i=1;i<=NF;i++) {
				gsub(";","",$i)
				if ($i ~ /lease/) {
					m=split($i, IP," ")
					ip=IP[2]
				}
				if( $i ~ /hardware/ ) {
					m=split($i, hw," ")
					ether=hw[3]
				}
				if ( $i ~ /set ClientHost/) {
					m=split($i,ch, " ")
					hostname=ch[4]
				}
				else if ( $i ~ /client-hostname/) {
					m=split($i,ch, " ")
					hostname=ch[2]
				}
				if ( $i ~ /  binding state active/) {
					active="active"
				}
				else if ( $i ~ /  binding state free/) {
					active="free"
				}
				else if ( $i ~ /  binding state abandoned/) {
					active="abandoned"
				}
			}
			print hostname " " ip " " ether " " active
		}' ${DHCP_LEASES} | tac | while read line; do
			[ "$line" = 'This' ] && break # remove "This" from the IP field (occurs when dhcp.leases is empty)
			parse_dhcpd $line
		done
	;;
	'net-reserve')
		tab=$'\t'
		case $2 in
			'add')
				echo "reserve add $3"
				echo "<br>IP: $4, MAC: $5"

				echo -n "$3" | grep '.lan' > /dev/null 2>&1 && hostname="$3" || hostname="${3}.lan"

				cat ${DHCP_RESERVATIONS_CONFIG} | grep "host $hostname { hardware ethernet $5; fixed-address $4; }" > /dev/null 2>&1 && exit 1
				cat ${LOCALDNS_HOSTS_RESERVATIONS} | grep "${4}${tab}${hostname}" > /dev/null 2>&1 && exit 1

				echo "host $hostname { hardware ethernet $5; fixed-address $4; }" >> ${DHCP_RESERVATIONS_CONFIG}
				echo "${4}\t${hostname}" >> ${LOCALDNS_HOSTS_RESERVATIONS} # bash requires -e parameter

				localdns.sh
			;;
			'del')
				[ "$3" = '' ] && exit 1
				[ "$4" = '' ] && exit 1
				[ "$5" = '' ] && exit 1

				sed -i '/host '"$3"' { hardware ethernet '"$5"'; fixed-address '"$4"'; }/d' ${DHCP_RESERVATIONS_CONFIG}
				sed -i '/'"$4"'	'"$3"'/d' ${LOCALDNS_HOSTS_RESERVATIONS}
			;;
			'check')
				RESERVED=false

				if [ "$5" = '' ]; then
					cat ${DHCP_RESERVATIONS_CONFIG} | grep "host $3 { " | grep "fixed-address $4; }" > /dev/null 2>&1 && RESERVED=true
				else
					cat ${DHCP_RESERVATIONS_CONFIG} | grep "host $3 { hardware ethernet $5; fixed-address $4; }" > /dev/null 2>&1 && RESERVED=true
				fi
				cat ${LOCALDNS_HOSTS_RESERVATIONS} | grep "${4}${tab}${3}" > /dev/null 2>&1 && RESERVED=true

				$RESERVED && exit 0 || exit 1
			;;
			'details')
				echo '<h3>DHCP</h3><pre>'
				cat ${DHCP_RESERVATIONS_CONFIG}
				echo '</pre><h3>DNS</h3><pre>'
				cat ${LOCALDNS_HOSTS_RESERVATIONS}
				if [ -e "${LOCALDNS_HOSTS_APPLIED}" ]; then
					echo '</pre><h3>DDNS</h3><pre>'
					cat ${LOCALDNS_HOSTS_APPLIED}
				fi
				echo '</pre><h3>ARP</h3><pre>'
				$0 net-routing-list arp
				echo '</pre><h3>IPv6 neighborhood</h3><pre>'
				$0 net-routing-list ipv6-neighbor
				echo '</pre><h3>DHCP leases</h3><pre>'
				cat ${DHCP_LEASES}
				echo '</pre><br>'
			;;
		esac
	;;
	'net-block')
		[ "$3" = '' ] && exit 1 # if no ip
		[ "$4" = '' ] && exit 1 # if no mac

		# Import firewall.sh settings (if firewall package is installed)
		if [ ! "$(command -v firewall.sh)" = '' ]; then
			. $(firewall.sh where-are-you)/networks.rc
			ebtables_ban_inputBridge="--logical-in $LAN " # space for list-devices net-block check
		fi

		case $2 in
			'ban')
				# LAN
				ebtables -I FORWARD ${ebtables_ban_inputBridge}-s $4 -j DROP
				ebtables -I INPUT ${ebtables_ban_inputBridge}-s $4 -j DROP # replaces iptables rules
			;;
			'unban')
				# LAN
				ebtables -D FORWARD ${ebtables_ban_inputBridge}-s $4 -j DROP
				ebtables -D INPUT ${ebtables_ban_inputBridge}-s $4 -j DROP # replaces iptables rules
			;;
			'check')
				# read from ebtables
				ebtables -t filter --list --Lmac2 | grep '^-s '"${4}"' '"${ebtables_ban_inputBridge}"'-j DROP' > /dev/null 2>&1 && \
					echo -n 'banned' || \
					echo -n 'free'
			;;
		esac
	;;
esac

exit 0
