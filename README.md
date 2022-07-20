## dotfiles

### Update the system
```sh
apt update
```

### Install some useful packages
```sh
apt install -y vim zsh tmux git xclip python3.8 python3.8-venv python-pip
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

### Switch shell (logout required to make it effective)
```sh
chsh -s $(which zsh)
```

### Run Vundle through vim using :PluginInstall command

### Audio issue on Jabra Elite Active 75t
```sh
sudo add-apt-repository ppa:berglh/pulseaudio-a2dp
sudo apt update
sudo apt install pulseaudio-modules-bt libldac
```

### Back up and update all the dotfiles
```sh
python3 ./replace_all_dotfiles.py
```

### Adjust colors in the terminal
In gnome-terminal, in the top-left corner, select `preferences`, then a profile.  
In the `Colors` tab, unselect `Use colors from system theme`, for `Buil-in schemes` choose `White on black`.  
Below, in `Palette` section, select for `Built-in schemes`, the `Tango` option.  

### Add Italian keyboard alongside the English one
`Settings` >> `Region & Language` >> `Input Sources` >> `+` >> `Italian`

