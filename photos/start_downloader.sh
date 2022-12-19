#!/bin/sh
var=0
while [ $var -lt 200 ]
do
	var=$((var+1))
	sh download-photo-student.sh $var
done
