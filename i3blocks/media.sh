#!/bin/zsh

#tmpfile=$1
tmpfile=/tmp/.i3blocks_media
[ -e "$tmpfile" ] || touch $tmpfile
#echo -n $player
str_length=20 # 一次打印多长

# media
# start_i
# end_i
old_player=$(head -n1 $tmpfile)
start_i=$(tail -n2 $tmpfile|head -n1)
end_i=$(tail -n1 $tmpfile)

#player=$(playerctl --all-players metadata --format "{{ artist }} - {{ title }}" | sed -n 's/^\(\ *-\ *\)*\(.*\)/ \2/p')
player=$(playerctl --all-players metadata --format "{{status}} >_< {{ artist }} >_< {{ title }}" 2>/dev/null | 
    awk -F '>_<' '{
    if ($1 == "Playing ") {
        if ($2 ~ "[^ ]") {
            printf $2"-";
        };
        print $3
    }
}')
#playerctl --all-players metadata --format "{{status}} >_< {{ artist }} >_< {{ title }}"
#awk '{$print NR"." $0}' # 添加行号
number_player=$(echo -n $player |awk -F '\n' 'END{print NR}')
if [ "$number_player" -gt "1" ];then
    player=$(echo -n $player|awk -F '\n' '{printf NR"." $0"    "}')
fi
#echo $player | sed ':a ; N;s/\n/ / ; t a ; '

#echo $player
#player='歌近十年来全球最热门歌近十年来全球最热门特殊'
[ -z "$player" ] && exit 0 # avoid show empty


num=$(echo $player |wc -m)
if [ "$num" -gt "$str_length" ];then
    for i in $(seq 0 $(($str_length/4)));
    do
        player=$(echo $player" ")
    done
fi


# write tmp_file
if [ "$player" != "$old_player" ];then
    start_i=0
    num=$(echo $player |wc -m)
    #end_i=$(($start_i-$str_length))
    end_i=$(($num-$str_length))

    echo $player > $tmpfile
    echo $start_i >> $tmpfile
    echo $end_i >> $tmpfile
fi

if [ "$start_i" -gt "$end_i" ];then
    start_i=0

    echo $player > $tmpfile
    echo $start_i >> $tmpfile
    echo $end_i >> $tmpfile
else
    echo $player > $tmpfile
    echo $(($start_i+2)) >> $tmpfile
    echo $end_i >> $tmpfile
fi

#echo '===='
#cat ./media_tmp
#echo '===='

#function formatwidth
#{
#  local STR=$1; shift
#  local WIDTH=$1; shift
#  local BYTEWIDTH=$( echo -n "$STR" | wc -c )
#  local CHARWIDTH=$( echo -n "$STR" | wc -m )
#  echo $(( $WIDTH - $CHARWIDTH - ($BYTEWIDTH-$CHARWIDTH)/2))
#  #echo $(( $WIDTH + $CHARWIDTH - $BYTEWIDTH ))
#}
#formatwidth "你好啊" 20
#formatwidth "你说的爱我（piano ver.）" 30
#echo $player |awk -v str_begin="$start_i" -v str_length="$str_length" '{printf substr($0,str_begin,str_length)}' |xargs -0 -I {} printf "%*s%s"\
#    $( formatwidth "{}" 30 ) "" "{}"

#echo $player |awk -v str_begin="$start_i" -v str_length="$str_length" '{printf substr($0,str_begin,str_length)}' | xargs -0 printf "%40s"
#player='violin&string - 愿'
#echo "$player" |awk '{print substr($0,1,7)}'
echo "$player" |awk -v str_begin="$start_i" -v str_length="$str_length" '{printf substr($0,str_begin,str_length)}'|sed 's/&/_/g'
echo 
