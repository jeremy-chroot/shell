#!/bin/bash 
disk1=sda1
used=$(df |grep $disk1|awk '{print $5}'|cut -d % -f1) 
used1=$((used))
if [ $used1 -ge 30 ]
    then
        mn=$(df|grep $disk1|awk '{print $6}')
        use=$(df|grep $disk1|awk '{print $5}')
        Avail=$(df -h|grep $disk1|awk '{print $4}')
        echo "挂载点为$mn的磁盘已使用$use ,目前剩余$Avail"
fi