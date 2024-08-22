# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#------------------------------------------------------------------------------
# 1. Theme
#------------------------------------------------------------------------------
ZSH_THEME="powerlevel9k/powerlevel9k"

#------------------------------------------------------------------------------
# 2. Plugins
#------------------------------------------------------------------------------

plugins=(
  git zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#------------------------------------------------------------------------------
# 3. Aliases
#------------------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias zshconfig='code ~/.zshrc'
alias setup='/opt/homebrew/bin/git --git-dir=$HOME/.machine-setup/ --work-tree=$HOME'
alias setupconfig='code ~/.machine-setup'

#------------------------------------------------------------------------------
# 8. Functions
#------------------------------------------------------------------------------
##-------------------------------------------------------------------
## myIP address
## -------------------------------------------------------------------
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

#------------------------------------------------------------------------------

# NVM Config (Legacy need update)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
