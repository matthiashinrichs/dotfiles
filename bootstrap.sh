#! /bin/bash

#######################################################################################
#
#     install BREW

which brew > /dev/null
if [[ $? != 0 ]]; then
	echo "\"Brew\" not installed ..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "\"Brew\" already installed"
fi

#######################################################################################
#
#     install Oh my ZSH

if [ -d "$ZSH" ]; then
	echo "\"Oh my ZSH\" already installed"
else
	echo "\"Oh my ZSH\" not installed ..."
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh	
fi


#######################################################################################
#
#     sync dotfiles

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.markdown" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~

#source ~/.zshrc