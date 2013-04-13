PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR="mvim"

# init rvm
. ~/.rvm/scripts/rvm

PATH=$PATH:/usr/local/mysql/bin

if [ -f ~/.aliases ]; then . ~/.aliases; fi

#function git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}

#PS1='\h:\W$(git_branch) \u\$ '



# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles

default_username='denis'

export TERM=xterm-256color

tput sgr0
MAGENTA=$(tput setaf 9)
ORANGE=$(tput setaf 172)
GREEN=$(tput setaf 190)
PURPLE=$(tput setaf 141)
WHITE=$(tput setaf 256)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Fastest possible way to check if repo is dirty. a savior for the WebKit repo.
function parse_git_dirty() {
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo '*'
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Only show username/host if not default
function usernamehost() {
  if [ $USER != $default_username ]; then echo "${MAGENTA}$USER ${WHITE}at ${ORANGE}$HOSTNAME $WHITEin "; fi
}

PS1="\[\e]2;$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]${BOLD}\$(usernamehost)\[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
