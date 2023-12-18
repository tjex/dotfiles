#!/usr/bin/env bash

# backup selected files and folders to cairo usb thumb drive

script_dir=$(dirname "$(realpath "$0")")
cairo="/Volumes/cairo"
restic=$(which restic)

#restic repos
r_docs="${cairo}/backups/r-docs"
r_notes="${cairo}/backups/r-notes"
r_ssh="${cairo}/backups/r-ssh"
r_gnupg="${cairo}/backups/r-gnupg"
r_abudget="${cairo}/backups/r-abudget"

resticRepos=(${r_docs} ${r_notes} ${r_ssh} ${r_gnupg} ${r_abudget})

printStep() {
    echo ""
    echo "-> ${1}"
}

resticCleanup() {
    for repo in ${resticRepos[@]}; do
        printStep "Pruning: ${repo}"
        restic -r ${repo} forget --keep-last 4
        restic -r ${repo} prune
    done
}

backup() {
    echo "========== RESTIC BACKUPS =========="

    printStep "backup docs"
    restic -r ${r_docs} backup \
        --tag script-bup $HOME/docs

    printStep "backup notes"
    restic -r ${r_notes} backup \
        --tag script-bup $HOME/notes

    printStep "backup ssh"
    restic -r ${r_ssh} backup \
        --tag script-bup $HOME/.ssh

    printStep "backup gnupg"
    restic -r ${r_gnupg} backup \
        --tag script-bup $XDG_DATA_HOME/gnupg

    printStep "backup actual"
    restic -r ${r_abudget} backup \
        --tag script-bup ~/.local/src/installed/abudget/actual-tjex/user-files

    # cleanup restic repos
    resticCleanup

    echo "========== RESTIC COMPLETED =========="

    # copy over the actual restic binary in case I need to run via the usb itself
    printStep "copied restic binary"
    cp -r $(which restic) "${cairo}/backups"
    chmod 777 "${cairo}/backups/restic"


    printStep "backup password store"
    rsync -arplu --del ${PASSWORD_STORE_DIR} "${cairo}/backups"

    # Export Brewfile
    cd "$cairo/backups"

    printStep "backup brewfile"
    # rm Brewfile if it is present
    if [ -f Brewfile ]; then
        echo "Brewfile found, removing it"
        rm Brewfile
    fi

    # generate new Brewfile
    printStep "exporting Brewfile"
    brew bundle dump
    cd ${script_dir}

    # sys python venv
    printStep "backup python virtualenv"
    pip freeze >"${cairo}/backups/sys_venv_requirements.txt"


}


# dummy check that the drive is mounted and
# encrypted image is open
if mount | grep "cairo" >/dev/null; then
    backup
else
    echo "'cairo' is not mounted"
fi
