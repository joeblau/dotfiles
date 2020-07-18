#!/usr/bin/env bash

# Install command-line tools using Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade 

# Install Bundle
brew bundle

# Clean up
brew cleanup
