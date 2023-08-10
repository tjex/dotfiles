#!/usr/bin/env bash

source $HOME/.config/nvm/nvm.sh 
nvm use 16
cd $HOME/t-root/dev/personal/abudget/actual-tjex || exit
yarn start
