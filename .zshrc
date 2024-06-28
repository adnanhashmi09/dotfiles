if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

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
alias dbtun='ssh -i /home/adnan/data/Code/middleware/db_pk -L localhost:5433:rds-staging-proxy.proxy-cupgmfepxjnb.ap-south-1.rds.amazonaws.com:5432 ec2-user@10.0.1.192'
alias dbmu='docker run --rm -it --network=host -v "$(pwd)/db:/db" ghcr.io/amacneil/dbmate --url "postgres://postgres:postgres@localhost:9221/monocleth?sslmode=disable" up'
alias dbmn='docker run --rm -it --network=host -v "$(pwd)/db:/db" ghcr.io/amacneil/dbmate new'
alias tmux='tmux -u'
alias vpn='sudo openvpn --config /home/adnan/Documents/main_aws/scripts/adnan.ovpn --auth-user-pass /home/adnan/Documents/main_aws/scripts/adnan.pass.txt'

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# TEMPORARY ENV VARIABLES FOR MIDDLEWARE
# export ENABLE_DEPLOY_TYPES="API,WORKER,CRON"
# export MHQ_PROJECT_VERSION_QUEUE="test"
# export MONOCLE_CAL_SYNC_QUEUE="test2"
# export MONOCLE_DATA_MIGRATION_QUEUE="test"
# export MONOCLE_INCIDENT_SERVICE_SYNC_QUEUE="test"
# export MONOCLE_NOTIFICATION_QUEUE="test"
# export MONOCLE_OPENSOURCE_REPO_QUEUE="test"
# export MONOCLE_OPENSOURCE_SVG_QUEUE="test"
# export MONOCLE_PLAYBOOK_RULE_QUEUE="test"
# export MONOCLE_PROJECT_SYNC_QUEUE="project_sync"
# export MONOCLE_REPO_SYNC_QUEUE="test"
# export MONOCLE_SPRINT_CHECK_SYNC_QUEUE="test"
# export MONOCLE_SPRINT_SYNC_QUEUE="test"
# export MONOCLE_WORKFLOW_QUEUE="test"
# export MONOCLETH_DB_HOST="localhost"
# export MONOCLETH_DB_PORT="6543"
# export MHQ_INCIDENT_TEAMS_SYNC_QUEUE="test"

# Shell integrations
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=$PATH:$HOME/opt/venv/bin
