#!/usr/bin/env bash

CAIRO=/Volumes/cairo

# only run if cairo is mounted
if  mount | grep "cairo" > /dev/null ; then
    rsync -ramlu ${TJROOT}/docs /Volumes/cairo ; echo "copied: docs"
    rsync -ramlu ${TJROOT}/notes /Volumes/cairo ; echo "copied: notes"
    rsync -ramlu --exclude="massage" ${TJROOT}/obsidian /Volumes/cairo ; echo "copied: obsidian"
    rsync -ramlu ${PASSWORD_STORE_DIR} /Volumes/cairo ; echo "copied: password store"
    rsync -ramlu ${TJROOT}/dev/abudget/actual-tjex/user-files/* /Volumes/cairo/backups/abudget-user-files ; echo "copied: abudgt user files"

    # list of individual files to copy (little backups)
    rsync -ramlu --from-file=indiv_backup_files.txt /Volumes/cairo/backups ; echo "copied individual files from list"
fi


