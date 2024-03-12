# ========== zsh config ==========
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
export HISTSIZE=100000
export SAVEHIST=100000
# =============================

# ========== User specific aliases and functions ==========
alias ll='ls -lF'
alias la='ls -lAF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias relogin='exec $SHELL -l'

# alias rm='rm -i'
alias rmtrash='rm -rf ${HOME}/.Trash/* && rm -rf ${HOME}/.Trash/.*'
alias rmdownloads='rm -rf ${HOME}/Downloads/* && rm -rf ${HOME}/Downloads/.*'
alias rmnm='rm -rf ./node_modules'

alias delds='find . -name ".DS_Store" -type f -ls -delete'

alias g='git'
alias gb='git branch'
alias gs='git status'
function gcl (){
  local URL=$1
  git clone "${URL}"
}
function gch (){
  local BRANCH=${1:-main}
  git checkout "${BRANCH}"
}
function gcb (){
  local BRANCH=$1
  git checkout -b "${BRANCH}"
}
function ga (){
  local FILE=${1:-.}
  git add "${FILE}"
}
function gc (){
  local MESSAGE=${1:-minor adjustment}
  git commit -m "${MESSAGE}"
}
alias gca='git commit --amend'
alias gf='git fetch'
function gr(){
  local BRANCH=${1:-main}
  git rebase "${BRANCH}"
}
alias gpl='git pull origin HEAD'
alias gps='git push origin HEAD'
alias gac='git reset HEAD .'
alias gcc='git reset --hard HEAD~'
function gss (){
  local MESSAGE=$1
  git stash save "${MESSAGE}"
}
alias gsl='git stash list'
function gsa (){
  local STASH_NAME=$1
  git stash apply "${STASH_NAME}"
}
function gsd (){
  local STASH_NAME=$1
  git stash drop "${STASH_NAME}"
}

# function gi (){
# local QUERY=$1
# curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/${QUERY} >> .gitignore
# }
# alias gil='curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/list'
# alias gihelp='echo "gitignore.io help:\n - gil: lists the operating systems, programming languages and IDE input types\n - gi <types>: creates .gitignore files for types of operating systems, programming languages or IDEs"'

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

alias alhelp='cat ${HOME}/.zshrc'
# ===============================================

# Run neofetch at startup
neofetch
