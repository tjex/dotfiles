#!/usr/bin/env bash

ARCHIVEA0="/Volumes/archive-a0"
THUMB256="/Volumes/thumb256"

# backup to archive-a0 ssd
if  mount | grep "$ARCHIVEA0" > /dev/null ; then
    /opt/homebrew/bin/restic -r "$ARCHIVEA0"/restic-dev backup \
        --tag auto-bup $HOME/t-root/dev \
        --password-file="$HOME/.config/tjc-ignored/restic-personal.txt" || exit

    /opt/homebrew/bin/restic -r "$ARCHIVEA0"/restic-docs backup \
        --tag auto-bup $HOME/t-root/docs \
        --password-file="$HOME/.config/tjc-ignored/restic-personal.txt" || exit
    echo "Backed up to archive-a0"
fi

/opt/homebrew/bin/restic -r $HOME/t-root/backups-local/restic-actual-user-files backup \
        --tag auto-bup $HOME/t-root/dev/personal/abudget/actual-tjex/user-files \
        $HOME/t-root/dev/personal/abudget/actual-tjex/server-files\
        --password-file="$HOME/.config/tjc-ignored/restic-personal.txt" || exit

# backup to thumb256 usb
if  mount | grep "$THUMB256" > /dev/null ; then
    /opt/homebrew/bin/restic -r "$THUMB256"/backups/restic-docs backup \
        --tag auto-bup $HOME/t-root/docs \
        --password-file="$HOME/.config/tjc-ignored/restic-personal.txt" || exit
    echo "Backed up to thumb256"
fi
