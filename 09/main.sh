#!/bin/bash

while true; do
	exec 1> ${PWD}/index.html
	echo "# HELP cpu_usage This metrics show cpu usage"
	echo "# TYPE cpu_usage gauge"
	echo "cpu_usage $(cat /proc/loadavg | awk '{print $1}')"
	echo "# HELP disk_space_used"
	echo "# TYPE disk_space_used gauge"
	echo "disk_space_used $(df / | awk 'NR==2{printf("%.2f", $3/1024/1024)}')"
	echo "# HELP disk_space_free"
	echo "# TYPE disk_space_free gauge"
	echo "disk_space_free $(df / | awk 'NR==2{printf("%.2f", $4/1024/1024)}')"
	echo "# HELP disk_capacity"
	echo "# TYPE disk_capacity gauge"
	echo "disk_capacity $(df  / | awk 'NR==2{printf("%.2f", $2/1024/1024)}')"
	echo "# HELP memory_used"
        echo "# TYPE memory_used gauge"
        echo "memory_used $(free | awk 'NR==2{printf("%.2f", ($3 + $6)/1024/1024)}')"
        echo "# HELP memory_free"
        echo "# TYPE memory_free gauge"
	echo "memory_free $(free | awk 'NR==2{printf("%.2f", $4/1024/1024)}')"
        echo "# HELP memory_total"
        echo "# TYPE memory_total gauge"
	echo "memory_total $(free | awk 'NR==2{printf("%.2f", $2/1024/1024)}')"
	mv ${PWD}/index.html ${PWD}/metrics/index.html
	sleep 3
done
