# XXX: i need to resolve this in some way 
export LC_ALL=C.UTF-8

# gpg shit
GPG_TTY=$(tty)
export GPG_TTY

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
alias c="$HOME/.scripts/calc.sh"
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
alias time="/usr/bin/time"

# specific configurations
case $HOST in
  # archlinux-home
  "archlinux-home")
    alias twitch-dl="/mnt/data/pods/jellyfin/media/vods/twitch-dl"
    alias poweroff="/home/dtpy/services.sh --stop; poweroff"
    ;;
  "archtop-dtpy")
    alias battery="echo \"     $(cat /sys/class/power_supply/BAT0/capacity)%\" "
    ;;
esac

# fix cursor
#echo -ne '\e[5 q'

_fix_cursor() {
  echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

