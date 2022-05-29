#!/bin/sh
var=0
while [ $var -lt 150 ]
do
	var=$((var+1))
	sh download-pp.sh $var
done
