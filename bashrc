# Basic exports
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export CLICOLOR=yes
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=vim
export HISTCONTROL=ignoreboth
export PS1='[\u@\h]$ '
export LESS='r'

# Aliases
alias ls="ls -G"
alias ll="ls -la"
alias rm="rm -i"
alias cp="cp -i"
alias j="jobs"
alias vi="/usr/bin/vim"
alias javac="javac -J-Dfile.encoding=UTF8"
## tmux
alias tl="tmux list-sessions"
## git
alias gdfh="git diff FETCH_HEAD"

# Functions
## Perl
perltest () {
  perl ./Makefile.PL PREFIX=${HOME}/work/perl/modules/Testing
}
pmver () {
  perl -M$1 -l -e "print $1->VERSION;"
}

# *env settings
## rbenv
[ -d ${HOME}/.rbenv ] &&
  export PATH=${HOME}/.rbenv/shims:${PATH} &&
  eval "$(rbenv init -)"
## phpenv
[ -d ${HOME}/.phpenv ] &&
  export PATH=${HOME}/.phpenv/bin:${HOME}/.phpenv/shims:${PATH} &&
  eval "$(phpenv init -)"
## plenv
[ -d ${HOME}/.plenv ] &&
  export PATH=${HOME}/.plenv/bin:${HOME}/.plenv/shims:${PATH} &&
  eval "$(plenv init -)"
## pyenv
[ -d ${HOME}/.pyenv ] &&
  export PYENV_ROOT="$HOME/.pyenv" &&
  export PATH=${HOME}/.pyenv/shims:${PATH} &&
  eval "$(pyenv init -)"

# PATH
export PATH=${HOME}/bin:${PATH}
