#!/usr/bin/env bash

CAIRO=/Volumes/cairo

# only run if cairo is mounted
if  mount | grep "cairo" > /dev/null ; then
    rsync -ramlu ${TJROOT}/docs /Volumes/cairo ; echo "backed up docs"
    rsync -ramlu ${TJROOT}/notes /Volumes/cairo ; echo "backed up notes"
    rsync -ramlu --exclude="massage" ${TJROOT}/obsidian /Volumes/cairo ; echo "backed up obsidian"
    rsync -ramlu ${PASSWORD_STORE_DIR} /Volumes/cairo ; echo "backed up password store"
    rsync -ramlu ${TJROOT}/dev/abudget/actual-tjex/user-files/* /Volumes/cairo/backups/abudget-user-files ; echo "backed up abudgt user files"
fi


