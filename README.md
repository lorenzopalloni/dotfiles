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

### Replace all the dotfiles (TODO: backup the replaced files)
```sh
python3.8 ./replace_all_dotfiles.py
```

### Switch shell (logout required to make it effective)
```sh
chsh -s $(which zsh)
```

### Run Vundle through vim using :PluginInstall command

