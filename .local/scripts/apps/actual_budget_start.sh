#!/usr/bin/env bash

source ${XDG_DATA_HOME}/nvm/nvm.sh 
cd $HOME/.local/src/abudget/actual-tjex
nohup yarn start > /dev/null &
