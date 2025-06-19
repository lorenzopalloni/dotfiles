# ~/.bashrc - A minimal, portable, and powerful configuration for Bash

# Exit immediately if the shell is not interactive.
case $- in
    *i*) ;;
      *) return;;
esac


# --- SENSIBLE HISTORY CONTROL ---
export HISTCONTROL=ignoreboth
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=20000


# --- SENSIBLE SHELL OPTIONS ---
# After each command, check the window size and update LINES and COLUMNS.
shopt -s checkwinsize


# --- GIT PROMPT SETUP ---
# To install the correct prompt script, run this in your terminal:
# GIT_VERSION_TAG="v$(git --version | awk '{print $3}')" && curl -o ~/.git-prompt.sh "https://raw.githubusercontent.com/git/git/${GIT_VERSION_TAG}/contrib/completion/git-prompt.sh"
#
# Now, source the script. It checks a system path first, then your home dir.
if [ -f /usr/lib/git-core/git-prompt.sh ]; then
    source /usr/lib/git-core/git-prompt.sh
elif [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# Configure the git prompt to show branch and dirty state (*=unstaged, +=staged).
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1


# --- THE PROMPT (PS1) ---
PS1='\[\033[01;36m\]\w\[\033[00m\]\[\033[01;33m\]$(__git_ps1 " (%s)")\[\033[00m\] \$ '


# --- ESSENTIALS ---
export EDITOR=vim
# Enable programmable completion (safe fallback).
if ! shopt -oq posix && [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# --- GENERAL COLOR ENABLEMENT ---
# Enable color support for common commands via aliases.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

