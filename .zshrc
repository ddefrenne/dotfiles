source ~/dotfiles/.exportsrc
source ~/dotfiles/.aliasesrc

setopt AUTO_CD
setopt EMACS
setopt HIST_SAVE_NO_DUPS
setopt HIST_NO_STORE
setopt EXTENDED_GLOB
setopt PROMPT_SUBST
setopt SH_FILE_EXPANSION
unsetopt BEEP

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%b "

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo " %{$fg[red]%}${vcs_info_msg_0_}"
  fi
}

# '' around the prompt delays the evaluation, making sure vcs_info
# knows about the branch being used in the current dir
export PROMPT='%{$fg[blue]%}[%~]$(vcs_info_wrapper)%{$reset_color%}: '
