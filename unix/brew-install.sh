#!/bin/bash

type brew >/dev/null 2>&1 || {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

brew doctor
brew update
brew upgrade

taps=(
  azure/functions
)

formulas=(
  git
  node
  yarn
  azure-cli
  azure-functions-core-tools
  wget
  redis
  sqlite
  rbenv
  automake
  boost
  go
  open-cobol
)

# TODO: someday add casks...
# evernote
# google-chrome
# slack
# visual-studio-code
# visual-studio
# docker
# appcleaner
casks=(
  github
  powershell
)

for tap in "${taps[@]}"; do
  brew tap $tap
done

for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

for cask in "${casks[@]}"; do
  brew cask install $cask || brew cask upgrade $cask
done

brew cleanup
