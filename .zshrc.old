# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="archcraft"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

alias vscode="~/vscode/bin/code"

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -s -m'
alias gk='git checkout'
alias gs='git status'
alias gf='git fetch'
alias gr='git rebase'
alias gp='git push origin'

#pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# command pyenv init --path >/dev/null
# eval "$(pyenv virtualenv-init -)"

#misc
alias ph='echo "I am no bird; and no net ensnares me: I am a free human being with an independent will." | xclip -selection clipboard'
alias aws='/usr/local/bin/aws'
alias btop='btop --utf-force'
alias vpn='sudo openvpn --config /home/adnan/Documents/main_aws/scripts/adnan.ovpn --auth-user-pass /home/adnan/Documents/main_aws/scripts/adnan.pass.txt'
alias buildx='/usr/lib/docker/cli-plugins/buildx'
alias dbtun='ssh -i /home/adnan/data/Code/middleware/db_pk -L localhost:5433:rds-staging-proxy.proxy-cupgmfepxjnb.ap-south-1.rds.amazonaws.com:5432 ec2-user@10.0.1.192'
alias dbmu='docker run --rm -it --network=host -v "$(pwd)/db:/db" ghcr.io/amacneil/dbmate --url "postgres://postgres:postgres@localhost:9221/monocleth?sslmode=disable" up'
alias dbmn='docker run --rm -it --network=host -v "$(pwd)/db:/db" ghcr.io/amacneil/dbmate new'
alias tmux='tmux -u'

#paths
export PATH=/home/adnan/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/adnan/pycharm/bin
export PATH=$PATH:/home/adnan/vscode/bin
export CQLSH_NO_BUNDLED=true
export PATH=/home/adnan/go/bin:$PATH
export PATH=/opt/venv/bin:$PATH

# export PATH=/usr/lib/jvm/java-19-openjdk/
#
#
# TEMPORARY ENV VARIABLES FOR MIDDLEWARE
export ENABLE_DEPLOY_TYPES="API,WORKER,CRON"
export MHQ_PROJECT_VERSION_QUEUE="test"
export MONOCLE_CAL_SYNC_QUEUE="test2"
export MONOCLE_DATA_MIGRATION_QUEUE="test"
export MONOCLE_INCIDENT_SERVICE_SYNC_QUEUE="test"
export MONOCLE_NOTIFICATION_QUEUE="test"
export MONOCLE_OPENSOURCE_REPO_QUEUE="test"
export MONOCLE_OPENSOURCE_SVG_QUEUE="test"
export MONOCLE_PLAYBOOK_RULE_QUEUE="test"
export MONOCLE_PROJECT_SYNC_QUEUE="project_sync"
export MONOCLE_REPO_SYNC_QUEUE="test"
export MONOCLE_SPRINT_CHECK_SYNC_QUEUE="test"
export MONOCLE_SPRINT_SYNC_QUEUE="test"
export MONOCLE_WORKFLOW_QUEUE="test"
export MONOCLETH_DB_HOST="localhost"
export MONOCLETH_DB_PORT="6543"
export MHQ_INCIDENT_TEAMS_SYNC_QUEUE="test"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export EDITOR='lvim'

source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
