#!/bin/bash
Mem_free=$(free -h  |awk 'NR==2 {print $4}' )
Mem_avail=$(free -h  |awk 'NR==2 {print $7}' )
Swap=$(free -h |awk 'NR==3 {print $4}' )
Mem="${Mem_free%i},${Mem_avail%i}" # remove last i
if ! [ "$Swap" = "0B" ];then
    Swap='│'"${Swap%i}"
else
    Swap=""
fi
echo "$Mem$Swap"

