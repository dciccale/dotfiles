# vim: ft=sh

################################################################################
# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

################################################################################
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# MISC

alias title="printf '\033]0;%s\007'"

# Create a dir and cd into it
md() {
  mkdir -p "$@" && cd "$_";
}
alias md=md

alias o=open

# Reloads my bashrc
alias reload='. $MYBASHRC; printf "\n${BLUE}.bashrc reloaded!\n${RESET}"'

# Go back to previous path
alias back="cd - &>/dev/null"

# List only directories
alias lsd="ls -d */"

alias cl="clear"
alias ex="exit"
alias ls="ls -G"
alias c="pygmentize -O style=monokai -f console256 -g"
alias g="git"
alias apachelogs="tail -f /var/log/apache2/error_log"

pr() {
  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  local branch=`git name-rev --name-only HEAD`
  open https://github.com/$repo/pull/new/$branch
}

alias fixcam="sudo killall VDCAssistant"

# Print http status every n seconds
# n defaults to 1s
# usage:
# http-ping google.com .5 (500 milliseconds)
# http-ping google.com 2 (2 seconds)
http-ping() {
  n=1 && (($#>1)) && n=$2
  while true
  do
    curl -o /dev/null --silent --head --write-out '%{http_code}\n' $1
    sleep ${n}
  done
}

weather() {
  curl -4 wttr.in/$1
}

alias welcome="say -v Vicki I am pleased to introduce you to Denis"
