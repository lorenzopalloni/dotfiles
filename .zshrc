# .zshrc
#####################################################################
#####################################################################

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands in history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion before running it
setopt share_history          # share history between shells (e.g. tmux panes)

# Directories: `cd -<TAB>` lists recently visited directories
setopt auto_pushd pushd_ignore_dups pushdminus

# Completion
eval "$(dircolors -b)"
# full completion check at most once a day, otherwise use the cache (faster startup)
autoload -Uz compinit
if [[ -n ~/.cache/zcompdump(N.mh+24) ]]; then
    compinit -d ~/.cache/zcompdump
else
    compinit -C -d ~/.cache/zcompdump
fi
setopt complete_in_word always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Prevent pipe to vanish after a completion
ZLE_REMOVE_SUFFIX_CHARS=""

# Key bindings: vi mode (Esc for normal mode, i/a/A/... back to insert)
bindkey -v
KEYTIMEOUT=1  # switch to normal mode 10ms after Esc, not 400ms

# Insert mode: Backspace/C-w/C-u can delete text typed before the last Esc,
# and a few emacs keys still work (C-a/C-e start/end of line)
bindkey -M viins '^?' backward-delete-char '^H' backward-delete-char
bindkey -M viins '^W' backward-kill-word   '^U' backward-kill-line
bindkey -M viins '^A' beginning-of-line    '^E' end-of-line

# Up/Down (and k/j in normal mode): search history for commands
# starting with what's already typed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
for keymap in viins vicmd; do
    bindkey -M $keymap '^[[A' up-line-or-beginning-search   '^[OA' up-line-or-beginning-search
    bindkey -M $keymap '^[[B' down-line-or-beginning-search '^[OB' down-line-or-beginning-search
    # Home/End/Delete, Ctrl-Left/Right (both GNOME Terminal and tmux codes)
    bindkey -M $keymap '^[[H' beginning-of-line '^[OH' beginning-of-line '^[[1~' beginning-of-line
    bindkey -M $keymap '^[[F' end-of-line       '^[OF' end-of-line       '^[[4~' end-of-line
    bindkey -M $keymap '^[[3~' delete-char
    bindkey -M $keymap '^[[1;5D' backward-word '^[[1;5C' forward-word
done
unset keymap
bindkey -M vicmd 'k' up-line-or-beginning-search 'j' down-line-or-beginning-search

# Normal mode: `v` opens the current command line in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Text objects for quotes and brackets: ci" da( yi{ ...
autoload -Uz select-quoted select-bracketed
zle -N select-quoted
zle -N select-bracketed
for keymap in viopp visual; do
    for c in {a,i}{\',\",\`}; do bindkey -M $keymap $c select-quoted; done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do bindkey -M $keymap $c select-bracketed; done
done
unset keymap c

# Cursor shape shows the mode: beam in insert, block in normal.
# Commands (e.g. vim) always start with a block cursor.
autoload -Uz add-zle-hook-widget
_cursor_shape() { [[ $KEYMAP == vicmd ]] && print -n '\e[2 q' || print -n '\e[6 q' }
add-zle-hook-widget keymap-select _cursor_shape
add-zle-hook-widget line-init _cursor_shape
autoload -Uz add-zsh-hook
_block_cursor() { print -n '\e[2 q' }
add-zsh-hook preexec _block_cursor

# Aliases
alias ls='ls --color=auto'
alias l='ls -lah'
alias grep='grep --color=auto --exclude-dir=.git'

# Prompt: ➜ (green, or red after a failed command), current dir, git branch
# A ✗ after the branch means tracked files have uncommitted changes.
git_prompt() {
    local branch dirty
    branch=$(git symbolic-ref --short HEAD 2>/dev/null \
        || git rev-parse --short HEAD 2>/dev/null) || return
    [[ -n $(git status --porcelain --untracked-files=no 2>/dev/null) ]] \
        && dirty='%F{yellow} ✗%f'
    print -rn -- "%F{blue}git:(%F{red}${branch//\%/%%}%F{blue})%f${dirty} "
}
setopt prompt_subst
PROMPT='%B%(?.%F{green}.%F{red})➜ %f %F{cyan}%c%f $(git_prompt)%b'

export EDITOR='vim'
export GIT_EDITOR='vim'

# Functions
venv() { source ~/.venv/"${1:-green}"/bin/activate }

# disable the headerbar
# gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

export PATH="$HOME/.local/bin:$PATH"


# Inside a distrobox (e.g. ubuntu22) show its name in front of the prompt
if [[ -n "$CONTAINER_ID" ]]; then
  PROMPT="%F{magenta}[$CONTAINER_ID]%f $PROMPT"
fi
eval "$(mise activate zsh)"

# Plugins (pacman packages; skipped silently where not installed, e.g. on servers)
# fzf: Ctrl-R fuzzy history, Ctrl-T fuzzy file picker, Alt-C fuzzy cd
[[ -t 0 ]] && (( $+commands[fzf] )) && source <(fzf --zsh)
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do  # highlighting must be last
    [[ -r /usr/share/zsh/plugins/$plugin/$plugin.zsh ]] \
        && source /usr/share/zsh/plugins/$plugin/$plugin.zsh
done
unset plugin
