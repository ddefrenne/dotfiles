# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Change this value to set how frequently ZSH updates¬
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias ctagsr="ctags -R --exclude=log --exclude=coverage --exclude=.git -h 'rb.js.coffee.scss.html.haml.yml' &> /dev/null"
alias st="open -a SourceTree ."
alias tmux="tmux -u -2"
alias l="ls -al"

alias ta="tmux attach -t "
alias tk="tmux kill-session -t "

alias be="bundle exec"
alias rc="rails console"
alias rs="rails server"

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin
export PATH=/usr/local/Cellar:/usr/local/bin:$HOME/.rbenv/bin:$PATH
#export PATH=/usr/local/bin:$PATH
export EDITOR="vim"
export PAGER="less -R"
export DEFAULT_USER=$USERNAME

unsetopt correct_all

eval "$(rbenv init -)"
