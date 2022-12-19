#!/bin/sh
var=1
echo "" > data/rank_clean.txt
echo "$(cat data/rank.txt | rev | cut -c4- | rev)" > data/rank.tmp
while [ $var -lt 200 ]
do
	login1337="$(cat data/rank.tmp | awk '{print $2}' | head -n$var | tail -n1)"
	COALITION="$(cat data/coalitions.txt | grep $login1337 |  awk '{print $4}' | cut -c2- | rev | cut -c3- | rev)"
	echo "$(cat data/rank.tmp | head -n$var | tail -n1 | sed "s/$/$COALITION/g")" >> data/rank_clean.txt
	echo "Adding $COALITION to $login1337 into the line $var"
	var=$((var+1))
done
echo "$(cat data/rank_clean.txt | sed '1d')" > data/rank_clean.txt
