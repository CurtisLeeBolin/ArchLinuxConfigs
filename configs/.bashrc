# ~/.bashrc
# ArchLinux

# If not running interactively, do nothing
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(/usr/bin/lesspipe)"

# shell prompt customization
if [ "$(id -u)" == '0' ]; then
  export PS1='\[\e[0;31m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h \[\e[0;35m\]\w \[\e[0;31m\]\n# \[\e[0;37m\]'
else
  export PS1='\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h \[\e[0;35m\]\w \[\e[0;31m\]\n$ \[\e[0;37m\]'
fi

# set editor
export EDITOR=nano

# enable color support
alias ls='ls --color=auto --group-directories-first -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color auto'

# Use bash-completion, if available
[[ ${PS1} && -f /usr/share/bash-completion/bash_completion ]] && \
  source /usr/share/bash-completion/bash_completion

# man with color
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
export BAT_PAGER='less --RAW-CONTROL-CHARS'

# less with syntax highlighting
export LESS='--RAW-CONTROL-CHARS --clear-screen'
export BAT_THEME='Monokai Extended'

# usage: <some_command> | sprunge
sprunge() {
  curl -F 'sprunge=<-' https://sprunge.us
}

# usage: <some_command> | 0x0
0x0() {
  curl -F 'file=@-' https://0x0.st
}

## avoid duplicates
export HISTCONTROL=ignorespace:erasedups

# append history entries
shopt -s histappend

# after each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# add $HOME/.local/bin to PATH
export PATH=${HOME}/.local/bin:${PATH}

# start tmux
if [ -z "${TMUX}" ] && hash tmux 2>/dev/null; then
  exec tmux attach
fi
