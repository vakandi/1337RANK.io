var=0
echo "" > ../data/coalitions.txt
while [ $var -lt 200 ]
do
	var=$((var+1))
	python3 get_coalitions_of_onestudent.py $(cat rank.txt | awk '{print $2}' | head -n$var | tail -n1) >> ../data/coalitions.txt
	echo "LOOP $var"
done
