#!/usr/bin/env bash

# forgetting
/opt/homebrew/bin/restic -r /Volumes/archive-a0/restic-dev forget --keep-last 4 --password-file="/Users/tillman/.config/tjc-ignored/restic-personal.txt" || exit

/opt/homebrew/bin/restic -r /Volumes/archive-a0/restic-docs forget --keep-last 4 --password-file="/Users/tillman/.config/tjc-ignored/restic-personal.txt" || exit

/opt/homebrew/bin/restic -r /Users/tillman/t-root/backups-local/restic-actual-user-files forget --keep-last 4 --password-file="/Users/tillman/.config/tjc-ignored/restic-personal.txt" || exit

# pruning
/opt/homebrew/bin/restic -r /Volumes/archive-a0/restic-dev prune --password-file="/Users/tillman/.config/tjc-ignored/restic-personal.txt"|| exit
/opt/homebrew/bin/restic -r /Volumes/archive-a0/restic-docs prune --password-file="/Users/tillman/.config/tjc-ignored/restic-personal.txt"|| exit
/opt/homebrew/bin/restic -r /Users/tillman/t-root/backups-local/restic-actual-user-files prune --password-file="/Users/tillman/.config/tjc-ignored/restic-personal.txt"|| exit
