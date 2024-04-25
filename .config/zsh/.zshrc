# tonnes of ques from Luke Smith
# www.lukesmith.xyz

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME}/history/zshhistory"

# settings via paths
source "${XDG_CONFIG_HOME}/shell/paths"
source "${XDG_CONFIG_HOME}/shell/aliasrc"
source "${XDG_CONFIG_HOME}/shell/opts"
source "${XDG_CONFIG_HOME}/shell/functions"
source "${XDG_CONFIG_HOME}/shell/keybinds"
source "${XDG_CONFIG_HOME}/shell/vi-mode"
source "${XDG_CONFIG_HOME}/zsh/.fzf.zsh"

completion() {

	# Basic auto/tab settings:
	autoload -U compinit
	zstyle ':completion:*' menu select
	zmodload zsh/complist
	compinit
	_comp_options+=(globdots) # Include hidden files.

	# Use vim keys in tab complete menu:
	bindkey -M menuselect 'h' vi-backward-char
	bindkey -M menuselect 'k' vi-up-line-or-history
	bindkey -M menuselect 'l' vi-forward-char
	bindkey -M menuselect 'j' vi-down-line-or-history
	bindkey -v '^?' backward-delete-char
}

# function should be called after path sourcing
completion

# virtualenv (source BEFORE shell design)
source ${XDG_DATA_HOME}/venv/sys/bin/activate

# plugins
source "${HOME}/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# theming should be be sourced last (after syntax highlighting as fast-theme is part of
# fast-syntax-highlighting.plugin)
source "${XDG_CONFIG_HOME}/shell/design"

