#!/usr/bin/env bash

# clones all settings files from main vault (with some excluded files) to all other vaults.
obsidianDir="/Users/tillman/t-root/obsidian"
rsync -av --exclude={'.DS_Store','app.json','daily-notes.json','templates.json'} \
    $obsidianDir/paradigm-shift/.obsidian/ $obsidianDir/massage/.obsidian/ 

