#!/usr/bin/env bash

tmux new-session -d -ssystem -c ~/.config
tmux new-session -d -sgeneral -c ~/tjroot
tmux new-session -d -sthesis -c ~/tjroot/ctech/kth
tmux new-session -d -sobsidian -c ~/tjroot/obsidian/paradigm-shifted
tmux a -tgeneral
