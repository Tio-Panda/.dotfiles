#!/bin/sh

# Useful Alias
alias n=nvim
alias la="ls -la"
alias zrel="source ~/.config/zsh/.zshrc"
alias f="tmux-sessionizer"
alias h="tmux-sessionizer home"
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# Shortcuts to config files
#alias nrc='~/.scripts/tmux/tmux-sessionizer ~/.config/nvim'
alias nrc='tmux-sessionizer nrc'
alias zrc='tmux-sessionizer zrc'
alias trc='tmux-sessionizer trc'
alias arc='tmux-sessionizer arc'

# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'

# Git alias
alias m="git checkout master"
alias s="git checkout stable"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# Get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# Get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# Diferent alias for different SO
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
