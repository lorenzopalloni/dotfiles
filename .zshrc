# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Prevent pipe to vanish after a completion
ZLE_REMOVE_SUFFIX_CHARS=""

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/  # /usr/share/oh-my-zsh/

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-syntax-highlighting)

########################################
# User configuration
export EDITOR='vim'
export GIT_EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Aliases
alias juice='conda activate juice'  # python=3.7
alias green='conda activate green'  # python=3.8
alias chrome='google-chrome-stable'  # --disable-gpu, --disable-software-rasterizer

#
# PROMPT_EOL_MARK=''

# how to disable the fucking headerbar :D
# gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

export PATH="$PATH:/opt/cuda/bin"  # cuda
export PATH="$PATH:/usr/bin/java"  # java
export PATH="${PATH}:$HOME/.local/share/gem/ruby/3.0.0/bin"  # ruby

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/loopai/Packages/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/loopai/Packages/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/loopai/Packages/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/loopai/Packages/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# tensorflow logging
export TF_CPP_MIN_LOG_LEVEL=3


export PATH="$HOME/.poetry/bin:$PATH"
