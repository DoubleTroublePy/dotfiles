# gpg shit
GPG_TTY=$(tty)
export GPG_TTY

# watch file
source $HOME/.scripts/tex2pdf.sh

# oh-my-zsh configurations
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh_custom"
setopt correct

plugins=(git)
source $ZSH/oh-my-zsh.sh

# paths
export EDITOR=vim

# General user configuration
# alias

alias proton="$HOME/.proton.sh"
alias hypr="cd /home/dtpy; Hyprland"
alias motd="cat /etc/motd"
#alias mkcdir="mkdir $1; cd $1"

# neovim
alias vvim="\vim"
alias vim="nvim"
alias hx="helix"
export PATH="$PATH:/opt/nvim-linux64/bin"
export JQ_LIB_DIR=/usr/lib/libjq.so

alias mv="mv -u"
alias feh="feh --scale-down"
alias time="/usr/bin/time"

local_config='.zshrc_local'
if [ ! -f $local_config ]; then
  touch $local_config
fi
source $local_config

# fix cursor
#echo -ne '\e[5 q'

_fix_cursor() {
  echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

