#! /bin/bash
w=$(who | awk {'print $1'} | wc -l)
localtime=$(date | awk {'print $4'})
l1=$(cat /proc/loadavg | awk {'print $1'})
l2=$(cat /proc/loadavg | awk {'print $2'})
l3=$(cat /proc/loadavg | awk {'print $3'})
u=$(cat /proc/uptime | awk {'print $1'})
u=${u%.*}
days=$(expr $u / 86400)
tmp=`expr $u - $days \* 86400`
hours=`expr $tmp / 3600`
min=`expr $tmp - $hours \* 3600`
min=`expr $min / 60`

printf " $localtime up "
if [[ days -eq 0 ]]; then
	printf ""
elif [[ days -eq 1 ]]; then
	printf "1 day,"
else
	printf "$days days,"
fi
if [[ $hours -lt 10 ]]; then
	printf " "
fi
if [[ $hours -eq 0 ]]; then
	if [[ $min -lt 10 ]]; then
		printf " "
	fi
	printf "$min min, $w"
elif [[ $hours -lt 10 ]]; then
	printf "  $hours:$min, $w "
else
	printf " $hours:$min, $w "
fi
if [[ $w -eq 1 ]]; then
	printf "user,"
else
	printf "users,"
fi
printf "  load average: $l1, $l2, $l3"
echo ""
	
