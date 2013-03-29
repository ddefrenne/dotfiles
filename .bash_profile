function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PATH=/usr/local/bin:$HOME/.rbenv/bin:$PATH

BLUE="\[\033[0;34m\]"
RED="\[\033[0;31m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_RED="\[\033[1;31m\]"
RESET="\[\033[0m\]"

export PS1="[$BLUE\t] \W: $RED\$(parse_git_branch) $RESET"

alias vimconfig="vim ~/.vimrc"
alias bashconfig="vim ~/.bash_profile"

alias be="bundle exec"
alias rc="bundle exec rails console"
alias rs="bundle exec rails server"

alias gco="git checkout"
alias gst="git status"
alias gfp="git fetch && git pull --rebase origin "

alias ctagsr="ctags -R --exclude=log --exclude=coverage --exclude=.git -h 'rb.js.coffee.scss.html.haml.yml' &> /dev/null"
alias st="open -a SourceTree ."

export EDITOR="vim"
export PAGE="less -R"

eval "$(rbenv init -)"
