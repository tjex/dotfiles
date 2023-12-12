#!/usr/bin/env bash

# This script is used to setup a raspberry pi after initial imaging
# it will install my raspi dotfiles and other base tools I need

pstep() {
    echo "--> ${1}"
}
function setup() {
    # make some non standard dirs that I use
    mkdir -p ~/.cache/history ~/.local/src ~/.local/bin ~/.local/share
    pstep "updating and upgrading raspberry"
    sudo apt-get update -y
    sudo apt-get upgrade -y

    pstep "installing git and zsh"
    sudo apt-get install git zsh curl -y

    # install dotfiles
    pstep "adding ssh key to agent for passwordless execution"
    eval $(ssh-agent)
    ssh-add ~/.ssh/raspi
    pstep "cloning dot files"
    dotf_alias="/usr/bin/git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME"
    cd ~
    git clone --bare git@github.com:tjex/dotfiles.git $HOME/.dotf-cfg
    ${dotf_alias} config --local status.showUntrackedFiles no
    ${dotf_alias} checkout raspi

    pstep "echochanging default shell to zsh"
    chsh -s $(which zsh)

}

function installWezterm() {
    cd ~
    read -p 'do you need to install rust? (Y/N): ' confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        pstep "installing rust"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    else
        echo 'declined'
    fi

    mkdir -p ~/.local/src/installed
    cd ~/.local/src/installed
    git clone --depth=1 --branch=main --recursive https://github.com/wez/wezterm.git
    cd wezterm
    git submodule update --init --recursive
    ./get-deps
    cargo build --release
    cd target/release
    pstep "installing wezterm binaries to /usr/local/bin"
    mkdir -p /usr/local/bin /etc/profile.d
    sudo install -Dm755 assets/open-wezterm-here wezterm wezterm-mux-server strip-ansi-escapes -t /usr/local/bin
    sudo install -Dm644 assets/shell-integration/* -t /etc/profile.d
    sudo install -Dm644 assets/shell-completion/zsh /usr/share/zsh/site-functions/_wezterm
    sudo install -Dm644 assets/shell-completion/bash /etc/bash_completion.d/wezterm
    cd ~
}

function installNeovim() {
    cd ~/.local/src/installed
    sudo apt-get install ninja-build gettext cmake unzip curl
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
}

installTheRest() {
    pstep "installing go"
    sudo apt-get install golang-go
    # symlink python3 to python
    pstep "symlinking python3 / python"
    if [ $(which python) ]; then
        python2=$(which python)
        sudo rm $(which python)
    fi
    sudo rm $(which python)
    sudo ln -s $(which python3) ${python2}
    # get pip
    pstep "installing pip"
    sudo apt install python3-pip

    # node / npm
    pstep "installing node and npm"
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    # NOTE: this will need to be updated at some point
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt-get update
    sudo apt-get install nodejs -y

    p_step "installing ntfy"
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://archive.heckel.io/apt/pubkey.txt | sudo gpg --dearmor -o /etc/apt/keyrings/archive.heckel.io.gpg
    sudo apt install apt-transport-https
    sudo sh -c "echo 'deb [arch=arm64 signed-by=/etc/apt/keyrings/archive.heckel.io.gpg] https://archive.heckel.io/apt debian main' \
    > /etc/apt/sources.list.d/archive.heckel.io.list"
    sudo apt update
    sudo apt install ntfy
    sudo systemctl enable ntfy
    sudo systemctl start ntfy
}

# base setup
read -p 'Installing dot files. Have you copied over:
    - ssh credentials (for git) / or generated a new pair and added to github?
    - ~/.zshenv?

    If so, do you want to confirm with dot file installation? (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo 'confirmed'
    setup
else
    echo 'skipping'
fi

echo "----------"
read -p 'Install wezterm (from source)? (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo 'confirmed'
    installWezterm
else
    echo 'skipping'
fi

echo "----------"
read -p 'Install neovim (from source)? (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo 'confirmed'
    installNeovim
else
    echo 'skipping'
fi

read -p 'Install "the rest", languages, utils, etc? (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo 'confirmed'
    installTheRest
else
    echo 'denied'
fi
