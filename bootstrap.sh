#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	# Install Oh My Zsh
	./topics/zsh/oh-my-z.sh;

	# Install Homebrew formulae
  	./topics/homebrew/brew.sh;

	# Sensible macOS defaults
	./topics/macappstore/macos.sh;

	# Install Fonts
	./topics/typography/fonts.sh;

	# Install Powerline shell
	./topics/powerline/powerline.sh;

	# Install Apps From Mac App Store
	./topics/macappstore.sh;

	rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".osx" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE.txt" \
	-avh --no-perms . ~;

	ln -s ~/topics/functions/.functions ~/.functions
	ln -s ~/topics/bash/.bash_prompt ~/.bash_prompt
	ln -s ~/topics/bash/.bash_profile ~/.bash_profile
	ln -s ~/topics/exports/.exports ~/.exports
	ln -s ~/topics/aliases/.aliases ~/.aliases
	ln -s ~/topics/git/.extra ~/.extra

	ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/.

	ln -s ~/topics/zsh/.zshrc ~/.zshrc
	source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
