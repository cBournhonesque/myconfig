# Mac
eval "$(/opt/homebrew/bin/brew shellenv)"

# GO
export GOENV_GOPATH_PREFIX=$HOME/Snapchat/dev/go
export GOPATH=$HOME/Snapchat/dev/go
export GOENV_ROOT=$HOME/Snapchat/dev/go/.goenv
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPRIVATE="*.sc-corp.net"
export GONOSUMDB="*.sc-corp.net"
export GO111MODULE=on
export GOPROXY=direct
export GOLANG_PROTOBUF_REGISTRATION_CONFLICT=ignore
export GOTMPDIR=$HOME/Snapchat/dev/tmp

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# PATHS
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:~/bin:/usr/local/go/bin:$GOENV_ROOT/bin:$PATH
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export EDITOR='vim'
export ZPLUG_HOME=/opt/homebrew/opt/zplug

source $ZPLUG_HOME/init.zsh
source ~/.zprezto/init.zsh

#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Add aliases
source $HOME/.aliases

# Git
source $HOME/Snapchat/dev/go/src/github.sc-corp.net/Snapchat/git-subrepo/.rc

# ZSH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_OPTS='-i'
export FZF_DEFAULT_OPTS='-i'
export FZF_DEFAULT_COMMAND='rg --files --smart-case --no-ignore --hidden --follow --glob "!.git/*"'

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Jyenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Goenv
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
eval "$(goenv init -)"

# Kubernetes
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export KUBECONFIG=~/.kube/config:$(for i in $(find ~/.mesh/kube -iname *.yaml) ; do echo -n ":$i"; done | cut -c 2-)
source <(kubectl completion zsh)

# Zlib
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/zlib/lib"

# Mesh
# source <(mesh completion zsh)

# autopilot
export PATH="/Users/cbournhonesque/.snap/autopilot/bin:$PATH"

# HELM
export HELM_HOME=~/.helm
export PATH="/usr/local/opt/helm@3/bin:$PATH"

# GCP
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cbournhonesque/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cbournhonesque/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cbournhonesque/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cbournhonesque/google-cloud-sdk/completion.zsh.inc'; fi

source /Users/cbournhonesque/.config/broot/launcher/bash/br

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RUST
export CARGO_HOME="$HOME/Snapchat/dev/rust/.cargo"
export RUSTUP_HOME="$HOME/Snapchat/dev/rust/.rustup"
export PATH="$PATH:$HOME/Snapchat/dev/rust/.cargo/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# C++/Bazel
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# # Snap
# eval "$(_SNAPC_COMPLETE=source_bash snapc)"
export PATH="/Users/cbournhonesque/Snapchat/dev/go/src/github.sc-corp.net/Snapchat/protoc-23.4-osx-aarch_64/bin:$PATH"

