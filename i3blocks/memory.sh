#!/bin/bash
Mem=$(free -h  |awk 'NR==2 {print $7}' )
Swap=$(free -h |awk 'NR==3 {print $4}' )
if [ "$Swap" = "0B" ];then
    echo "${Mem%i}"
    exit 0
fi
echo "${Mem%i}"'│'"${Swap%i}" # remove last i

