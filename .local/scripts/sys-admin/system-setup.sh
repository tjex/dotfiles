# script that installs all the various things I use (incase I need to reinstall a system from scratch)

# import ssh keys first

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

# packages not installed through brew
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest # file manager
