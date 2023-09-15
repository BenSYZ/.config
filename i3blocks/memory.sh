#!/bin/bash
Mem=$(free -h  |awk 'NR==2 {print $7}' )
Swap=$(free -h |awk 'NR==3 {print $4}' )
echo "${Mem%i}"'│'"${Swap%i}" # remove last i

