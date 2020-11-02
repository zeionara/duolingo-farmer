export delay=1 # seconds
export time=$(date +%s)
export tmp_file_name=_query.json

export n_points=${1:-180}
export n_points_per_query=18

if [ "$((n_points % n_points_per_query))" -eq "0" ]; then
    export i=0
    while [ $i -lt $((n_points / n_points_per_query)) ]; do
        export id=$(openssl rand -base64 16)
        envsubst < query.json > $tmp_file_name
        curl "https://www.duolingo.com/2017-06-30/sessions/$id" \
            -X 'PUT' \
            -H 'authority: www.duolingo.com' \
            -H 'accept: application/json' \
            -H "authorization: Bearer $DUOLINGO_TOKEN" \
            -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36' \
            -H "idempotency-key: $id" \
            -H 'content-type: application/json; charset=UTF-8' \
            -H 'origin: https://www.duolingo.com' \
            -H 'sec-fetch-site: same-origin' \
            -H 'sec-fetch-mode: cors' \
            -H 'sec-fetch-dest: empty' \
            -H 'referer: https://www.duolingo.com/practice' \
            -H 'accept-language: en-US,en;q=0.9,ru-RU;q=0.8,ru;q=0.7' \
            --data-binary '@$tmp_file_name' \
            --compressed && echo '' && sleep $delay && let i=i+1
    done
    rm $tmp_file_name
else
    echo "Need a number which can be divided by $n_points_per_query without a remainder!"
fi
