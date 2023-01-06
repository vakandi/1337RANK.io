#!/bin/sh
var=0
while [ $var -lt 200 ]
do
	var=$((var+1))
	login="$(cat rank.txt | awk  '{print $2}' | head -n $var |tail -1)"
	wget https://cdn.intra.42.fr/users/$login.jpg -O medium_$login.jpg
done
