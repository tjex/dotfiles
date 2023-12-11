#!/usr/bin/env bash

submodules=("${XDG_DATA_HOME}/bkmr" "${XDG_DATA_HOME}/abook" "${XDG_CONFIG_HOME}/mutt")

for sm in "${submodules[@]}"; do
    echo "----------------------"
    echo "repo: ${sm}"
    cd $sm
    git pull
    git add .
    git commit -m "batch update from script"
    git push
    cd ~
done


