#!/usr/bin/env bash

# Install command-line tools using Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade 

# Utilities
brew cask install fluor
brew cask install sublime-text
brew cask install adoptopenjdk

brew link boost

# Install GNU core utilities-.
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed 
brew tap homebrew/versions
brew tap schwa/punic
brew tap sambadevi/powerlevel9k

# Install zsh
brew install zsh
brew install zsh-completions
brew install autojump

# Install `wget` with IRI support.
brew install wget 

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some macOS tools.
brew install vim 

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install htop-osx
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git 
brew install git-lfs
brew install imagemagick 
brew install lua
brew install lynx
brew install mas
brew install node
brew install p7zip
brew install pigz
brew install pv
brew install python
brew install rename
brew install rhino
brew install source-highlight
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli
brew install wrk
brew install hugo

# Install iOS Stuff
brew install carthage
brew install clang-format
brew install swiftlint
brew install swiftformat
brew install ideviceinstaller
brew install libimobiledevice
brew install sourcekitten
brew install punic

# Remove outdated versions from the cellar.
brew cleanup
