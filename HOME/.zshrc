# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ben/.oh-my-zsh"
#set -o vi
#bindkey -v
#bindkey -e #default



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="arrow"
#ZSH_THEME="agnoster"
ZSH_THEME="ben"
#ZSH_THEME="gentoo"
#ZSH_THEME='apple'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git)
#plugins=(conda-zsh-completion)

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_CMD='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
source ~/.config/zsh/completion.zsh

# /etc/profile
if [[ ":$PATH:" != *:"$HOME/.local/bin":* ]] && [[ -d "$HOME/.local/bin" ]];then
	export PATH="$PATH:$HOME/.local/bin"
	#echo "It's not there and directory exist"
fi


source $ZSH/oh-my-zsh.sh
#setopt share_history          # share command history data
#setopt APPEND_HISTORY

#
# conda auto completion
#-------------------------
autoload -U compinit && compinit
# To activate the completion cache for packages, add the following to your
zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# To display subcommand completion in groups, please add the following to your
zstyle ":conda_zsh_completion:*" use-groups true

source $ZSH/custom/plugins/tty-solarized/tty-solarized-dark.sh
#zstyle :omz:plugins:tty-solarized theme-shade "light"
# or:
zstyle :omz:plugins:tty-solarized theme-shade "dark"
# other values are not supported, "dark" is default

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=/usr/bin/nvim
export GOPROXY=https://goproxy.cn

[ -f "$HOME/.config/lf/shell_icons" ] && source "$HOME/.config/lf/shell_icons"

# dir 777 backgroud color
#http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
#LS_COLORS="$LS_COLORS:ow=01;30;42"
LS_COLORS=$(echo $LS_COLORS |sed 's/:ow[^:]*:/:ow=01;30;42:/g')
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit


alias 'pipinstall'='pip install --user'

alias ls='ls --color=auto'
alias ll='ls --color=auto -l -a -h'
alias ra='ranger'
#alias sudo='sudo env HOME=$HOME'
alias sudo='sudo '
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"
alias vim='/usr/bin/nvim'
viman () { text=$(man "$@") && echo "$text" | nvim -R +":set ft=man" - ; }
export MANPAGER='nvim +Man!'
alias wttr='wttr nanshan,shenzhen'
alias wttr='wttr ningbo,zhejiang'
# setxkbmap us -variant colemak
# map i l
# map l i
alias c=clear
alias slp='sudo hdparm -Y /dev/sda'

#https://unix.stackexchange.com/questions/72131/detecting-x-session-in-a-bash-script-bashrc-etc
#https://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors
# tty color
#if ! xhost >& /dev/null; then
#    #test xhost >& /dev/null; #-> always 0, test string(true) has no meaning, test used for -z -n ...
#    #echo "Display exists"
#    echo -en "\e]P0232323" #black
#    echo -en "\e]P82B2B2B" #darkgrey
#    echo -en "\e]P1D75F5F" #darkred
#    echo -en "\e]P9E33636" #red
#    echo -en "\e]P287AF5F" #darkgreen
#    echo -en "\e]PA98E34D" #green
#    echo -en "\e]P3D7AF87" #brown
#    echo -en "\e]PBFFD75F" #yellow
#    echo -en "\e]P48787AF" #darkblue
#    echo -en "\e]PC7373C9" #blue
#    echo -en "\e]P5BD53A5" #darkmagenta
#    echo -en "\e]PDD633B2" #magenta
#    echo -en "\e]P65FAFAF" #darkcyan
#    echo -en "\e]PE44C9C9" #cyan
#    echo -en "\e]P7E5E5E5" #lightgrey
#    echo -en "\e]PFFFFFFF" #white
#    #clear #for background artifacting
##else echo "Display invalid" ;
#fi

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
unsetopt BEEP
#echo "loadkeys $HOME/keys.conf"

## -z if variant is NONE(empty) or not, if NONE return TRUE
#[[ -z $DISPLAY ]] && exec startx
neofetch
#echo 2020-03-30

# zathura, latex
#export GTK_MODULES=unity-gtk-module


alias mnt="simple-mtpfs --device 1 ~/Documents/mntphone/mnt"
alias umnt="umount ~/Documents/mntphone/mnt"

#???
#LD_LIBRARY_PATH=/usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include/
#export LD_LIBRARY_PATH

alias pacexpl="sudo pacman -D --asexp"    # Mark one or more installed packages as explicitly installed 
alias pacimpl="sudo pacman -D --asdep"    # Mark one or more installed packages as non explicitly installed

# backwards
#TERM=xterm #????
#TERM=alacritty

# conda path
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
alias condaa="conda activate"
alias condad="conda deactivate"
alias condacreate="conda create --use-local"


alias transc='trans -t chinese -b'
alias ccal='ccal -u'
alias lcal='ccal'

