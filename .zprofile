#!/bin/zsh

unsetopt PROMPT_SP

# Default programs:
export EDITOR="nvim"
export TERMINAL="wezterm"
export TERMINAL_PROG="wezterm"
export BROWSER="brave"


# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XCD_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export TJROOT="$HOME/tjroot"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$HOME/.local/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export UNISON="$XDG_DATA_HOME/unison"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export GPGKEY="45FC951C7A7F24C4A6AA566F28AADCA2EF680971"
GPG_TTY=$(tty) ; export GPG_TTY

# history files
export SQLITE_HISTORY="$XDG_CACHE_HOME/history/sqlite_history"
export HISTFILE="$XDG_CACHE_HOME/history/zshhistory"
export PYTHONHISTORY="$XDG_CACHE_HOME/history/python"
export LESSHISTFILE="-"

# Other program settings:
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
GPG_TTY=$(tty) ; export GPG_TTY

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && setsid shortcuts >/dev/null 2>&1
