#!/bin/env bash
i=0
while [ $i -lt 1 ]
do
sizesdb1=$(df|grep /dev/sdb1|awk '{print $3}')
sizesdc1=$(df|grep /dev/sdc1|awk '{print $3}')
sleep 1
sizesdb2=$(df|grep /dev/sdb1|awk '{print $3}')
sizesdc2=$(df|grep /dev/sdc1|awk '{print $3}')
time2=$(date "+%H:%M:%S")
rws1=$(ps -aux|grep "wget -b"|grep -v grep|wc -l)
rws2=$(ps -aux|grep "wget -c"|grep -v grep|wc -l)
echo --------------------------
echo "/sdb "$time2 $(echo "scale=8;($sizesdb2 - $sizesdb1)"/1024|bc)'M/s'|grep -v ^"/sdb $time2 0M/s"
echo "/sdc "$time2 $(echo "scale=8;($sizesdc2 - $sizesdc1)"/1024|bc)'M/s'|grep -v ^"/sdc $time2 0M/s"
echo Total download tasks -b:$rws1
echo Total download tasks -c:$rws2
#i=$((i+1))
done