#uid=1000 ben
#gid=1001 sambashare
alias mountsamba="sudo mount -t cifs -o uid=1000,gid=445,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664 //192.168.101.1/sambashare /media/samba > /dev/null ; sudo mount -t cifs -o uid=1000,gid=1001,credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,dir_mode=0775,file_mode=0664 //192.168.101.1/homes /media/ben > /dev/null"
alias umountsamba="sudo umount /media/ben /media/samba"
#alias mountsamba="sudo mount -o credentials=$HOME/.ssh/smbcredentials,iocharset=utf8,rw,user,port=44501 //8.129.217.178/sambashare /media/samba"
#alias mount="mount -o uid=1000,gid=1000"
#alias smount="sudo mount -o uid=1000,gid=1000"
#
alias df="df -Th"
alias du="du -h"

#echo vi has been alias
alias vi="vim -u ~/Documents/vim/init.vim"
alias v="vim -u NONE"


# -------------PROXY-------------
export proxy="http://127.0.0.1:8118"
#export proxy="http://192.168.101.1:8119"
export http_proxy=$proxy
export https_proxy=$proxy
#export ftp_proxy=$proxy

#alias setsproxy="export http_proxy=socks5://127.0.0.1:8080; export https_proxy=socks5://127.0.0.1:8080"
alias noproxy="export no_proxy='localhost, 127.0.0.1, ::1'"

#need pysocks
alias yyou-get="you-get -x 127.0.0.1:8118"	#http
#alias yyou-get="you-get -s 127.0.0.1:8080"	#socket
#alias googler="googler -p 127.0.0.1:8080"	#only support https proxy

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	SESSION_TYPE=remote/ssh
# many other tests omitted
else
	if xhost >& /dev/null; then
		xset -b
	fi
#  case $(ps -o comm= -p $PPID) in
#    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
#  esac
fi

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

#echo 13.5 pam,  18 日志, 7.4
#echo pam
#echo '驱动， pam( ulimit )， 所以很多朋友都習慣單一 bash 登入，再用工作控制 (job control, 第四篇會介紹) 來切換不同工作'
#echo 'page 575 chapter18 logfile.sh'
export BC_ENV_ARGS=$HOME/.config/HOME/BC_ENV_ARGS
#alias bc="BC_ENV_ARGS=<(echo 'scale=10') \bc"
#tt
#echo 'i3 minimize window: https://www.youtube.com/watch?v=QqDMpuIikXA'

#mkdir -p ~/.trash   #在家目录下创建一个.trash文件夹
#alias rm=del        #使用别名del代替rm   
#del()               #函数del，作用：将rm命令修改为mv命令
#{
#  mv $@ ~/.trash/  
#}
#cleardel()          #函数cleardel，作用：清空回收站.trash文件夹，y或Y表示确认，n表示取消
#{
#    read -p "clear sure?[Input 'y' or 'Y' to confirm. && Input 'n' to cancel.]" confirm   
#    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash/*   
#}
#alias rm="echo 'using trash-put $*' \r If you really sure, use rmm"
rm() {echo -e "Please using [34mtrash-put $*[0m \nIf you really sure, use [31mrmm $*[0m\n";}
rmm() {
	if [ "$#" -gt "0" ];then
		echo "[31mrm $*[0m"
		read "rm_check?Continue?"
		rm_check=${rm_check:-"n"}
		if [[ "$rm_check" =~ ^[Yy]$ ]]; then
			/usr/bin/rm $*
		fi
	else
		echo "Nothing to rm."
	fi
}
#alias rmm="/usr/bin/rm"
alias tp="trash-put"
alias nvrun="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"
alias iconvc="iconv -f GBK -t UTF-8"
alias grepconf="grep '^ *[^#]'"
alias grepcomment="grep '^ *[#]'"
alias mountvbox='sudo mount /dev/nvme0n1p7'
#alias yay="yay --gitflags 'config --global https.proxy http://127.0.0.1:8118 http.proxy http:127.0.0.1:8118'"

# yay
alias yss='yay -Ss'
alias ysi='yay -Si'
alias yql='yay -Ql'
alias yqi='yay -Qi'

echo "5.9.14-arch1-1/extra"


autoload bashcompinit
bashcompinit
source /etc/bash_completion.d/wd

# pyenv
##export PYENV_ROOT="$HOME/.pyenv"
##export PATH="$PYENV_ROOT/bin:$PATH"
##if command -v pyenv 1>/dev/null 2>&1; then
##  eval "$(pyenv init -)"
##fi
#export PYENV_ROOT="$HOME/.pyenv/versions/3.7.9/"
#export PATH="$PYENV_ROOT/bin:$PATH"
echo 'btrfs: https://dev.to/dandyvica/playing-with-the-btrfs-filesystem-5eno'
#echo 'dnsmasq https://www.cnblogs.com/sunsky303/p/9238669.html'


