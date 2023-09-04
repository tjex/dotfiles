#! /usr/bin/env bash

# script to update all utilities within the ~/.local/utils folder

# lua debugger

cd ./local-lua-debugger-vscode
git pull
npm install
npm run build


