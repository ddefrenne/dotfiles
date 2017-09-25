# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_DUPS # Prevent putting duplicate lines in the history
setopt HIST_IGNORE_ALL_DUPS

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -U colors && colors

# LS colors
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
  alias ls='ls --color'
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export BUNDLER_EDITOR="nvim"
export EDITOR="nvim"
export DISABLE_SPRING=true
# export TERM="screen-256color"

#----------------
# Prompt
#----------------
autoload -U promptinit && promptinit
setopt promptsubst

# show current rbenv version if different from rbenv global
rbenv_version_status() {
  local ver=$(rbenv version-name)
  [ "$(rbenv global)" != "$ver" ] && echo "[$ver]"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%} "
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

PS1="%c %{$fg[color164]%}%{$fg[yellow]%}${gitprompt}%{$fg[red]%}${rubyprompt} $%{$reset_color%} "

#----------------
# Aliases
#----------------
source $HOME/dotfiles/aliases

#----------------
# Functions
#----------------
# https://github.com/joelthelion/autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dimitri/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# EXTRAS
export GOPATH="/Users/dimitri/code/go"
# Enabled shell history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

#----------------
# Needs to load at the end
#----------------
source $HOME/Downloads/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

eval "$(direnv hook zsh)"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
