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

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Overwrite ~/.oh-my-zsh/lib/misc.zsh configurations
export PAGER='less'
export LESS='-F -R'

# Functions
venv() { source ~/.venv/"${1:-green}"/bin/activate }

