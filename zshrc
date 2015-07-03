#----------------
# ZSH config
#----------------
# Prevent putting duplicate lines in the history
setopt HIST_IGNORE_DUPS

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt IGNORE_BRACES
unsetopt IGNORE_CLOSE_BRACES

# Enable autocompletion
autoload -U compinit && compinit

# completion of line switches for aliases
#setopt completealiases

autoload -U promptinit && promptinit
autoload -U colors && colors

# LS colors
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# superglobs
setopt extendedglob
unsetopt caseglob

setopt auto_cd

setopt promptsubst

#----------------
# General
#----------------
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export EDITOR="vim"
set -o emacs

#----------------
# Prompt
#----------------
# show current rbenv version if different from rbenv global
rbenv_version_status() {
  local ver=$(rbenv version-name)
  [ "$(rbenv global)" != "$ver" ] && echo "[$ver]"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# show red star if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

# if in a git repo, show dirty indicator + git branch
git_custom_status() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local gitprompt='$(git_custom_status)'
local rubyprompt='$(rbenv_version_status)'

PS1="%{$fg[green]%}%n %{$fg[yellow]%}%~ ${gitprompt}%{$fg[red]%}${rubyprompt}%{$reset_color%} $ "

#----------------
# Aliases
#----------------
source $HOME/dotfiles/aliases

#----------------
# Functions
#----------------
function dash() {
  open "dash://$1"
}

# Format JSON
function pjson {
    if [ $# -gt 0 ];
        then
        for arg in $@
        do
            if [ -f $arg ];
                then
                less $arg | python -m json.tool
            else
                echo "$arg" | python -m json.tool
            fi
        done
    fi
}

function jcurl() {
  curl -o output.json $* | pjson output.json
}

# https://github.com/joelthelion/autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

#----------------
# Needs to load at the end
#----------------
eval "$(direnv hook zsh)"
source $HOME/Downloads/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
