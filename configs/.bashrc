# ~/.bashrc
# ArchLinux

# If not running interactively, do nothing
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(/usr/bin/lesspipe)"

# Environment Variables
if [ "$(id -u)" == "0" ]; then
  export PS1="\[\e[0;31m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h \[\e[0;35m\]\w \[\e[0;31m\]\n# \[\e[0;37m\]"
else
  export PS1="\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h \[\e[0;35m\]\w \[\e[0;31m\]\n$ \[\e[0;37m\]"
fi
export EDITOR=nano

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto --group-directories-first -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color auto'

# cow cp for cow file systems like btrfs
alias cowcp='cp --reflink=always'

# Use bash-completion, if available
[[ ${PS1} && -f /usr/share/bash-completion/bash_completion ]] && \
  source /usr/share/bash-completion/bash_completion

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

# less with syntax highlighting
if hash pygmentize 2>/dev/null; then
  export LESS='-R'
  export LESSOPEN='|pygmentize -P style=monokai -g %s'
fi

# usage: <some_command> | sprunge
sprunge() {
  curl -F 'sprunge=<-' https://sprunge.us
}

# usage: <some_command> | 0x0
0x0() {
  curl -F 'file=@-' https://0x0.st
}

# Bash Settings
## avoid duplicates
export HISTCONTROL=ignoredups:erasedups
## append history entries
shopt -s histappend
## After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Add $HOME/.local/bin to PATH
export PATH=${HOME}/.local/bin:${PATH}

# start tmux
if [ -z "${TMUX}" ] && hash tmux 2>/dev/null; then
  exec tmux attach
fi
