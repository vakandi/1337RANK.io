var=0
echo "" > format_final.json
while [ $var -lt 150 ]
do
	var=$((var+1))
	echo "$(sh create_json.sh $var)" >> format_final.json
done
while [ $var -lt 197 ]
do
	var=$((var+1))
	echo "$(sh create-last50.sh $var)" >> format_final.json
done
