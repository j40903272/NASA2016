#! /bin/bash
rm -f from_tmp
rm -f tmp
IFS=$'\n'
for i in $(cat fail2ban.log | awk {'print $7" "$8'} | sort | uniq); do
	action=$(echo $i | awk {'print $1'} | grep 'Ban')
	if [ "$action" != "" ]; then
		ip=$(echo $i | awk {'print $2'} | grep -E -o \
		"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")
		if [ "$ip" != "" ] && [ "$ip" != "0.0.0.0" ]; then
			country=$(geoiplookup $ip | awk {'print $4 " " $5'} | grep -v "IP\+")
		fi
		if [ "$country" != "" ]; then
			echo $country >> from_tmp
		fi
	fi
done
cat from_tmp | sort -n | uniq -c | sort -nr
rm -f from_tmp