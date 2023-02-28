#!/bin/bash

codes=(200 201 400 401 402 403 404 500 501 502 503)
methods=(GET POST PUT PATCH DELETE)
urls=(/ /favicon.ico /users /prometheus /upload /download /send /allure /profile /realm /admin /status /auth)
agents=(
	"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/2010001 Firefox/107.0"
	"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
	"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/93.0.4585.21"
	"Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15"
	"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)"
	"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/107.0.1418.68"
	"Mozilla/5.0 (compatible; MegaIndex.ru/2.0; +http://megaindex.com/crawler)"
	"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
	"Python-urllib/2.7"
	"Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)"
	"curl/7.86.0"
)
for ((j=0; j<5; j++)); do
	num_str=$(($RANDOM % 901 + 100))
	file_name=$(date -d "- $((4 - j)) days" +"access_%d-%m-%y.log")
	for ((i=1; i<$num_str; i++)); do
		data=$(date -d "- $(( 4 - j)) days - 10 hours + $i minutes + $((15 * i)) seconds" +"[%d/%b/%Y:%H:%M:%S %z]")
		ip=$(($RANDOM % 128 + 1)).$(($RANDOM % 256)).$(($RANDOM % 256)).$(($RANDOM % 256))
		code=${codes[$(($RANDOM % 11))]}
		method=${methods[$(($RANDOM % 5))]}
		agent=${agents[$(($RANDOM % 11))]}
		url=${urls[$(($RANDOM % 13))]}
		bytes=$(($RANDOM % 3000 + 255))
		msg="$ip - - $data \"$method $url HTTP1.1\" $code $bytes \"-\" \"$agent\""
		echo $msg >> $file_name
	done
done
