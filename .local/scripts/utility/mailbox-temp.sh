#!/usr/bin/env bash

user=$(op item get "mailbox-tillmanjex" --fields label=username)
password=$(op item get "mailbox-tillmanjex" --fields label=password)

read -p "what to do? (list or renew): " action

${HOME}/.local/bin/mailbox-org-cli --username ${user} --password ${password} ${action}
