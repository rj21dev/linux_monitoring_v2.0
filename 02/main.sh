#!/bin/bash

. ./validator
. ./processor

if [ "$#" -eq 3 ]; then
	path=$(pwd)/
	validating $1 $2 $3
	dir_templ=$1
	file_templ=$2
	file_size=$3
	processing
else
	echo 'Usage ./main <dir_templ(2-7)> <file_templ(2-7).(2-3) <file_size(xxMB<=100)>'
fi
