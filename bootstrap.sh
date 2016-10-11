#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	# Install Oh My Zsh
	./scripts/oh-my-z.sh;

  # Install Homebrew formulae
  ./scripts/brew.sh;

	# Sensible macOS defaults
	./scripts/macos.sh;

	# Install Fonts
	./scripts/fonts.sh;

	# Install Powerline shell
	./scripts/powerline.sh;

	# Install Apps From Mac App Store
	./scripts/macappstore.sh;

	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.txt" \
		-avh --no-perms . ~;
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
