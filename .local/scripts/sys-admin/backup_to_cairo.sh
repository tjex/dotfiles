#!/usr/bin/env bash

script_dir=$(dirname "$(realpath "$0")")
echo $script_dir

# only run if cairo is mounted
if  mount | grep "cairo" > /dev/null ; then
    rsync -ramlu ${TJROOT}/docs /Volumes/cairo ; echo "copied: docs"
    rsync -ramlu ${TJROOT}/notes /Volumes/cairo ; echo "copied: notes"
    rsync -ramlu --exclude="massage" ${TJROOT}/obsidian /Volumes/cairo ; echo "copied: obsidian"
    rsync -ramlu ${PASSWORD_STORE_DIR} /Volumes/cairo ; echo "copied: password store"
    rsync -ramlu ${TJROOT}/dev/abudget/actual-tjex/user-files/* /Volumes/cairo/backups/abudget-user-files ; echo "copied: abudgt user files"

    # list of individual files to copy (little backups)
    # /Users/tjex is the root folder for execution, i.e. the path that rsync will prepend to paths in the list
    rsync -av --files-from="/Users/tjex/.local/scripts/sys-admin/indiv_files.txt" /Users/tjex/ /Volumes/cairo/backups ; echo "copied individual files from list"
fi

