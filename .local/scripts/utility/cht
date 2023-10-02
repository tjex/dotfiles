#!/usr/bin/env bash

# thanks to Primeageon: https://www.youtube.com/watch?v=hJzqEAf2U4I
selected=`cat ~/.config/tmux/tmux-cht-languages.txt ~/.config/tmux/tmux-cht-commands.txt | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/tmux/tmux-cht-languages.txt; then
    query=`echo $query | tr ' ' '+'`
    tmux neww zsh -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww zsh -c "curl -s cht.sh/$selected~$query | less"
fi
