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
