#!/usr/bin/env bash

CAIRO=/Volumes/cairo

# only run if cairo is mounted
if  mount | grep "cairo" > /dev/null ; then
    rsync -ramPlu ${TJROOT}/docs /Volumes/cairo ; echo "backed up docs"
    rsync -ramPlu ${TJROOT}/notes /Volumes/cairo ; echo "backed up notes"
    rsync -ramPlu --exclude="massage" ${TJROOT}/obsidian /Volumes/cairo ; echo "backed up obsidian"
    rsync -ramPlu ${PASSWORD_STORE_DIR} /Volumes/cairo ; echo "backed up password store"
fi


