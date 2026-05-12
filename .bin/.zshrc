# ========== zsh config ==========
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# ディレクトリ名だけでcdする
setopt auto_cd
# 重複を記録しない
setopt hist_ignore_dups
# 履歴を他のシェルとリアルタイム共有する
setopt share_history
# 実行時に履歴をファイルに追加していく
setopt inc_append_history
# 履歴ファイルの保存先
HISTFILE="${HOME}/.zsh_history"
# メモリに保存される履歴の件数
export HISTSIZE=100000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# =============================

# ========== aliases ==========
alias ll='ls -lF'
alias la='ls -lAF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias relogin='exec $SHELL -l'
alias delds='find . -name ".DS_Store" -type f -ls -delete'

alias g='git'
alias gb='git branch'
alias gs='git status'
alias gf='git fetch'
# =============================

# Run fastfetch at startup
if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi
