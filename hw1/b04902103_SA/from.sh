#! /bin/bash
rm -f from_tmp
IFS=$'\n'
for i in $(last -i | sort -n | awk {'print $3'} | uniq); do
	ip=$(echo $i | grep -E -o \
	"(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")
	if [ "$ip" != "" ] && [ "$ip" != "0.0.0.0" ]; then
		country=$(geoiplookup $ip | awk {'print $4 " " $5'} | grep -v "IP\+")
	fi
	if [ "$country" != "" ]; then
		echo $country >> from_tmp
	fi
done
cat from_tmp | sort -n | uniq -c | sort -n
rm -f from_tmp
