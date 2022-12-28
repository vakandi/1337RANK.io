#!/bin/sh
#while true
#do
	#MakeCoalition
	git pull
	python3 script/rank.py > data/rank.txt
	sh script/make_ranktxt.sh
	sh script/launch_json.sh
	echo "$(cat data/format_final.json | perl -p -e "s/\n//" | rev | cut -c 3- | rev)" > data/data-tmp2.json
	echo "$(cat data/data-tmp2.json|  sed 's# ##g')" > data/data-tmp2.json
	echo "$(cat data/data_sample.json | perl -p -e "s/"200"/$(cat data/data-tmp2.json | rev | sed 's/.$//' | rev ),"201"/" | sed 's/201/"201/')" > data/data.json
	#MakeCoalition
	
	#cp data/data.json .
	#echo "$(cat data/data.json| sed 's/wbousfir/wbousfir\&#128373;/g')" > data/data.json
	#echo "$(cat data/data.json | perl -p -e "s/$(echo "$(cat data/data.json | cut -c31-)" | cut -f1 -d'"')/$(echo "$(cat data/data.json | cut -c31-)" | cut -f1 -d'"')👑/")" > data/data.json
	#cp "photos/medium_$(cat data/data.json | cut -c31- | cut -f1 -d'"' | rev | cut -c5- | rev).jpg" "photos/medium_$(cat data/data.json | cut -c31- | cut -f1 -d'"').jpg"
	#git config pull.rebase true
	#git rebase --continue
	#git pull
	#git add .
	#git commit -m "updaterank$(date | cut -c-16 | tr ' ' '_' | tr ':' '-')"
	#git push
	#echo "\033[1;4m  Attempt to GitPush finish\033[0m"
	#git add *; git commit -m "updaterank$(date | cut -c-16 | tr ' ' '_' | tr ':' '-')"; git push
	echo "\033[42;mRanking Update DONE\033[0m"
#	sleep 900s
#done
