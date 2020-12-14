#!/bin/env bash
read  -p "请输入您需要掷硬币的次数:" frequency
#frequency=20
cat /dev/urandom|head -c $frequency|od -x |awk '{print$2,$3,$4,$5,$6}'|tr -d " \n"|cut -c1-$frequency|tr -d "\n" |tr 0-7 1|tr 8-9a-f 0 >/dev/shm/01.txt
#tr -dc '0-1' </dev/urandom|head -c $frequency >/dev/shm/01.txt
cat /dev/shm/01.txt|tr 1 "\n" >/dev/shm/1.txt
cat /dev/shm/01.txt|tr 0 "\n" >/dev/shm/0.txt

strz=$(cat /dev/shm/1.txt|xargs echo -n|tr -d " "|wc -m)
strz2=$(cat /dev/shm/1.txt|wc -L)
strzb=$(echo "scale=20; $strz*100/$frequency"|bc)

strf=$(cat /dev/shm/0.txt|xargs echo -n|tr -d " "|wc -m)
strf2=$(cat /dev/shm/0.txt|wc -L)
strfb=$(echo "scale=20;$strf*100/$frequency"|bc)
echo 您抛了$frequency次硬币。出现正面的次数为$strz,约占$strzb%,最多连续出现$strz2次正面。出现反面的次数为$strf,约占$strfb%,最多连续出现$strf2次反面。
