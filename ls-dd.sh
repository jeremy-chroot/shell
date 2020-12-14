#!/bin/env bash
read -p "请输入您需要监控的磁盘:" disk1
test -z $disk1&&echo error&&exit
i=0
while [ $i -lt 1 ]
do
sizesdd1=$(df|grep -v Filesystem|grep $disk1|head -n1|awk '{print $3}')
sleep 1
sizesdd2=$(df|grep -v Filesystem|grep $disk1|head -n1|awk '{print $3}')
timesdd2=$(date "+%H:%M:%S")
echo /$disk1 $timesdd2 $(echo "scale=8;($sizesdd2 - $sizesdd1)"/1024|bc)'M/s'|grep -v ^"/$disk1 $timesdd2 0M/s"
done