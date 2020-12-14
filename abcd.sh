#!/bin/env bash
i=0
a=0
echo $i >> /tmp/tmp.file
str1=$(md5sum /tmp/tmp.file |cut -c 1-10|tr  '[0-3]' '[a-d] '|tr  '[4-7]' '[a-d] '|tr  '[8-9]' '[a-b] '|tr  '[e-f]' '[c-d] ')
while [ $i -lt 1000000 ]
do
        echo $i >> /tmp/tmp.file
        str2=$(md5sum /tmp/tmp.file |cut -c 1-10|tr  '[0-3]' '[a-d] '|tr  '[4-7]' '[a-d] '|tr  '[8-9]' '[a-b] '|tr  '[e-f]' '[c-d] ')
        [ $str1 = $str2 ] && echo $i&&a=$((a+1))
        i=$((i+1))
done
echo $a
