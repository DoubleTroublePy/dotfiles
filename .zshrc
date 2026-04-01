# ssh shit
function ssh-michela() {
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_alarielle
}
function ssh-default() {
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_ed25519
}

# gpg shit
GPG_TTY=$(tty)
export GPG_TTY

# usb simplify
function mnt() {
  unm=""
  if [[ "$2" == "u" ]]; then
    unm="un"
  fi
  udisksctl ${unm}mount -p block_devices/$1
}

function ptar() {
  tar $1 - $3 -P | pv -s $(du -sb $3 | awk '{print $1}') | > $2
}

function pztar() {
  tar $1 - $3 -P | pv -s $(du -sb $3 | awk '{print $1}') | bzip2 > $2
}

function ptarcp() {
  tar $1 - $3 -P | pv -s $(du -sb $3 | awk '{print $1}') | gpg -c --passphrase > "./$2.tar.bz.gpg"
}

function ptarc() {
  tar $1 - $3 -P | pv -s $(du -sb $3 | awk '{print $1}') | gpg -c > "./$2.tar.bz.gpg"
}


# watch file
source $HOME/.scripts/tex2pdf.sh

# oh-my-zsh configurations
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jonathan"
setopt correct

plugins=(git)
source $ZSH/oh-my-zsh.sh

# paths
export EDITOR=vim

# General user configuration
# custom vars
export TERM=xterm-256color

# alias
alias proton="$HOME/.proton.sh"
alias hypr="cd /home/dtpy; Hyprland"
alias motd="cat /etc/motd"
alias lock="vlock"
alias allarm="at $1 -f $HOME/.allarm"
#alias mkcdir="mkdir $1; cd $1"

# neovim
alias vvim="\vim"
alias vim="nvim"
alias hx="helix"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/home/dtpy/.local/share/gem/ruby/3.4.0/bin"
export JQ_LIB_DIR=/usr/lib/libjq.so

alias mv="mv -u"
alias feh="feh --scale-down"
alias time="/usr/bin/time"

local_config="$HOME/.zshrc_local"
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

