# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light lukechilds/zsh-nvm


# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::colorize

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

#Exports
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:/home/$USER/.local/bin
export PATH=$PATH:/snap/bin
export PATH=$PATH:/home/$USER/.cargo/bin
export PATH=$PATH:/home/$USER/flutter/flutter/bin
#export PATH="$HOME/.npm/bin:$PATH"
#export PATH="./node_modules/.bin:$PATH"
#export PATH="/home/$USER/Android/Sdk/build-tools/35.0.1:$PATH"

# Scripts
source ~/.android_scripts.sh

# Aliases
alias luamake="/home/$USER/.config/lsp/lua-language-server/3rd/luamake/luamake"
alias pattern_create="/opt/metasploit-framework/embedded/bin/ruby /opt/metasploit-framework/embedded/framework/tools/exploit/pattern_create.rb"
alias ls='ls --color'
alias vim='nvim'
alias vi='nvim'
alias clip="xclip -selection clipboard" 
alias apktool="java -jar ~/tools/apktool.jar"
alias sp="searchsploit"
alias apkeditor="java -jar ~/tools/apkeditor.jar"
alias sync-ts='xsetwacom set "ELAN9009:00 04F3:2C1B" MapToOutput DP-1;xsetwacom set "ELAN9008:00 04F3:2D55" MapToOutput eDP-1'
sync-ts

#Wordlists
rockyou="/usr/share/wordlists/rockyou.txt"
seclist="/usr/share/seclists"
secw="/usr/share/seclists/Discovery/Web-Content"
smallw="$seclist/Discovery/Web-Content/raft-small-words.txt"
lsmallw="$seclist/Discovery/Web-Content/raft-small-words-lowercase.txt"
subt5="$seclist/Discovery/DNS/subdomains-top1million-5000.txt"
subt20="$seclist/Discovery/DNS/subdomains-top1million-20000.txt"

# functions

##Listening for reverse shells, Having access to default commands and save the history file
lrev(){
  history_default="$HOME/.revshell_history"
  history_file=$(echo "RevShell_$(pwd | rev | cut -d '/' -f 1 | rev).history")
  default_lport="443"

  Lport="$1"
  if [ -z "$1" ];then
    Lport="$default_lport"
  fi

  if [ ! -f "$history_file" ];then
    cp "$history_default" "$history_file"
  fi

  rlfe -h "$history_file" nc -lnvp $Lport
}

# some more ls aliases
alias l='ls -CF'
alias ll='ls -ClhF'
alias la='ls -CaF'
alias lla='ls -CalhF'
alias l.='ls -CAF --ignore=\*'
alias ll.='ls -CAlhF --ignore=\*'
alias t='tree -a -C'


#Keybindings
bindkey -e 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#History
HISTSIZE=90000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
#setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


