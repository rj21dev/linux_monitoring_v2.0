#!/bin/bash

. ./validator
. ./processor

if [ $# -eq 6 ]; then
	validating $1 $2 $3 $4 $5 $6
	path=$1
	num_subdir=$2
	dir_templ=$3
	num_files=$4
	file_templ=$5
	file_size=$6
	processing
else
	echo 'Usage ./main <absolute_path> <num_subdir> <dir_templ(2-7)> <num_files> <file_templ(2-7).(2-3) <file_size(xxKB<100)>'
fi
