#!/usr/bin/env bash

if [ x"$@" = x"quit" ]
then
    exit 0
fi

if [ x"$@" = x"umount"]
then 
    umount /mnt/thumb256
fi

echo "reload"
echo "quit"
echo "umount"



