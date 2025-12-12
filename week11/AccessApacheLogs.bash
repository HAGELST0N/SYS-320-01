#!bin/bash

file="/var/log/apache2/access.log"

#results=$(cat "${file}" | grep "GET /page2.html"| cut -d' ' -f1,7)

#echo "$results"
function getAllLogs()
{
	allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}
function pageCount ()
{
	pageArray=$(cat "$file" | cut -d' ' -f7 | tr -d "[" | sort | uniq -c)
}

pageCount
echo "$pageArray"
