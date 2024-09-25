# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# FZF Config
export FZF_DEFAULT_COMMAND='fd -H -tf' # show hidden files and type="files" 
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --multi --marker='|' \
                         --tabstop=4 --exact --ansi \
                         --color gutter:-1,bg+:-1,fg+:white,hl:white,hl+:white,pointer:blue,border:blue"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export BKMR_FZF_OPTS="--reverse --height 40%"

