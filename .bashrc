export TERM=xterm-256color
export EDITOR="mvim"

# load bash aliases
if [ -f ~/.aliases ]; then . ~/.aliases; fi

PATH=$PATH:$HOME/.rvm/bin
. ~/.rvm/scripts/rvm

PATH=$PATH:/usr/local/mysql/bin

# colors
PURPLE="$(tput setaf 5)"
DARKGREY="$(tput setaf 0)"
WHITE="$(tput setaf 7)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
RESET="$(tput sgr0)"

function parse_git_dirty() {
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo "*"
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function prompt() {
  LEFT=${PWD/$HOME/'~'} # current dir
  RIGHT=$(parse_git_branch) # git branch
  COLS=$(($(tput cols)-${#LEFT}+${#PURPLE})) # calculated columns
  printf '%s%*s%s%s' "${YELLOW}${LEFT}" ${COLS} "${PURPLE}${RIGHT}"
}

PROMPT_COMMAND=prompt
PS1="\n\n${DARKGREY}> ${BLUE}"
