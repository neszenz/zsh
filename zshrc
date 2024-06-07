# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '~/.config/zsh/zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

## custom settings - +=+ - +=+ - +=+ - +=+ - +=+ - +=+ - +=+ - +=+ - +=+ - +=+ +
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd extendedglob

export KEYTIMEOUT=1 # o.1 seconds delay after <esc>
export EDITOR=nvim

source /etc/profile
eval "$(zoxide init --cmd cd zsh)"

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
    eval "$(starship completions zsh)"
else
    precmd() { if [[ -v PRECMD_CALLED_AT_LEAST_ONCE ]]; then echo; else PRECMD_CALLED_AT_LEAST_ONCE=1; fi }
    export PS1="%{$(tput setaf 2)%}%n%{$(tput setaf 255)%} %{$(tput setaf 6)%}%~%{$(tput setaf 255)%} > "
    export RPS1="%?"
fi
