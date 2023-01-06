#!/bin/sh
var=1
RANKFILE=data/rank_with_coalitions.txt
echo "" > $RANKFILE
echo "$(cat data/rank.txt | rev | cut -c4- | rev)" > data/rank.tmp
while [ $var -lt 200 ]
do
	login1337="$(cat data/rank.tmp | awk '{print $2}' | head -n$var | tail -n1)"
	COALITION="$(cat data/coalitions.txt | grep $login1337 |  awk '{print $4}' | cut -c2- | rev | cut -c3- | rev)"
	echo "$(cat data/rank.tmp | head -n$var | tail -n1 | sed "s/$/$COALITION/g")" >> $RANKFILE
	echo "Adding $COALITION to $login1337 into the line $var"
	var=$((var+1))
done
echo "$(cat $RANKFILE | sed '1d')" > $RANKFILE
