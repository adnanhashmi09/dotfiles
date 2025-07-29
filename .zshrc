if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias python='python3'
alias tmux='tmux -u'
alias tmux='tmux -u'
alias v='nvim'

alias dbmu='docker run --rm -it --network=host -v "$(pwd)/db:/db" ghcr.io/amacneil/dbmate --url "postgres://postgres:postgres@localhost:9221/monocleth?sslmode=disable" up'
alias dbmn='docker run --rm -it --network=host -v "$(pwd)/db:/db" ghcr.io/amacneil/dbmate new'

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gk='git checkout'
alias gp='git push origin'
alias gc='git commit -m'
alias gs='git status'
alias gst='git stash'

#docker
alias dk='docker'
alias dc='docker compose'

#vpn
alias vpn='sudo openvpn --config adnan.ovpn --auth-user-pass ./adnan.pass.txt'

# lazygit
alias lg='lazygit'


# Shell integrations
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=$PATH:$HOME/opt/venv/bin:$HOME/.local/bin
export PATH=/usr/local/bin:$PATH

# aws local
#export AWS_ACCESS_KEY_ID="test"
#export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="ap-south-1"

eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/githubssh > /dev/null 2>&1
