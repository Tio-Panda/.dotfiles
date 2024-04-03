#!/bin/sh

## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors
FORCE_RUN_VCS_INFO=1

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt promptsubst

# enable only git 
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true

#zstyle ':vcs_info:*+*:*' debug true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # Exit early in case the worktree is on a detached HEAD
    git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

    local -a ahead_and_behind=(
        $(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
    )

    ahead=${ahead_and_behind[1]}
    behind=${ahead_and_behind[2]}

    (( $ahead )) && gitstatus+=( "+${ahead}" )
    (( $behind )) && gitstatus+=( "-${behind}" )

    hook_com[misc]+=${(j:/:)gitstatus}
}

#https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
#https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
#zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "

git="%{$fg[blue]%}(%{$fg[red]%}%{$fg[red]%}%b%{$fg[blue]%})"
zstyle ':vcs_info:git:*' formats "$git"

#user="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}]"
#user="%B%{$fg[blue]%}[%{$fg_bold[red]%}%n%{$fg[blue]%}]"
state="%(?:%{$fg_bold[green]%}[  ]:%{$fg_bold[red]%}[  ])"
env="(${VIRTUAL_ENV:t:gs/%/%%})"
dir="%{$fg[white]%}%~"
out="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜)"
out2="%(?:%{$fg_bold[green]%} :%{$fg_bold[red]%})"

# prompt_normal="$state $env $dir $out2 "
# prompt_git="$state $env $dir $out\$vcs_info_msg_0_ $out2 "

prompt_precmd() {
    vcs_info
}
#add-zsh-hook precmd prompt_precmd

# Must run vcs_info when changing directories.
prompt_chpwd() {
    FORCE_RUN_VCS_INFO=1
}
#add-zsh-hook chpwd prompt_chpwd

precmd() {
    vcs_info
    if [[ -z ${vcs_info_msg_0_} ]]; then
        if [[ -n ${VIRTUAL_ENV} ]];then
            export VIRTUAL_ENV_DISABLE_PROMPT=1
            PROMPT="$state $env $dir $out2 "
        else
            PROMPT="$state $dir $out2 "
        fi
    else
        if [[ -n ${VIRTUAL_ENV} ]];then
            export VIRTUAL_ENV_DISABLE_PROMPT=1
            PROMPT="$state $env $dir $out\$vcs_info_msg_0_ $out2 "
        else
            PROMPT="$state $dir $out\$vcs_info_msg_0_ $out2 "
        fi
    fi
    RPROMPT=''
}
