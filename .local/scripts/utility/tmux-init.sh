#!/usr/bin/env bash

tmux new-session -d -ssystem -c ~/.config
tmux new-session -d -sgeneral -c ~/t-root
tmux new-session -d -skth -c ~/t-root/ctech/kth
tmux new-session -d -sobsidian -c ~/t-root/obsidian/paradigm-shifted
tmux a -tgeneral
