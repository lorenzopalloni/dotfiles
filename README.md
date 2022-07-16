## dotfiles

1. Update the system
```sh
apt update
```

2. Install some useful packages
```sh
apt install -y vim zsh tmux git xclip python3.8 python3.8-venv python-pip
```

3. Generate an ssh key
```sh
ssh-keygen -t rsa -b 4096
```

4. Copy the public key
```sh
xclip -sel clipboard -i ~/.ssh/id_rsa.pub
```

5. Paste [here](https://github.com/settings/keys)

6. install oh-my-zsh
```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

7. install Vundle
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

8. Install zsh-syntax-highlighing
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

9. Replace all the dotfiles (TODO: backup the replaced files)
```sh
python3.8 ./replace_all_dotfiles.py
```

