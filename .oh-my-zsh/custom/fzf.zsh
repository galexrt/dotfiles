source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPTS="--inline-info --height 20% --reverse --border --no-mouse"

bindkey '\C-t' 'transpose-chars'
bindkey '^R' fzf-history-widget
