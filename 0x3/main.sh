#!/bin/bash
. ./validator
. ./processor

if [ $# -eq 1 ]; then
	check_param $1
	processing $1
else
	echo "Usage ./main.sh <parameter [1-3]>"
	echo "1) cleaning by log file"
	echo "2) cleaning by creation date"
	echo "3) cleaning by name mask"
fi
