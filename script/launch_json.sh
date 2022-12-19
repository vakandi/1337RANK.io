var=0
echo "" > data/format_final.json
while [ $var -lt 200 ]
do
	var=$((var+1))
	echo "$(sh script/create_json.sh $var)" >> data/format_final.json
done
