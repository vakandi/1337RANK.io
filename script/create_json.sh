FOLDER="/root/script1337/ranking"
var=1
i=$1
LOGIN="$(cat $FOLDER/rank.txt | awk  '{print $2}' | head -$i | tail -1)"
LEVEL="$(cat $FOLDER/rank.txt | awk  '{print $3}' | head -$i | tail -1)"
VARTMP=1
VARLOGIN=1
JSON_FMT='"%s": [{"login": "%s", "level": "%s"}], '
printf "$JSON_FMT" "$i" "$LOGIN" "$LEVEL"
var=$((var+1))
i=$((i-1))
VARTMP=$((VARTMP+1))
VARLOGIN=$((VARLOGIN+1))
