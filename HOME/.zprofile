# about login: shell https://superuser.com/questions/187639/zsh-not-hitting-profile
# not full right
# login:
#       zsh: .zprofile, .zshrc
#       bash: .bash_profile, .profile
# emulator:
#       zsh: .zshrc
#       bash: .bashrc
# more about these profiles https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
