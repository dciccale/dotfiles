PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR="mvim"

# init rvm
. ~/.rvm/scripts/rvm

PATH=$PATH:/usr/local/mysql/bin

if [ -f ~/.aliases ]; then . ~/.aliases; fi

export TERM=xterm-256color

function parse_git_dirty() {
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo "*"
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# shows the last commit hash
function parse_git_hash() {
  git rev-parse --short HEAD 2> /dev/null | sed "s/\(.*\)/${Reset}@${White}\1/"
}

tput sgr0
Purple="$(tput setaf 5)"
DarkGrey="$(tput bold ; tput setaf 0)"
White="$(tput bold ; tput setaf 7)"
LightGreen="$(tput bold ; tput setaf 2)"
Yellow="$(tput bold ; tput setaf 3)"
Blue="$(tput setaf 4)"
Reset="$(tput sgr0)"

function prompt() {
  printf '%s%*s%s\n' "$Purple" $(tput cols) "$(parse_git_branch)"
}

PROMPT_COMMAND=prompt
PS1="\[${Blue}\]\u \[${LightGreen}\]\w\n\[${Reset}\]\n\[${DarkGrey}\]> \[${White}\]"
