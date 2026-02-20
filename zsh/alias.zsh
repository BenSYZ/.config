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
vinfo(){ vim -c "Vinfo $1" -c 'silent only'}
alias info=vinfo
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
mv_i(){
    echo mv has been alias to 'mv -i'
    mv -i "$@"
}
alias mv=mv_i
alias removeReturn='sed '\'':a;N;$!ba;s/[\n\r]/ /g'\'

alias la="lazygit"

alias dmesg="journalctl -k --no-pager"

export user_tmp_dir="/tmp/$USER"
fn_cd_temp(){
    mkdir -p "$user_tmp_dir"
    cd "$(mktemp --directory --tmpdir="$user_tmp_dir" -t tmp.$(date +%s)_XXX)"
}
fn_cd_last_temp(){
    cd "$(ls -d "$user_tmp_dir"/tmp.*/ |tail -n 1)" || fn_cd_temp
}
alias ct='fn_cd_temp'
alias ctl='fn_cd_last_temp'

dtc_func(){
    local input_file="$1"
    local output_dir="$2"

    if [[ "$1" =~ .*\.dts ]];then
        dtc_args=("-I" "dts" "-O" "dtb")
        output_file="${input_file/%dts/dtb}"
    elif [[ "$1" =~ .*\.dtb ]];then
        dtc_args=("-I" "dtb" "-O" "dts")
        output_file="${input_file/%dtb/dts}"
    fi

    if [ -n "$output_dir" ];then
        output_file="$output_dir"/"$(basename "$output_file")"
    fi
    dtc "${dtc_args[@]}" "$input_file" -o "$output_file"
}
alias dtc_quick="dtc_func"
cdf(){
    cd "$(dirname "$@")"
}
filerp(){ file "$(realpath "$@")" }
alias rp='realpath'
cdrp(){
    local directory="$1"
    if [ -z "$directory" ];then
        directory="."
    fi
    cd "$(realpath "$directory")"
}
cdg(){
    cd "$(git rev-parse --show-toplevel)"
}
send_to_clipboard(){
    if [ -n "$TMUX" ];then
        # reference: neovim clipboard.vim set_tmux
        tmux load-buffer -w -
        return
    fi

    # by ssh
    if [ -n "$SSH_CONNECTION" ];then
        # mostly should use osc52 except tmux
        {
            printf "\033]52;p;"
            base64
            printf "\a"
        }
        return
    fi

    # local machine
    # TODO: OS specific or directly use osc52
    return
}
cprp(){
    realpath "$@" | tr -d '\n' | send_to_clipboard
}

alias watchp=monitor_proc
monitor_proc(){
    local monitor_pid="$1"
    local cmd
    local monitor_proc_name
    if [[ "$monitor_pid" =~ ^[0-9]+$ ]]; then
        :
    else
        monitor_proc_name="$monitor_pid"
        ps_out="$(pgrep --list-full "$monitor_proc_name")"
        if [ "$(echo "$ps_out" |wc -l)" -eq 1 ];then
            monitor_pid="$(echo "$ps_out" | awk '{print $1}')"
        else
            echo "$ps_out"
            echo Select pid above
            read -r monitor_pid
        fi
    fi

    if [[ "$monitor_pid" =~ ^[0-9]+$ ]]; then
        :
    else
        echo "Not a pid, exit"
        return 1
    fi
    cmd="$(pgrep --list-full "$monitor_proc_name"|sed 's/[0-9]* //')"

    {
        notify-send -t 2000 "monitor proc test:" "monitoring: $cmd"
        while [ -e /proc/"$monitor_pid" ];do
            sleep 1
        done
        notify-send -t 0 "monitor proc" "$cmd"
    } &
}
purge_kernel_tag(){
    cp -i tags tags.bak
    awk '{
        if ($2~/arch\/.*/){
            if ($2~/arch\/x86\/.*/) {
                print $0
            }
        }else{
            print $0
        }
    }' tags.bak > tags
}

get_ppid(){
    local pid="$1"
    awk '$1=="PPid:" {print $2}' /proc/"$pid"/status
}
pstreer(){
    if [ -z "$1" ];then
        pid="$$"
    else
        if ! get_ppid "$1" >/dev/null;then
            echo "No such process with PID=$1"
            return
        fi
        pid="$1"
    fi
    pid_list=()
    for (( ; pid != 1 ; pid=$(get_ppid "$pid") ));do
        pid_list+=("$pid")
    done
    ps -ef --pid="${pid_list[*]}"
    return 0
}

alias im="$HOME/.config/nvim/plugged/Mac-input.vim/plugin/remote/im_select_server.py"
tmux_show_focused_client_env(){
    local env_var="$1"
    local current_tmux_client_id
    if [ -z "$TMUX" ]; then
         return
    fi
    current_tmux_client_id="$(tmux list-clients -F '#{client_pid}' -f '#{m:*focused*,#{client_flags}}')"
    awk -v RS="\0" -v env_var="$env_var" -v FS="=" '$1==env_var {printf("%s=\"%s\"; export %s;\n", env_var, $2, env_var)}' /proc/"$current_tmux_client_id"/environ
}
# usage:
#   update_tmux_env env_var_name [-y]
update_tmux_env(){
    local eval_str do_eval
    #eval_str="$(tmux show-environment "$1"|sed 's/=/="/;s/$/"/')"
    #eval_str="$(tmux show-environment -s "$1")"
    eval_str="$(tmux_show_focused_client_env "$1")"
    do_eval="$2"
    if [ "$do_eval" = "-y" ]; then
        eval "$eval_str"
        return
    fi

    echo "$eval_str"
    echo -n "do eval?"
    read -r do_eval
    if [ "$do_eval" = y ]; then
        eval "$eval_str"
    fi
}

autoload -Uz add-zsh-hook
update_env_var() {
  update_tmux_env SSH_CONNECTION -y
}
add-zsh-hook precmd update_env_var
#alias us="update_tmux_env SSH_CONNECTION"
