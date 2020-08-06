# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="arrow"
#ZSH_THEME="agnoster"
ZSH_THEME="ben"
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
plugins=(conda-zsh-completion)

source $ZSH/oh-my-zsh.sh


#
# conda auto completion
#-------------------------
autoload -U compinit && compinit
# To activate the completion cache for packages, add the following to your
zstyle ':completion::complete:*' use-cache 1
# To display subcommand completion in groups, please add the following to your
zstyle ":conda_zsh_completion:*" use-groups true


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

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_COMPLETION_TRIGGER='\'

if [[ $PATH != *"$HOME/.local/bin/:"* ]] && [[ -d "$HOME/.local/bin/" ]];then
	export PATH=$HOME/.local/bin/:$PATH
	#echo "It's not there and directory exist"
fi

export EDITOR=/usr/bin/nvim
export GOPROXY=https://goproxy.cn


alias 'pipinstall'='pip install --user'

alias ls='ls --color=auto'
alias ll='ls --color=auto -l -a -h'
alias ra='ranger'
alias sudo='sudo env HOME=$HOME'
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"
viman () { text=$(man "$@") && echo "$text" | nvim -u ~/.config/nvim/init.vim -R +":set ft=man" - ; }
alias wttr='wttr yuyao'
# setxkbmap us -variant colemak
# map i l
# map l i
alias c=clear
alias slp='sudo hdparm -Y /dev/sda'
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
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
TERM=xterm

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
alias condaa="conda activate"
alias condad="conda deactivate"
alias condacreate="conda create --use-local"

alias mountsamba="sudo mount -o credentials=$HOME/.ssh/smbcredentials,iocharset=utf8 //192.168.1.109/sambashare /media/samba"

echo vi has been alias
alias vi="vim -u ~/Documents/vim/init.vim"
alias v="vim -u NONE"


# -------------PROXY-------------
export proxy="socks5://127.0.0.1:8080"
#export http_proxy=$proxy
#export https_proxy=$proxy
#export ftp_proxy=$proxy

alias setproxy="export http_proxy=$proxy; export https_proxy=$proxy"
alias noproxy="export no_proxy='localhost, 127.0.0.1, ::1'"

#need pysocks
alias yyou-get="you-get -s 127.0.0.1:8080"	#socket
#alias yyou-get="you-get -x 127.0.0.1:8080"	#https
#alias googler="googler -p 127.0.0.1:8080"	#only support https proxy
