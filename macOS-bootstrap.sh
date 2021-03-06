#!/bin/bash

echo "clone .dotfiles repo and run bootstrap scripts."
read -p "ok?(y/N): " yn; case "$yn" in [yY]*) ;; *) exit;; esac

git clone https://github.com/neko3cs/.dotfiles.git
cd .dotfiles

xcode-select --install

# docker completion
if [ ! -e ~/.zsh/completion/_docker-compose ]; then
    mkdir -p ~/.zsh/completion
    curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
fi

./dotfiles-link.sh
./brew-install.sh
pwsh ./Install-NeoBundleVim.ps1
pwsh ./vscode-extensions-install.ps1

echo 'NAME="macOS"' > /etc/os-release
