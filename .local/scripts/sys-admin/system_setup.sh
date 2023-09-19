# script that installs all the various things I use (incase I need to reinstall a system from scratch)

# IMPORTANT
# import ssh keys first
# disable SIP. Boot into recovery mode and enter `csrutil disable` in terminal.

# working directory for install (if needed)
mkdir -p /tmp/system-setup

read -p "enter absolute path to Brewfile" brewfile
read -p "enter absolute path to sys_venv_requirements.txt" venv_req

reload() {
    source ~/.zprofile
    exec zsh
}


brew_and_dotfiles() {
    # FIRST (has git)
    # install homebrew, this should prompt to install xcode-terminal tools, which will include git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # dotfiles #
    # ######## #

    # setup dotfiles repo
    alias dotf='/usr/bin/git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME'
    cd ~
    git clone --bare git@github.com:tjex/dotfiles.git $HOME/.dotf-cfg
    dotf checkout
    dotf config --local status.showUntrackedFiles no

    # zsh
    mkdir -p ~/.local/share/zsh/themes
    mkdir -p ~/.local/share/zsh/plugins
    git clone https://github.com/sindresorhus/pure.git ~/.local/share/zsh/themes/pure
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.local/share/zsh/plugins/fast-sytax-highlighting

    # the restart shell so that all environment variables / pahths from dotfiles install are in scope
    reload
}

homebrew_packages() {
    brew bundle install --file ${brewfile}
}

packages_and_langs() {

    # lf
    env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest # file manager

    # delve (go debugger)
    go install github.com/go-delve/delve/cmd/dlv@latest

    # packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # nvm
    git clone git@github.com:nvm-sh/nvm.git ~/.local/share/nvm
    cd ${TMPDIR}/nvm
    ./install.sh
    . ./nvm.sh
    cd ~

    # node / bun / etc
    nvm install node
    npm install --global yarn bun

    # tpm (tmux package manager)
    git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

    # python venv
    python3 -m venv ~/.local/share/venv/sys
    python3 -m ensurepip --upgrade
    pip install -r ${venv_req}
}

read -p 'install homebrew packages?' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    homebrew_packages
else
   echo 'exited'
fi

read -p 'install other non-brew packages and lanuages?' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    packages_and_langs
else
   echo 'exited'
fi
