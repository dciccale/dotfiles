# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

# Keep Zim anchored to the real home directory so temporary ZDOTDIR shells
# don't regenerate ~/.zim/init.zsh with transient absolute paths.
ZIM_HOME=${HOME}/.zim
ZIM_CONFIG_FILE=${ZIM_CONFIG_FILE:-${HOME}/.zimrc}
if [[ -z ${ZIM_SKIP_INIT-} ]]; then
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
fi

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

typeset -U path PATH
path=(/opt/homebrew/bin "$HOME/bin" $path)

if [[ -o interactive ]] && (( ${+commands[starship]} )); then
  eval "$(starship init zsh)"
fi

# load aliases
if [ -f ~/.zsh_aliases ]; then . ~/.zsh_aliases; fi

export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
if [ -d "$ANDROID_HOME" ]; then
  path+=("$ANDROID_HOME/emulator" "$ANDROID_HOME/platform-tools")
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999999'   # safe bright gray

export NVM_DIR="$HOME/.nvm"
# Fast-path Node: add default nvm version bin to PATH without sourcing nvm.sh.
if [ -r "$NVM_DIR/alias/default" ]; then
  NVM_DEFAULT_VERSION="$(<"$NVM_DIR/alias/default")"

  # Resolve alias values like "node" / "lts/*" / custom aliases to a concrete version.
  case "$NVM_DEFAULT_VERSION" in
    node|stable)
      NVM_DEFAULT_VERSION="$(ls -1 "$NVM_DIR/versions/node" 2>/dev/null | sort -V | tail -n 1)"
      ;;
    lts/*)
      NVM_LTS_ALIAS="${NVM_DEFAULT_VERSION#lts/}"
      if [ -r "$NVM_DIR/alias/lts/$NVM_LTS_ALIAS" ]; then
        NVM_DEFAULT_VERSION="$(<"$NVM_DIR/alias/lts/$NVM_LTS_ALIAS")"
      fi
      unset NVM_LTS_ALIAS
      ;;
    *)
      if [ -r "$NVM_DIR/alias/$NVM_DEFAULT_VERSION" ]; then
        NVM_DEFAULT_VERSION="$(<"$NVM_DIR/alias/$NVM_DEFAULT_VERSION")"
      fi
      ;;
  esac

  if [ -n "$NVM_DEFAULT_VERSION" ] && [ -d "$NVM_DIR/versions/node/$NVM_DEFAULT_VERSION/bin" ]; then
    path=("$NVM_DIR/versions/node/$NVM_DEFAULT_VERSION/bin" $path)
  fi
  unset NVM_DEFAULT_VERSION
fi

# Lazy-load nvm only when explicitly used.
if [ -s "$NVM_DIR/nvm.sh" ]; then
  lazy_load_nvm() {
    unset -f lazy_load_nvm nvm
    \. "$NVM_DIR/nvm.sh"
  }
  nvm() {
    lazy_load_nvm
    nvm "$@"
  }
fi

# rbenv fast path: add shims/bin; defer full init until rbenv command is used.
export RBENV_ROOT="${RBENV_ROOT:-$HOME/.rbenv}"
if [ -x "$RBENV_ROOT/bin/rbenv" ]; then
  path=("$RBENV_ROOT/bin" "$RBENV_ROOT/shims" $path)
  lazy_load_rbenv() {
    unset -f lazy_load_rbenv rbenv
    eval "$(command rbenv init - zsh)"
  }
  rbenv() {
    lazy_load_rbenv
    rbenv "$@"
  }
fi

if JAVA_HOME_17=$(/usr/libexec/java_home -v 17 2>/dev/null); then
  export JAVA_HOME="$JAVA_HOME_17"
  path=("$JAVA_HOME/bin" $path)
fi
unset JAVA_HOME_17
path=(/opt/homebrew/sbin $path)

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL/bin" ] && path=("$BUN_INSTALL/bin" $path)
export GOPATH="${GOPATH:-$HOME/go}"
[ -d "$GOPATH/bin" ] && path=("$GOPATH/bin" $path)
[ -d "$HOME/.local/bin" ] && path=("$HOME/.local/bin" $path)
export PATH
