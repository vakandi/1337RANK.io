#!/bin/sh
FOLDER="/root/script1337/ranking"
while true  
do
  python3 $FOLDER/rank.py > $FOLDER/mamp/rank.txt
  sh $FOLDER/launch_json.sh
  echo "" > $FOLDER/mamp/data-tmp.json
  echo "" > $FOLDER/mamp/data-tmp2.json
  echo "" > $FOLDER/mamp/data.json
  echo "$(cat $FOLDER/format_final.json | perl -p -e "s/\n//" | rev | cut -c 3- | rev)" > $FOLDER/mamp/data-tmp.json
#  echo "$(cat $FOLDER/mamp/data-tmp.json| sed 's/.$//')" > $FOLDER/mamp/data-tmp.json
  echo "$(cat $FOLDER/mamp/data-tmp.json|  sed 's# ##g')" >> $FOLDER/mamp/data-tmp2.json
  echo "$(cat $FOLDER/mamp/data-tmp.json| sed '1s/^/var ranks : {/')" > $FOLDER/mamp/data-tmp.json
  echo "$(cat $FOLDER/mamp/data_sample.json | perl -p -e "s/FKJ/$(cat $FOLDER/mamp/data-tmp2.json| rev | cut -c 73- | rev)/")" > $FOLDER/mamp/data.json
#  echo "$(cat $FOLDER/mamp/data.json | awk 'FNR%1')" > $FOLDER/mamp/data.json
  echo "finish"
  sleep 900s  
done
