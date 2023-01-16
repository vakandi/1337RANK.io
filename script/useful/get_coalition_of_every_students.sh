var=0
FILE=../../data/coalitions.txt
echo "" > $FILE
while [ $var -lt 204 ]
do
	var=$((var+1))
	python3 get_coalitions_of_onestudent.py $(cat rank.txt | awk '{print $2}' | head -n$var | tail -n1) >> $FILE
	echo "Getting the student number : $var"
done
