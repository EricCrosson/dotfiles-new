# Path to your oh-my-zsh installation.
export ZSH=/home/eric/.oh-my-zsh
setopt extended_glob

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# fino
ZSH_THEME="jaischeema"

DISABLE_UPDATE_PROMPT=true
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/eric/bin/nix:/home/eric/bin/linux:/home/eric/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/eric/.gem/ruby/2.2.0/bin:/home/eric/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/eric/bin/nix:/home/eric/bin/kanto:/home/eric/.gem/ruby/2.0.0/bin:/home/eric/bin/linux:/home/eric/bin/p4v/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:$HOME/.rbenv/bin
eval "$(rbenv init -)"
export PATH=$PATH:/$HOME/.rbenv/plugins/ruby-build/bin

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # TODO: emacsclient-ize
  export EDITOR='emacs'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias yaourt='pacapt '

### Virtualenvwrapper config
source /usr/local/bin/virtualenvwrapper.sh

### ShoreTel specific configs ####
export P4PORT=10.160.0.30:1667     # Austin users
export P4USER=ecrosson
export CANDYUSER=ecrosson
export P4CLIENT=nebuchadnezzar

setopt auto_cd
cdpath=($HOME/workspace /depot/phone/proj/main)

## Pphone configs

unset P_ALL P_NAMES p2s p8s p8cgs
# Usage:
# $1- variable name in bash
# $2- variable value in bash
# $3- type of phone (optional)
function register_phone()
{
    export $1=$2
    if (( -n $(echo $P_ALL| grep "$2") || -n $(echo P_NAMES|grep "$1") )); then
	return
    fi
 
    export P_ALL="${P_ALL} $2"
    export P_NAMES="${P_NAMES} $1"
 
    case "$3" in
        (*2)   export p2s="${p2s} $2"     ;;
        (*8c*) export p8cgs="${p8cgs} $2" ;;
        (*)    export p8s="${p8s} $2"     ;;
    esac
}
register_phone biggie p8001049161263.shoretel.com   p8
register_phone kelly  p8cg00104926882B.shoretel.com p8cg
register_phone ice    p80010491611D6.shoretel.com   p8
register_phone short  p8001049161273.shoretel.com    p8

# Dbus configuration, starts emacs 10x faster
# eval $(dbus-launch --sh-syntax)
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
