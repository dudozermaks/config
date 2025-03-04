# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/opt/flutter/bin:/home/maks/.cargo/bin:$PATH

export ANDROID_HOME=$HOME/.android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

source "$HOME/.cargo/env"

plugins=(
	git
)

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

fpath=(/usr/share/zsh/site-functions $fpath)

export EDITOR="nvim"

alias paru_list="~/.config/get_packages.sh | grep . | paru -S --needed -"
alias ls="eza"

eval "$(zoxide init zsh)"

export HISTFILE=$HOME/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# Erase duplicates
export HISTDUP=erase
setopt appendhistory

setopt sharehistory

setopt hist_ignore_space

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -U compinit && compinit
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/maks/.dart-cli-completion/zsh-config.zsh ]] && . /home/maks/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

