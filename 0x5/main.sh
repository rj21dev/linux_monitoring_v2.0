#!/bin/bash

. ./validator
. ./processor

if [ $# -ne 1 ]; then
	echo "Usage: ./main.sh [1-4]"
	echo "1) Print all entries sorted by response code"
	echo "2) Print all unique IPs found in the entries"
	echo "3) Print all requests with errors (response code - 4xx or 5xx)"
	echo "4) Print all unique IPs found among the erroneous requests"
	exit 1
else
	validating $1
	processing $1
fi
