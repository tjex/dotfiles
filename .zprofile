#!/bin/zsh

unsetopt PROMPT_SP

# Default programs:
export EDITOR="nvim"
export TERMINAL="wezterm"
export TERMINAL_PROG="wezterm"
export BROWSER="brave browser"

# system directories
export CPATH="/usr/local/include:/opt/homebrew/include"
export LIBRARY_PATH="/usr/local/lib:/opt/homebrew/lib"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XCD_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# program directories
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export BKMR_DB_URL="$XDG_DATA_HOME/bkmr/bkmr_db"
export CABAL_DIR="$XDG_CONFIG_HOME/cabal"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg" ; export GPG_TTY=$(tty)
export GOMUKS_CONFIG_HOME="$XDG_CONFIG_HOME/gomuks"
export GOMUKS_DATA_HOME="$XDG_DATA_HOME/gomuks"
export GOMUKS_CACHE_HOME="$XDG_CACHE_HOME/gomuks"
export GOPATH="$HOME/.local/go"
export GHCUP_USE_XDG_DIRS=true
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export MAILDIR="$XDG_DATA_HOME/mail"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export NAVI_CONFIG="$XDG_CONFIG_HOME/navi/config.yaml"
export NAVI_PATH="$XDG_DATA_HOME/navi"
export NLTK_DATA="$XDG_DATA_HOME/nltk_data"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuchrc"
export NOTMUCH_DATABASE="$XDG_DATA_HOME/mail"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/history/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
export RESTIC_CACHE_DIR="$XDG_CACHE_HOME/restic"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export STACK_XDG=true # use xdg paths for haskell stack
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ZK_NOTEBOOK_DIR="$HOME/wikis/ps"

# zsh shell itself
export SHELL_SESSIONS_DISABLE=1 # disables .zsh_sessions dumps

# files
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"

# history files
export SQLITE_HISTORY="$XDG_CACHE_HOME/history/sqlite_history"
export LESSHISTFILE="-"

# Other program settings:
export LESS=-Rc
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

export BAT_THEME="ansi"

export "BKMR_FZF_OPTS=--reverse --height 100%"

# LLVM / cpp
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
