#!/usr/bin/env bash

source ${XDG_DATA_HOME}/nvm/nvm.sh 
cd $HOME/tjroot/dev/abudget/actual-tjex
nohup yarn start > /dev/null &