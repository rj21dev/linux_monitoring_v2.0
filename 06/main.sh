#!/bin/bash

function chk_log {
	if [ $(find ../0x4/ -name "access_*.log" | wc -l) -eq 0 ]; then
		echo "Error: No access.log files." 
		exit 1
	fi
}

function chk_html {
	if ! [ -f ./index.html ]; then
		echo "Error: No index.html"
		exit 1
	fi
}

if [ "$#" -ne 1 ]; then
	echo "Usage: ./main.sh [1-3]"
	echo "1) View report in terminal"
	echo "2) Generate report in html format"
	echo "3) Start web-server with statistics"
	exit 1
fi

case $1 in
	1) chk_log; goaccess -f ../0x4/access_*.log --log-format=COMBINED ;;
	2) chk_log; goaccess -f ../0x4/access_*.log --log-format=COMBINED -o index.html ;;
	3) chk_html; docker run -dp 8888:80 -v ${PWD}:/usr/share/nginx/html nginx > /dev/null ;;
esac

# Copy from vm to host
#scp user@localhost:linux_monitoring_v2.0/0x4/index.html ~/index.html
