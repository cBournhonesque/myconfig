export EDITOR='vim'
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH

source ~/.zprezto/init.zsh

#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh
