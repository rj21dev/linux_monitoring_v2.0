#!/bin/bash

codes=(200 201 400 401 402 403 404 500 501 502 503)
methods=(GET POST PUT PATCH DELETE)
agents=(Mozilla "Google Chrome" Opera Safari "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
ip=$(($RANDOM % 128)).$(($RANDOM % 256)).$(($RANDOM % 256)).$(($RANDOM % 256))
echo $ip
echo ${codes[$(($RANDOM % 11))]}
echo ${methods[$(($RANDOM % 5))]}
echo ${agents[$(($RANDOM % 8))]}
