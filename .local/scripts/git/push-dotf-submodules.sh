#!/usr/bin/env bash

submodules=("${XDG_DATA_HOME}/bkmr" "${XDG_DATA_HOME}/abook")

for sm in "${submodules[@]}"; do
    cd $sm
    git add .
    echo "committing to ${sm}"
    git commit -m "batch update from script"
    git push
    cd ~
done


