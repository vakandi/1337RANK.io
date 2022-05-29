RANDOMLOGIN="$(openssl rand -base64 3)"
i=$1
JSON_FMT='"%s": [{"login": "%s", "level": "%s"}], '
printf "$JSON_FMT" "$i" "YYY" "0"
