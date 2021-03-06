# bspwm config
export PANEL_FIFO=/tmp/panel-fifo
export PATH=$PATH:$HOME/.config/bspwm/panel

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes in ~/.oh-my-zsh/themes/, "random" is also understood
ZSH_THEME="random"
# dstufft
# pygmaloin
# jaischeema.zsh-theme
# re5et
# half-life
# sonicradish :: used on nebuchadnezzar
# juanghurtado
# norm: uses a lambda, looks better than lambda
# idea: merge lambda with one of the above themes for a personal mix

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# M-, (copy-earlier-word) cycles backward through words of the command you've
# accessed with M-. (insert-last-word)
autoload copy-earlier-word && zle -N copy-earlier-word && bindkey '^[,' copy-earlier-word

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux nyan colored-man)

# User configuration
export PATH="$HOME/bin/nix:$HOME/bin/linux:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.gem/ruby/2.2.0/bin:$PATH"

source $ZSH/oh-my-zsh.sh
[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh
[ -f /usr/bin/local/virtualenvwrapper.sh ] && source /usr/bin/local/virtualenvwrapper.sh
unalias d

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
    # fix your emacsclient
  export EDITOR='vim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
    source ~/dotfiles/fzf/.fzfrc
    alias f='fzf'
fi

function serve {
    port="${1:-3000}"
    ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => ${port}, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}

export VERBOSE_CD=1
# TODO: replace cd with this neophyte
d() {
    cd "$@" && ([[ -n $VERBOSE_CD && -n "$@" ]] && l)
}

alias gs='git status '
alias yum='sudo yum '
alias cpi=cherry-pick-into

# avoid submitting these commands into the shell's history
alias nautilus=' nautilus'
alias powertop=' sudo powertop'

alias pdown='shutdown -h now'
alias sudo='sudo '
