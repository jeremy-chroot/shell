#!/bin/env bash
a=$(ps -aux |grep wget|wc -l)
i=1
while [ $i -lt $a ]
do
    ps -aux |grep "wget -c"|grep -v grep|head -n1 >/dev/shm/fd.log
    pid1=$(cat /dev/shm/fd.log |awk '{print $2}')
    kill $pid1
    url1=$(cat /dev/shm/fd.log |awk '{print $17}')
    pwd1=$(cat /dev/shm/fd.log |awk '{print $19}'|cut -d. -f2)
    cd /sdb/hh/a$pwd1
    wget -b -c -N -t 0 $url1 -o /dev/shm/wget.$pwd1.log
    rm /dev/shm/fd.log
	i=$((i+1))
done
