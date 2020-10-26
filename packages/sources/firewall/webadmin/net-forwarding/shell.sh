#!/usr/local/share/router/webadmin/share/webadmin/lib/shell/superuser.sh /bin/dash
#?php has_superuser_shebang
# Command stack: dash, firewall.sh, cat, grep

# Import PATH variable
. ./lib/shell/path.rc

# Import interfaces library
. ./lib/shell/list-interfaces.rc

# Import iptables settings listing library
. ./lib/shell/list-iptables-settings.rc

case $1 in
	'generate-interfaces')
		for i in wan wifi-in ppp lan; do
			interface=`$0 interfaces $i print`
			echo '<option value="'"$interface"'">'"$interface"'</option>'
		done
	;;
	'forward')
		case $2 in
			'add')
				# $3 - port, $4 - protocol, $5 - input port, $6 - destination ip, $7 - output port

				SETTINGS=`firewall.sh where-are-you`
				input_iface=`cat $SETTINGS/networks.rc | grep "$5"`
				input_type=${input_iface%=*}
				output_iface=`cat $SETTINGS/networks.rc | grep "$7"`
				output_type=${output_iface%=*}

				[ "$5" = "$7" ] && exit 1 # if eg eth0==eth0, not necessary

				[ "$3" = '' ] && exit 1
				[ "$4" = '' ] && exit 1
				[ "$5" = '' ] && exit 1
				[ "$6" = '' ] && exit 1
				[ "$7" = '' ] && exit 1

				if [ "$4" = 'tcpudp' ]; then
					# Write to config file
					echo '' >> $SETTINGS/forwarding.rc
					echo '$iptables -t nat -A PREROUTING -i $'"$input_type"' -p tcp --dport '"$3"' -j DNAT --to-destination '"$6" >> $SETTINGS/forwarding.rc
					echo '$iptables -A FORWARD -p tcp -o $'"$output_type"' -d '"$6"' --dport '"$3"' -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT' >> $SETTINGS/forwarding.rc
					echo '$iptables -t nat -A PREROUTING -i $'"$input_type"' -p udp --dport '"$3"' -j DNAT --to-destination '"$6" >> $SETTINGS/forwarding.rc
					echo '$iptables -A FORWARD -p udp -o $'"$output_type"' -d '"$6"' --dport '"$3"' -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT' >> $SETTINGS/forwarding.rc

					# Apply
					iptables -t nat -A PREROUTING -i $5 -p tcp --dport $3 -j DNAT --to-destination $6
					iptables -A FORWARD -p tcp -o $7 -d $6 --dport $3 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
					iptables -t nat -A PREROUTING -i $5 -p udp --dport $3 -j DNAT --to-destination $6
					iptables -A FORWARD -p udp -o $7 -d $6 --dport $3 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
				else
					# Write to config file
					echo '' >> $SETTINGS/forwarding.rc
					echo '$iptables -t nat -A PREROUTING -i $'"$input_type"' -p '"$4"' --dport '"$3"' -j DNAT --to-destination '"$6" >> $SETTINGS/forwarding.rc
					echo '$iptables -A FORWARD -p '"$4"' -o $'"$output_type"' -d '"$6"' --dport '"$3"' --state NEW,RELATED,ESTABLISHED -j ACCEPT' >> $SETTINGS/forwarding.rc

					# Apply
					iptables -t nat -A PREROUTING -i $5 -p $4 --dport $3 -j DNAT --to-destination $6
					iptables -A FORWARD -p $4 -o $7 -d $6 --dport $3 --state NEW,RELATED,ESTABLISHED -j ACCEPT
				fi
			;;
		esac
	;;
esac

exit 0
