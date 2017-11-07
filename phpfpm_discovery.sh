#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin

#echo $0
cd $(dirname $0)
HOMEPATH=$(pwd)


list=( $(sudo ss -tlnp 2>/dev/null |grep php-fpm |awk '{print $4}' |awk -F':' '{print $2}') )
#echo -e "${list[*]}\n\n"

#[ x$list = x ] && echo "ERROR: no discovery data list found." >&2 && exit 1
# 将列表list，转换为发送给zabbx的json数据。
length=${#list[@]}
#printf "{\n"
printf '{\"data\":[ '
for ((i=0;i<$length;i++))
do
    printf "{\"{#PORT}\":\"${list[$i]}\"}"

    if [ $i -lt $[ $length-1 ] ];then
      printf ','
    fi
done
#printf  "\n\t]\n"
#printf "}\n"
printf  " ]}"

