#!/bin/sh
git pull
#Get Levels of students from api
python3 script/rank.py > data/rank_without_coalitions.txt
#Make rank
sh script/make_rank.sh
#Remove temp files
rm data/data-tmp.json
rm data/format_final.json
rm data/rank.tmp
rm data/rank_without_coalitions.txt
rm data/rank_with_coalitions.txt

echo "\033[42;mRanking Update DONE\033[0m"
