# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dimitri/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

HIST_SAVE_NO_DUPS=true
HIST_IGNORE_DUPS=true
HIST_IGNORE_ALL_DUPS=true

autoload -U colors && colors

autoload -U promptinit && promptinit
setopt promptsubst

export BUNDLER_EDITOR="nvim"
export CARGO_TARGET_DIR="/Users/dimitri/code/rust/cargo_target_dir"
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

export PKG_CONFIG_PATH="/usr/local/opt/mariadb@10.2/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/mariadb@10.2/share/pkgconfig"

export PATH="/usr/local/opt/mariadb@10.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Users/dimitri/.cargo/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/puppetlabs/pdk/bin:$PATH"

# PS1="%c %{$fg[blue]%}"$"%{$reset_color%}"$'\n'"> "
PS1="
%c %{$fg[blue]%}"$"%{$reset_color%}"" > "

alias l="ls -F --color"

alias nv="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"

alias nvconf="nv ~/.config/nvim/init.vim"
alias vconf="vim ~/.vrc.vim"
alias vpconf="vim ~/.vrc-plugins.vim"
alias zconf="nvim ~/.zshrc"

alias b="bundle"
alias be="bundle exec"

alias ism="iex -S mix"

alias bu="brew update"

alias g="git"
alias ga="git add"
alias gb="git branch"
alias gst="git status"
alias gco="git checkout"
alias gp="git pull --rebase origin"
alias prunegit='git remote prune origin && git gc --prune=now && git gc --aggressive && git tag -l | xargs git tag -d && git fetch --tags'
alias push_it='git push origin'
alias push_it_real_good='git push --force-with-lease origin'
alias prod_tag='git tag -d production; git push origin :production; git tag -a production -m production; g push origin --tags'

export CHEF_CLIENT_KEY="/Users/dimitri/.chef/client.pem"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

eval "$(rbenv init -)"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.secrets
