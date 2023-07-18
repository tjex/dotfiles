# script that installs all the various things I use (incase I need to reinstall a system from scratch)

# clone down dotfiles first!

# zsh

#git clone https://github.com/sindresorhus/pure.git "${ZDOTDIR}/pure" || exit
#env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

# arch

declare -a packages=($(cat pacman-installed.txt | tr '\n' ' '))

# for package in ${packages[@]}
# do
#     echo ${package}
# done
sudo pacman -Syu ${packages}


