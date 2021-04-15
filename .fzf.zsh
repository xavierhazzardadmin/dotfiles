# Setup fzf
# ---------
if [[ ! "$PATH" == */home/xavierhazzardadmin/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/xavierhazzardadmin/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/xavierhazzardadmin/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/xavierhazzardadmin/.fzf/shell/key-bindings.zsh"
