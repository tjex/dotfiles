#!/usr/bin/env bash

ARCHIVEA0="/Volumes/archive-a0"
THUMB256="/Volumes/thumb256"

# backup to archive-a0 ssd
if  mount | grep "$ARCHIVEA0" > /dev/null ; then
    /opt/homebrew/bin/restic -r "$ARCHIVEA0"/restic-dev backup \
        --tag auto-bup $HOME/tjroot/dev \
        --password=${RESTICPASS} || exit

    /opt/homebrew/bin/restic -r "$ARCHIVEA0"/restic-docs backup \
        --tag auto-bup $HOME/tjroot/docs \
        --password=${RESTICPASS} || exit
    echo "Backed up to archive-a0"
fi

/opt/homebrew/bin/restic -r $HOME/tjroot/backups/restic-actual-user-files backup \
        --tag auto-bup $HOME/tjroot/dev/personal/abudget/actual-tjex/user-files \
        $HOME/tjroot/dev/personal/abudget/actual-tjex/server-files\
        --password=${RESTICPASS} || exit

# backup to thumb256 usb
if  mount | grep "$THUMB256" > /dev/null ; then
    /opt/homebrew/bin/restic -r "$THUMB256"/backups/restic-docs backup \
        --tag auto-bup $HOME/tjroot/docs \
        --password=${RESTICPASS} || exit
    echo "Backed up to thumb256"
fi
