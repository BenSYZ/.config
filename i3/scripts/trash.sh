#!/bin/bash


# ===
# === auto clean
# ===============

#auto_clean(){
#	trashDir="$1"
#	#echo $trashDir
#	cd "$trashDir/files/"
#	find . -maxdepth 1 -mtime +1
#	cd "$trashDir"
#
#	trashList=$(cat <(trash-list))
#
#	num=$(echo "$trashList"|wc -l)
#
#	for i in $(seq $num)
#	do
#		item=$(echo "$trashList" |sed -n "$i p")
#
#		file_date=$(echo "$item" |awk '{print $1,$2}')
#		today=$(date "+%Y-%m-%d %H:%M:%S" )
#		if [[ "$file_date" < "$today" ]];then
#			echo true
#		fi

#last=$(date -d last-minute "+%Y-%m-%d %H:%M:%S" )
#today=$(date "+%Y-%m-%d %H:%M:%S" )
#if [[ "$last" < "$today" ]];then
#	echo true
#fi
#
#	done
#}


#for part in $(lsblk -o MountPoint|sort|uniq|grep -E '^/.*'|tr -s '\n' ' ')
#line=$(lsblk -o MountPoint|sort|uniq|sed -n 's/\(^\/.*\)/"\1"/p'|wc -l)
#for part in $(lsblk -o MountPoint|sort|uniq|sed -n 's/\(^\/.*\)/\1/p'|tr -s ' ' '\\')

#num=$(lsblk -o MountPoint|sort|uniq|sed -n 's/\(^\/.*\)/\1/p'|sed 's/ /\\ /g'|wc -l)
#echo $num

partitions=$(lsblk -o MountPoint|sort|uniq|sed -n 's/\(^\/.*\)/\1/p') #|sed 's/ /\\ /g')
#echo "$part"
num=$(echo "$partitions"|wc -l)
#echo $num

#for part in <(lsblk -o MountPoint|sort|uniq|sed -n 's/\(^\/.*\)/\1/p'|sed 's/ /\\ /g')
for i in $(seq "$num");do
    #echo $i
    part=$(echo "$partitions" |sed -n "$i p")

    # set trashDir
    unset trashDir
    if [ "$part" = '/' ];then
        trashDir=$part.Trash-$UID
    elif [ "$part" = '/home' ]; then
        trashDir=$HOME/.local/share/Trash
    else
        #echo "$part"
        #[ -w "$part" ] && trashDir=$part/.Trash-$UID
        trashDir=$part/.Trash-$UID
    fi

    #[ ! -w "$part" ] &&\
    #	if [ ! -d "$trashDir" ];then
    #		notify-send "Trash Bin" "Trash bin needed, please create $trashDir."
    #	elif [ ! -w "$trashDir" ];then
    #		notify-send "Trash Bin" "Have no permission to write to $trashDir" # -x file bettru
    #	fi
    #[ ( !( -w "$part" ) ) -a ( ! ( -d "trashDir" ) ) ] && echo abc


    #if [ -w "$part" ] && [ ! -d "$trashDir" ];then
    if [ -w "$trashDir/.." ] && [ ! -d "$trashDir" ];then
        mkdir "$trashDir"
    fi


    #if [ -w "$part" ] && [ -d "$trashDir" ];then
    if [ -w "$trashDir" ] && [ -d "$trashDir" ];then
        #cd $trashDir
        #echo $(pwd -P)
        sleep 10
        trash-empty 7
    fi

done
