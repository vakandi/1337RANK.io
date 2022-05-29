#!/bin/sh
FOLDER="/root/script1337/ranking"
while true  
do
  python3 $FOLDER/rank.py > $FOLDER/mamp/rank.txt
  echo "" > $FOLDER/mamp/index.html
  echo "$(cat $FOLDER/index.html)" > $FOLDER/mamp/index.html
  txt2html $FOLDER/mamp/rank.txt >> $FOLDER/mamp/index.html
  sleep 1000  
done
