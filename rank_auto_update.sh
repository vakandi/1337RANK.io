#!/bin/sh
git pull
#Get Levels of students from api
#ruby script/rank.rb > data/rank_without_coalitions.txt
ruby script/rank_without_bot_fix.rb > data/rank_without_coalitions.txt

#Fixing not existing files error on ruby
touch data/data-tmp.json
touch data/format_final.json

#Make rank
ruby script/update_rank_without_bot_fix.rb

#Shell Version for the backend
#sh script/make_rank.sh

#Remove temp files
rm data/data-tmp.json
rm data/format_final.json
rm data/rank.tmp
rm data/rank_without_coalitions.txt
rm data/rank_with_coalitions.txt

echo "\033[42;mRanking Update DONE\033[0m"
