#!/bin/bash
i=2
a=3
mkdir cy -p
cd cy
while [ $i -lt 259 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/page/$i/ -O index$i.html 
    sleep $a
    i=$((i+1))
done
wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/ 
cat * >>../html.log
i=2
mkdir ../xinggan -p
cd ../xinggan
while [ $i -lt 183 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/xinggan/page/$i/ -O index$i.html 
    sleep $a
    i=$((i+1))
done
wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/xinggan/ 
cat * >>../html.log
i=2
mkdir ../japan -p
cd ../japan
while [ $i -lt 30 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/japan/page/$i/ -O index$i.html 
    sleep $a
    i=$((i+1))
done
wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/japan/ 
cat * >>../html.log
i=2
mkdir ../taiwan -p
cd ../taiwan
while [ $i -lt 13 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/taiwan/page/$i/ -O index$i.html 
    sleep $a
    i=$((i+1))
done
wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/taiwan/ 
cat * >>../html.log
i=2
mkdir ../mm -p
cd ../mm
while [ $i -lt 36 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/mm/page/$i/ -O index$i.html 
    sleep $a
    i=$((i+1))
done
wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/mm/ 
cat * >>../html.log
cat ../html.log|sort -u |grep mzitu.com/[0-9]|tr " " '\n'|grep -vE "jsdelivr|img"|grep mzitu|cut -d'"' -f2|sort -u|grep -v '&|;'|grep -v '|' >../url1.log
mkdir ../cross -p
cd ../cross
i=1
while read url
do
    wget -c -N -t 0 -U Mozilla/5.0 "$url" -O index$i.html 
    sleep $a
    i=$((i+1))
done < ../url1.log
cat index*|sort -u|grep .jpg|tr " " '\n'|grep .jpg|grep -vE "thumbs|sinaimg"|cut -d'"' -f2|sort -u|grep -v '&|;'|grep -v '|' >>../html3.log
cd ..
j=1
while read url
do
    wget -c -N -t 0 -U Mozilla/5.0 -E --referer strict-origin-when-cross-origin "$url"  -O HPS$j.jpg
    sleep $a
    j=$((j+1))
done < html3.log
i=1
mkdir zipai -p
cd zipai
while [ $i -lt 480 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/zipai/comment-page-$i/ -O index$i.html  
    sleep $a
    i=$((i+1))
done
cat * >>../html2.log
i=1
mkdir ../jiepai -p
cd ../jiepai
while [ $i -lt 135 ]
do
    wget -c -N -t 0 -U Mozilla/5.0 https://www.mzitu.com/jiepai/comment-page-$i/ -O index$i.html  
    sleep $a
    i=$((i+1))
done
cat * >>../html2.log
cd ..
cat html2.log|grep .jpg|grep -v thumbs|tr '"' '\n'|grep .jpg|sort -u >url2.log
while read url
do
    wget -c -N -t 0 -U Mozilla/5.0 -E --referer strict-origin-when-cross-origin "$url" -O ZJP$j.jpg
    sleep $a
    j=$((j+1))
done < url2.log
