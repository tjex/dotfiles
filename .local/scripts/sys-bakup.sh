#! /usr/bin/env bash


sudo rsync -aAXH --delete --progress --stats \
    --exclude "/run/*" \
    --exclude "/dev/*" \
    --exclude "/sys/*" \
    --exclude "/proc/*" \
    --exclude "/mnt/*" \
    --exclude "/media/*" \
    --exclude "/tmp/*" \
    --exclude "/lost+found/*" \
    --exclude ".cache" \
    --exclude ".local/state" \
    / /mnt/extra/lappy-tmp-bak

sudo pacman -Qqe > /tmp/lappy-pkglist.txt 
sudo cp /tmp/lappy-pkglist.txt /mnt/extra/lappy-tmp-bak/lappy-pkglist.txt
