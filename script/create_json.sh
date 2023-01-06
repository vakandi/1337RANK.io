var=1
i=$1
RANKFILE=data/rank_with_coalitions.txt
LOGIN="$(cat $RANKFILE| awk  '{print $2}' | head -$i | tail -1)"
LEVEL="$(cat $RANKFILE | awk  '{print $3}' | head -$i | tail -1)"
COALITION="$(cat $RANKFILE | awk  '{print $4}' | head -$i | tail -1)"
VARTMP=1
VARLOGIN=1
JSON_FMT='"%s": [{"login": "%s", "level": "%s", "coalition": "%s"}], '
printf "$JSON_FMT" "$i" "$LOGIN" "$LEVEL" "$COALITION"
var=$((var+1))
i=$((i-1))
VARTMP=$((VARTMP+1))
VARLOGIN=$((VARLOGIN+1))
