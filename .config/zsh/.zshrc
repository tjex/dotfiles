# edited config from Luke Smith

# Enable colors:
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# settings via paths
source "${XDG_CONFIG_HOME}/shell/shortcutrc"
source "${XDG_CONFIG_HOME}/shell/aliasrc"
source "${XDG_CONFIG_HOME}/shell/zshnameddirrc"
source "${XDG_CONFIG_HOME}/shell/functions"
source "${XDG_CONFIG_HOME}/shell/keybinds"
source "${XDG_CONFIG_HOME}/shell/vi-mode"
#source "/usr/share/fzf/key-bindings.zsh"
#source "/usr/share/fzf/completion.zsh"
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

# Basic auto/tab settings:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[4 q';; # underline
    esac
}
# call the function
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[4 q"
}
# call the function
zle -N zle-line-init

echo -ne '\e[4 q' # Use underline shape cursor on startup.
preexec() { echo -ne '\e[4 q' ;} # Use underline shape cursor for each new prompt.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Load syntax highlighting.
source "${HOME}/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" 
#
# theming should be be sourced last (after syntax highlighting as fast-theme is part of
# fast-syntax-highlighting.plugin)
source "${XDG_CONFIG_HOME}/shell/design"

