#!/usr/bin/env bash

# This script is used to setup a raspberry pi after initial imaging
# it will install my raspi dotfiles and other base tools I need

function setup() {
    echo "updating and upgrading raspberry"
    sudo apt-get update -y
    sudo apt-get upgrade -y

    echo "----------"
    echo "installing git and zsh"
    sudo apt-get install git zsh curl -y

    # install dotfiles
    echo "----------"
    echo "adding ssh key to agent for passwordless execution"
    eval $(ssh-agent)
    ssh-add ~/.ssh/raspi
    echo "cloning dot files"
    dotf_alias="/usr/bin/git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME"
    cd ~
    git clone --bare git@github.com:tjex/dotfiles.git $HOME/.dotf-cfg
    ${dotf_alias} config --local status.showUntrackedFiles no
    ${dotf_alias} checkout raspi

    echo "----------"
    echo "changing default shell to zsh"
    chsh -s $(which zsh)

}

function installWezterm() {
    cd ~
    read -p 'do you need to install rust? (Y/N): ' confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        echo "installing rust"
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
    echo "----------"
    echo "installing wezterm binaries to /usr/local/bin"
    mkdir -p /usr/local/bin /etc/profile.d
    sudo install -Dm755 assets/open-wezterm-here wezterm wezterm-mux-server strip-ansi-escapes -t /usr/local/bin
    sudo install -Dm644 assets/shell-integration/* -t /etc/profile.d
    sudo install -Dm644 assets/shell-completion/zsh /usr/share/zsh/site-functions/_wezterm
    sudo install -Dm644 assets/shell-completion/bash /etc/bash_completion.d/wezterm
    cd ~
}

function installNeovim() {
    sudo apt-get install ninja-build gettext cmake unzip curl
}

# base setup
read -p 'have you copied over:
    - ssh credentials (for git) / or generated a new pair and added to github?
    - ~/.zshenv?
    (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo 'confirmed'
    setup
else
    echo 'denied. not running script'
fi

# extra
echo "----------"
read -p 'install wezterm? (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo 'confirmed'
    installWezterm
else
    echo 'denied'
fi