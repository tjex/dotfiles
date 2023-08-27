# script that installs all the various things I use (incase I need to reinstall a system from scratch)

# working directory for install
mkdir -p /tmp/system-setup

BREWFILE=/path/to/brew/file/dump
TMPDIR="/tmp/system-setup"

reload() {
    source ~/.zprofile
    exec zsh
}

# import ssh keys first
# disable SIP. Boot into recovery mode and enter `csrutil disable` in terminal.

# install homebrew, this should prompt to install xcode-terminal tools, which will include git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# make needed directories
mkdir -p ~/.local/share/zsh/plugins
mkdir -p ~/.local/share/zsh/themes

# setup dotfiles repo
alias dotf='/usr/bin/git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME'
cd ~
git clone --bare git@github.com:tjex/dotfiles.git $HOME/.dotf-cfg
dotf checkout
dotf config --local status.showUntrackedFiles no

# zsh
git clone https://github.com/sindresorhus/pure.git ~/.local/share/zsh/themes/pure
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.local/share/zsh/plugins/fast-sytax-highlighting

# the restart shell so that all environment variables / pahths from dotfiles install are in scope
exec zsh

##############################
# install brew packages here 
brew bundle install --file ${BREWFILE}

# lf
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest # file manager

# wails
read -p 'install wails? (Y/N): ' confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
else
   echo 'not installing wails'
fi

# packages not installed through brew
# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# nvm
mkdir -p ${TMPDIR}/nvm
git clone git@github.com:nvm-sh/nvm.git ${TMPDIR}/nvm
cd ${TMPDIR}/nvm
./install.sh
. ./nvm.sh
cd ~

# node
nvm install node
npm install --global yarn

# tpm (tmux package manager)
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm


