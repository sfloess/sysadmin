# .bashrc

# ------------------------------------------------------------

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ------------------------------------------------------------

__compute_circle() {
    if [ "$1" = "0" ]
    then
        echo 🔵
    else
        echo 🔴
    fi
}

__compute_git_info() {
    local GIT_INFO="`git remote 2> /dev/null | tr -s '\n' '/' | rev | cut -c2- | rev` `git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/'`"

    if [ "${GIT_INFO}" != " " ]
    then
        echo " ${GIT_INFO}"
    fi
}

__prompt_command() {
    local STATUS="$?"
    local CIRCLE=`__compute_circle ${STATUS}`
    local GIT_INFO=`__compute_git_info`

    PS1="\n${CIRCLE}\[\033[0;37m\][\[\033[1;34m\]\u\[\033[0;31m\]@\h\[\033[0;32m\]${GIT_INFO}\[\033[0;37m\]] \`pwd\`>\[\033[0m\] "
}

# ------------------------------------------------------------

export PROMPT_COMMAND=__prompt_command

# ------------------------------------------------------------

export TERM=xterm-color

# ------------------------------------------------------------

export BIN_HOME=/root/Bin
export CONFIG_HOME=/root/Config

export PATH=${BIN_HOME}:${PATH}

# ------------------------------------------------------------

alias vi='vim'
alias vim='vim -p -N -u ~/Config/gvimrc'
alias gvim='gvim -p -N -u ~/Config/gvimrc'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias gen-mac="openssl rand -hex 6 | sed 's/\(..\)\(..\)\(..\)\(..\)\(..\)\(..\)/\1:\2:\3:\4:\5:\6/'"

# ------------------------------------------------------------


