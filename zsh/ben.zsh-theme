#typeset +H _current_dir="%{$fg_bold[cyan]%}%3~%{$reset_color%} "
typeset +H _current_dir="%{$fg_bold[cyan]%}%~%{$reset_color%} "

function _user_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg_bold[cyan]%}$me%{$reset_color%}:"
  fi
}

#PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

#PROMPT="%(?:%{$fg_bold[magenta]%}➤ :%{$fg_bold[red]%}➤ )\
#$(_user_host)${_current_dir}
#  %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

#%(?:%{$fg_bold[magenta]%}➤ :%{$fg_bold[red]%}➤ )${_current_dir}
#  %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT="$(_user_host)
%(?:%{$FG[001]%}➤ :%{$fg_bold[red]%}➤ )${_current_dir}
  %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

#PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+=' %{$fg[cyan]%}%{$reset_color%}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"



