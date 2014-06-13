# vim: ft=sh

# Set
################################################################################
# MISC
alias cl="clear"
alias ex="exit"
alias ls="ls -G"
alias c="pygmentize -O style=monokai -f console256 -g"
alias mca="cd ~/tidprojects/mca-mobile/"
alias msf="cd ~/Work/vectorsf/MSF/"
alias g="git"
alias sk="cd ~/git/StocKick/"

# Create a dir and cd into it
md () {
  mkdir -p "$@" && cd "$_";
}
alias md=md

# Quick cd home
home() {
  cd ~/$@
}
alias home=home

# Reloads my bashrc
alias reload='. $MYBASHRC; printf "\n${BLUE}.bashrc reloaded!\n${RESET}"'

# Go back to previous path
alias back="cd - &>/dev/null"

# List only directories
alias lsd="ls -d */"


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


################################################################################
# Cocos 2dx
# Create cocos2d-x multi-platform project
cocos2dxproj() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "provide project and package name"
    return 0
  fi
  if [ -z "$3" ]; then
    LANG="cpp"
  else
    LANG="$3"
  fi
  cd ~/Downloads/cocos2d-x-2.1.4/tools/project-creator/
  python create_project.py -project $1 -package $2 -language ${LANG}
  cd ../../projects/$1
  open .
}
alias cocos2dxproj=cocos2dxproj


################################################################################
# Xcode cleanup
cleanxcode() {
  cd ~/Library/Developer/Xcode/DerivedData/
  rm -rf *
}
alias cleanxcode=cleanxcode


################################################################################
# Blackberry 10 dev shortcuts
bbdeploy() {
  /Developer/SDKs/Research\ In\ Motion/BlackBerry\ 10\ WebWorks\ SDK\ 1.0.4.5/ \
    dependencies/tools/bin/blackberry-deploy -installApp -password $1 -device \
    $2 -package $3
}
alias bbdeploy=bbdeploy

################################################################################
# Open file in a current opened mac vim or just a new mac vim window
# command: Run command with arguments ignoring any shell function named command.
mvim() {
  if [[ $# > 0 ]]; then
    command mvim --remote-silent "$@"
  else
    command mvim
  fi
}
alias mvim=mvim
