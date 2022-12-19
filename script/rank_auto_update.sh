#!/bin/bash
FOLDER="/root/script1337/ranking"
while true
do
#	touch $FOLDER/mamp/data-tmp.json
#	touch $FOLDER/mamp/data-tmp2.json
#	touch $FOLDER/mamp/data.json
	python3 script/rank.py > data/rank.txt
	sh script/launch_json.sh
	echo "$(cat data/format_final.json | perl -p -e "s/\n//" | rev | cut -c 3- | rev)" > data/data-tmp2.json
	echo "$(cat data/data-tmp2.json|  sed 's# ##g')" > data/data-tmp2.json
	echo "$(cat data/data_sample.json | perl -p -e "s/"200"/$(cat data/data-tmp2.json | rev | sed 's/.$//' | rev ),"201"/")" > data/data.json
	
	#echo "$(cat mamp/data-tmp2.json | perl -p -e "s#"201"#$(cat mamp/data-tmp2.json | rev | sed 's/.$//' | rev )#")" > mamp/data.json
	echo "$(cat data/data.json | sed "s/201/\x22201/")" > data/data.json
	cp data/data.json 1337RANK.io/
	#git add *; git commit -m "updaterank"; git push
	cd 1337RANK.io
	echo "You need to gitpush now"
	sleep 900s
done
