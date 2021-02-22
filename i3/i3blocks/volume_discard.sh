#volume=$(amixer | grep 'Master' -A 5|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(off\)\]/\1 \2/p")
#[[  -n "$(echo $volume |grep off)" ]] && echo $volume
#volume=$(amixer | grep 'Master' -A 5|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(on\)\]/\1 \2/p")
#[[  -n "$(echo $volume |grep off)" ]] && echo $volume
volume=$(amixer | grep 'Master' -A 5|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(.*\)\]/\1 \2/p")
case "$volume" in 
	*"off"*)
		echo -n '<span color="#ff79c6"></span>'
		;;
	*"on"*)
		echo -n '<span color="#ff79c6"> '"${volume% on}"'</span>'
		;;
esac
#[[  -n "$volume" ]] && echo -n '<span color="#ff79c6"></span>'
#
#volume=$(amixer | grep 'Master' -A 5|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(on\)\]/\1 \2/p")
#[[  -n "$volume" ]] && echo -n '<span color="#ff79c6"> '"${volume% on}"'</span>'

echo -n ' '

capture=$(amixer | grep "'Capture'" -A 4|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(.*\)\]/\1 \2/p")
case "$capture"  in 
	*"off"*)
		echo -n '<span color="#7ee088"></span>'
		;;
	*"on"*)
		echo -n '<span color="#7ee088"> '"${capture% on}"'</span>'
		;;
esac

#[[  -n "$capture" ]] && echo -n '<span color="#7ee088"></span>'
#
#capture=$(amixer | grep "'Capture'" -A 4|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(on\)\]/\1 \2/p")
#[[  -n "$capture" ]] && echo -n '<span color="#7ee088"> '"${capture% on}"'</span>'

echo
