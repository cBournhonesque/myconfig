# PYTHON
export UV_CACHE_DIR=/spare/ssd/cbournhonesque/uvenvs/.cache

# PATHS
export EDITOR='vim'
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
source ~/.zprezto/init.zsh

#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

# Vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Add aliases
source $HOME/.aliases

# ZSH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_OPTS='-i'
export FZF_DEFAULT_OPTS='-i'
export FZF_DEFAULT_COMMAND='rg --files --smart-case --no-ignore --hidden --follow --glob "!.git/*"'

# GO
export GOPATH=$HOME/go

# Rust
export CARGO_HOME=/spare/ssd/cbournhonesque/src/.cargo
export RUSTUP_HOME=/spare/ssd/cbournhonesque/src/.rustup
export PKG_CONFIG_PATH=/spare/local/cbournhonesque/.micromamba/envs/xgb/lib/pkgconfig/

. "$HOME/.local/bin/env"

# POLARS
export DPRINT_INSTALL="/apps/stonefs1/cbournhonesque/.dprint"
export PATH="$DPRINT_INSTALL/bin:$PATH"
# PYENV
# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

# Stop zsh-syntax-highlighting from using a missing bracketed-paste-url-magic.
# Restores Zsh's builtin bracketed-paste widget.
zle -D bracketed-paste 2>/dev/null
