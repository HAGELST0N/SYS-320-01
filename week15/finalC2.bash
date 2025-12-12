#!/bin/bash

compLines=$(grep -f "$2" "$1")
echo "$compLines" | cut -d' ' -f1,4,7 | tr -d '[' >report.txt
