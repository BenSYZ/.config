alias 'pipinstall'='pip install --user'

alias ls='ls --color=auto'
alias ll='ls --color=auto -l -a -h'
alias ra='ranger'
alias sudo='sudo env HOME=$HOME'
setopt correct
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"
alias vim='/usr/bin/nvim'
viman () { text=$(man "$@") && echo "$text" | nvim -R +":set ft=man" - ; }
export MANPAGER='nvim +Man!'
alias wttr='/usr/bin/wttr "Nanshan+shenzhen"'
#alias wttr='/usr/bin/wttr "Ningbo+zhejiang"'
alias etrans='trans -t english'
# setxkbmap us -variant colemak
# map i l
# map l i
alias c=clear
alias slp='sudo hdparm -Y /dev/sda'
alias unzip='echo "======\n recommand use unar,\n still run with unzip\n======";unzip'
alias 'battery=acpi -b -i -V'
alias ssh="env TERM=xterm ssh"
alias open="xdg-open"
alias dus="du -sh ./* | sort -sh"
alias f="fuck"

alias mnt="simple-mtpfs --device 1 ~/Documents/mntphone/mnt"
alias umnt="umount ~/Documents/mntphone/mnt"

alias pacexpl="sudo pacman -D --asexp"    # Mark one or more installed packages as explicitly installed 
alias pacimpl="sudo pacman -D --asdep"    # Mark one or more installed packages as non explicitly installed

## conda path
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
#alias condaa="conda activate"
#alias condad="conda deactivate"
#alias condacreate="conda create --use-local"


alias transc='trans -t chinese -b'
alias ccal='ccal -u'
alias lcal='ccal'

#uid=1000 ben
#gid=1001 sambashare
#alias mountsamba="sudo mount -t cifs -o uid=1000,gid=445,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664 //192.168.1.12/sambashare /media/samba > /dev/null ; sudo mount -t cifs -o uid=1000,gid=1001,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664 //192.168.1.12/homes /media/ben > /dev/null"
#alias mountsamba="sudo mount -t cifs -o uid=1000,gid=445,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664 //localhost/samba /media/samba > /dev/null"
alias mountrsamba="sudo mount -t cifs -o uid=1000,gid=445,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664,port=44501 //bensyz.com/samba /media/samba > /dev/null"
alias umountsamba="sudo umount /media/ben /media/samba"
alias mountsamba="sudo mount -t cifs -o uid=1000,gid=445,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664,port=445 //pi/samba /media/samba > /dev/null"
#alias mountsamba="sudo mount -o credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,user,port=44501 //8.129.217.178/sambashare /media/samba"
#alias mount="mount -o uid=1000,gid=1000"
#alias smount="sudo mount -o uid=1000,gid=1000"
#
alias df="df -Th"
alias du="du -h"

#echo vi has been alias
alias vi="vim -u ~/Documents/vim/init.vim"
alias v="vim -u NONE"

#need pysocks
alias yyou-get="you-get -x 127.0.0.1:8118"	#http
#alias yyou-get="you-get -s 127.0.0.1:8080"	#socket
#alias googler="googler -p 127.0.0.1:8080"	#only support https proxy

# bsd rsync:
# .
# ├── dst
# └── src
#     └── a
# 1. rsync -r src dst
#     -> dst/src
# 2. rsync -r src/ dst
#     -> dst/a
# 2 is like cp -r src/. dst
gnu_rsync() {
  new_args=()
  for i in "$@"; do
    case $i in
      /)
        i=/
        ;;
      */)
        i=${i%/}
        ;;
    esac
    new_args+=$i
  done
  exec rsync "${(@)new_args}"
}
compdef gnu_rsync=rsync
alias rsync="gnu_rsync"

alias syststatus="systemctl status"
#function sysstatus(){
#	systemctl status $1;
#}
alias systrestart="systemctl restart"
#function sysrestart(){
#	systemctl restart $1;
#	systemctl status $1;
#}


rm() {echo -e "Please using [34mtrash-put $*[0m \nIf you really sure, use [31mrmm $*[0m\n";}

TimeLeft(){
	seconds_left=$1
	echo "Please wait for ${seconds_left} second ..."
	while [ $seconds_left -gt 0 ];do
	  echo -n $seconds_left
	  sleep 1
	  seconds_left=$(($seconds_left - 1))
	  echo -ne "\r     \r" #清除本行文字
	done
}

#rmm() {
#	if [ "$#" -gt "0" ];then
#		echo "[31mrm $*[0m"
#		TimeLeft 4
#		read "rm_check?Continue?"
#		rm_check=${rm_check:-"n"}
#		if [[ "$rm_check" =~ ^[Yy]$ ]]; then
#			/usr/bin/rm $*
#		fi
#	else
#		echo "Nothing to rm."
#	fi
#}
rmm() {
	if [ "$#" -gt "0" ];then
		echo "type [31m$*[0m to confirm."
		read "rm_check?"
		if [[ "$rm_check" =~ ^$*$ ]]; then
			/usr/bin/rm $*
			#echo $*
		else
			echo "rm canceled."
		fi
	else
		echo "Nothing to rm."
	fi
}
alias rmmm="/usr/bin/rm"

alias tp="trash-put"
alias iconvc="iconv -f GBK -t UTF-8"
alias grepconf="grep '^[ \t]*[^ \#]'"
alias grepcomment="grep '^ *[\#]'"

alias zhcon='zhcon --utf8'

cp_i(){
    echo cp has been alias to 'cp -i'
    cp -i "$@"
}
alias cp=cp_i
alias removeReturn='sed '\'':a;N;$!ba;s/[\n\r]/ /g'\'

alias la="lazygit"

alias dmesg="journalctl -k"
alias ct='cd $(mktemp -d)'

dtc_func(){
    if [ "$#" -ne 3 ];then
        echo "dtc_func <s2b|b2s> <input> <output>" >&2
        return 1
    fi

    if [ "$1" = "s2b" ];then
        dtc -I dts -O dtb "$2" -o "$3"
    elif [ "$1" = "b2s" ];then
        dtc -I dtb -O dts "$2" -o "$3"
    else
        echo "dtc_func <s2b|b2s> <input> <output>" >&2
        return 1
    fi
}
alias dtc_s2b="dtc_func s2b"
alias dtc_b2s="dtc_func b2s"
