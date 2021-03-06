# BAI
export ME=cbournho
PATH=$PATH:~/.riseml/bin:~/Code/build-tools/scripts

# the default path is in /etc/paths
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export EDITOR='vim'

source ~/.zprezto/init.zsh

#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Deal with virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# SSH agent
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

# Add aliases
source $HOME/.aliases

# Make Tmux update the value of display
# -- Improved X11 forwarding through GNU Screen (or tmux).
# If not in screen or tmux, update the DISPLAY cache.
# If we are, update the value of DISPLAY to be that in the cache.
function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display.txt
    else
        export DISPLAY=`cat ~/.display.txt`
    fi
}

# This is run before every command.
# Makes tmux update the value of display
preexec() {
    # Don't cause a preexec for PROMPT_COMMAND.
    # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return 

    update-x11-forwarding

    # Debugging.
    #echo DISPLAY = $DISPLAY, display.txt = `cat ~/.display.txt`, STY = $STY, TMUX = $TMUX  
}
trap 'preexec' DEBUG

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_OPTS='-i'
export FZF_DEFAULT_OPTS='-i'
export FZF_DEFAULT_COMMAND='rg --files --smart-case --no-ignore --hidden --follow --glob "!.git/*"'
