# dotfile tracking with bare repo

[What is a bare repo?](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/)

[This article](https://www.atlassian.com/git/tutorials/dotfiles) goes into depth about 
this technique of tracking dotfiles with a bare repo.

*DO NOT* blindly trust any of the [scripts](https://github.com/tjex/dotfiles/tree/mac/.local/scripts) that I
have in my dotfiles. Always audit and test them yourself before running on any critical files.

Here are color schemes for:
- [neovim](.config/nvim/after/colors.lua)
- [neomutt](.config/mutt/colors)
- [wezterm](.config/wezterm/design.lua)

To clone this setup (more so a message to myself, I don't recommend mass installing other people's
configs...):

```zsh
# set alias for current shell scope
alias dotf='/usr/bin/git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME'
cd ~
git clone --bare git@github.com:tjex/dotfiles.git $HOME/.dotf-cfg

# this checks the branch out, populating the directories with tracked files
# note: git may complain that there already exists files that would be overwritten.
# you can delete or move them elsewhere to then merge manually - git won't offer 
# any merging itself as it does not know of these files itself and can therefore 
# not execute any merging.
dotf checkout

# only show tracked files - otherwise all files in your home directory and further
# will be seen by git as files of interest to track.
dotf config --local status.showUntrackedFiles no

dotf add <stuff>
dotf commit -m "broke everything, so now I will force push"
dotf push -f

```
