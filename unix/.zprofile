# Homebrew Settings
export PATH="/usr/local/sbin:$PATH"

# Ruby Settings
export PATH=/usr/local/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Go Settings
export GOPATH=$HOME/gopath
export PATH=$PATH:$HOME/go/bin:$GOPATH/bin

# Python Settings
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# Boost C++ Settings
alias boost='-I/opt/local/include'

# Public Settings
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias chrome='open -a "Google Chrome"'