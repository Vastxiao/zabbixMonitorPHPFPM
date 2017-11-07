#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

PORT=$1
TYPE=$2

curl "http://127.0.0.1:9050/phpfpm_${PORT}_status?xml" -s |grep "^<${TYPE}>" | awk -F'<' '{print $2}' |awk -F'>' '{print $2}'

