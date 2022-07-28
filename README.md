## dotfiles

Quick set-up:
    1. Run init1.sh
    2. A public key has been saved in the clipboard, add that one with Ctrl+V [here](https://github.com/settings/keys).
    3. Run init2.sh
    4. Execute :PluginInstall in vim

### Update the system
```sh
apt update
```

### Install some useful packages
```sh
apt install -y vim-gtk3 zsh tmux git \
    python3.8 python3.8-venv python-pip \
    xclip xsel \
    tree
```

### Generate an ssh key
```sh
ssh-keygen -t rsa -b 4096
```

### Copy the public key
```sh
xclip -sel clipboard -i ~/.ssh/id_rsa.pub
```

### Paste [here](https://github.com/settings/keys)

### Clone this repo
git clone git@github.com:lorenzopalloni/dotfiles.git

### Install oh-my-zsh
```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### install Vundle
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install zsh-syntax-highlighing
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### Switch shell Bash -> Zsh

Option #1:
```sh
echo "export SHELL=$(which zsh)" >> ~/.profile
echo "[ -z "$ZSH_VERSION" ] && exec "$SHELL" -ladd" >> ~/.profile
```

Option #2 (if you have root permissions - logout required)
```sh
sudo chsh -s $(which zsh)
```

### Run Vundle through vim using :PluginInstall command

### Miscellaneous:

#### Audio issue on Jabra Elite Active 75t
```sh
sudo add-apt-repository ppa:berglh/pulseaudio-a2dp
sudo apt update
sudo apt install pulseaudio-modules-bt libldac
```

#### Back up and update all the dotfiles
```sh
python3 ./replace_all_dotfiles.py
```

#### Adjust colors in the terminal
In gnome-terminal, in the top-left corner, select `preferences`, then a profile.  
In the `Colors` tab, unselect `Use colors from system theme`, for `Buil-in schemes` choose `White on black`.  
Below, in `Palette` section, select for `Built-in schemes`, the `Tango` option.  

#### Add Italian keyboard alongside the English one
`Settings` >> `Region & Language` >> `Input Sources` >> `+` >> `Italian`

#### Visual Studio Code - Hints
Extensions:
- Vim
- install GitLens

