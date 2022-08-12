#!/bin/sh

set -o errexit  # terminate the script on command fails
set -o nounset  # terminate the script on variable unset

# Clone this repo
git clone git@github.com:lorenzopalloni/dotfiles.git

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighing
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Switch shell (logout required to make it effective)
sudo chsh -s $(which zsh)
# if you do not have root permissions, run the two following lines:
#echo "export SHELL=$(which zsh)" >> ~/.profile
#echo "[ -z "$ZSH_VERSION" ] && exec "$SHELL" -ladd" >> ~/.profile

# Back up and update all the dotfiles
python3 ./replace_all_dotfiles.py

