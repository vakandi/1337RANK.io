#!/bin/sh
REALRANDOM="$(shuf -i 1-100000 -n 1)"
echo " Before runningscript change your api in getcampusid.rb, then run this script, there is approximatively 40 campus around the world, but you neef to wait until its finish the empty campus id and \033[45;mthe results will be in output_campus$REALRANDOM.txt file\033[0m"

echo "\033[42;mFor a Simple list, look at the file simple_campus.list\033[0m"

echo "\033[42;mIf "Oauth Error" Is displaying, it means there is no campus with this ID\033[0m"
echo "If "Oauth Error" Is displaying, it means there is no campus with this ID"


var=0
echo "" > simple_campus.list
while [ $var -lt 100 ]
do
	var=$((var+1))
	echo "CAMPUS ID: $var" >> simple_campus.list
	echo "$(ruby getcampusid.rb $var | sed 's/\\/\/\n/g' | tr '"' '\n'| sed '1,166d' | head -n -95 | awk '{printf "%s%s",$0,(NR%2==0?ORS:"")}' | awk '{printf "%s%s",$0,(NR%2==0?ORS:"")}' | rev | cut -c4- | rev | grep -w city -A 1)" >> simple_campus.list
	
	echo "\033[42;mCampus ID : $var\033[0m"
done
echo "$(cat simple_campus.list| awk '!NF{$0="NO CAMPUS EXISTING"}1')" > simple_campus.list
