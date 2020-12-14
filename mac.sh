#!/bin/env bash
read  -p "Input your MAC:" MAC
str=$(echo $MAC |tr -d '.:-'|tr '[a-f]' '[A-F]')
digit=$(echo $str|tr "0-9A-F" "0")&&[ $digit != 000000000000 ]&&echo "Input error."&&exit
echo "${str:0:4}-${str:4:4}-${str:8:4}"
echo "${str:0:2}:${str:2:2}:${str:4:2}:${str:6:2}:${str:8:2}:${str:10:2}"