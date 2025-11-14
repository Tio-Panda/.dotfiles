#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History
HISTFILE=~/.zsh_history

# Source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/prompt.zsh"
plug "$HOME/.config/zsh/bindkey.zsh"

# Plugins
#plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
#plug "zap-zsh/vim"
#plug "zap-zsh/zap-prompt"
plug "zap-zsh/fzf"
#plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"

# Arreglar esa wea pa poder ocupar el plugin
ZVM_CURSOR_STYLE_ENABLED=false

# Startup Tmux
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
    tmux new-session -A -s home
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/panda/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/panda/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/panda/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/panda/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

