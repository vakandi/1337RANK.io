var=1
i=$1
LOGIN="$(cat data/rank_clean.txt | awk  '{print $2}' | head -$i | tail -1)"
LEVEL="$(cat data/rank_clean.txt | awk  '{print $3}' | head -$i | tail -1)"
COALITION="$(cat data/rank_clean.txt | awk  '{print $4}' | head -$i | tail -1)"
VARTMP=1
VARLOGIN=1
JSON_FMT='"%s": [{"login": "%s", "level": "%s", "coalition": "%s"}], '
printf "$JSON_FMT" "$i" "$LOGIN" "$LEVEL" "$COALITION"
var=$((var+1))
i=$((i-1))
VARTMP=$((VARTMP+1))
VARLOGIN=$((VARLOGIN+1))
