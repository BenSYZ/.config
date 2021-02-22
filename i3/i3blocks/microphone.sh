capture=$(amixer | grep "'Capture'" -A 4|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(.*\)\]/\1 \2/p")
case "$capture"  in 
	*"off"*)
		echo '<span color="#7ee088"></span>'
		;;
	*"on"*)
		echo '<span color="#7ee088"> '"${capture% on}"'</span>'
		;;
esac
