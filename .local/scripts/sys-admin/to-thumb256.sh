#!/usr/bin/env bash

if  mount | grep "${ARCHIVEA0}" > /dev/null ; then
    rsync -avz /Volumes/archive-a0/restic-docs /Volumes/thumb256/backups
fi

rsync -avz ~/t-root/vaults/fuzz.dmg /Volumes/thumb256/backups

