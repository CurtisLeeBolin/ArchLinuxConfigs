# ~/.bashrc
# ArchLinux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(/usr/bin/lesspipe)"

# Environment Variables
if [ "$(id -u)" == "0" ]; then
    PS1="\[\e[0;31m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[0;37m\]:\[\e[0;35m\]\w \[\e[0;31m\]# \[\e[0;37m\]"
else
    PS1="\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[0;37m\]:\[\e[0;35m\]\w \[\e[0;31m\]$ \[\e[0;37m\]"
fi
EDITOR=nano

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color auto'

# man with colors using less
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# usage: sprunge <file> or <some_command> | sprunge
sprunge() {
	curl -F 'sprunge=<-' http://sprunge.us < "${1:-/dev/stdin}"
}

# start screen
if [ "${SSH_TTY:-x}" != x ] && hash yaourt > /dev/null 2>&1; then
        screen -xRR
fi
