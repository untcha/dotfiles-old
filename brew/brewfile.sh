#!/bin/bash

install_brews() {
	# Update brew
	brew update
	
	# Install Formulae
	brew install fping
	brew install git
	brew install jenv
	brew install mas
	brew install prettyping
	brew install tree
	brew install tvnamer
	brew install zsh
	brew install zsh-syntax-highlighting
	
	# Clean up
	brew cleanup
}