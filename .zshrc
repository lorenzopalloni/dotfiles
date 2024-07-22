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

# Functions
venv() { source ~/.venv/"${1:-green}"/bin/activate }

# disable the headerbar
# gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

