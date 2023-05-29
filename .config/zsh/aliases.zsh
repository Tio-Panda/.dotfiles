#!/bin/sh

# Useful Alias
alias n=nvim
alias la="ls -la"
alias zrel="source ~/.config/zsh/.zshrc"
alias f="tmux-sessionizer"
alias h="tmux-sessionizer home"
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# Shortcuts to config files
alias nrc='tmux-sessionizer nrc'
alias zrc='tmux-sessionizer zrc'
alias trc='tmux-sessionizer trc'
alias arc='tmux-sessionizer arc'

# Git alias
#TODO: Add alias for moving between known branches with worktrees
alias m="git checkout master"
alias s="git checkout stable"

alias gs="git status"
alias gcb="git clone --bare"

alias gta="git worktree add"
alias gtr="git worktree remove --force"

alias ga="git add"

alias gc="git commit -m"
alias gca="git commit -a -m"

alias pl="git pull"
alias ps="git push"

alias g='(){ git commit -a -m "$1"; git push }'

# alias gl="git log "
alias gl='(){ git log --max-count=$1 --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)" --all }'
alias glf='(){ git log --max-count=$1 --abbrev-commit --decorate --pretty=short }'
alias glg1="(){ git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all }"
alias glg2="(){ git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' }"

alias gauthors="git log --format='%aN <%aE>' | grep -v 'users.noreply.github.com' | sort -u --ignore-case"

#TODO: Add alias for diff and solve commits diff
#diff --name-only --diff-filter=U

alias gcundo="git reset --soft HEAD~"

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
