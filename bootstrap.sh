#! /bin/bash

# helpers
function echo_ok { echo -e '\033[32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }


#######################################################################################
#
#     install BREW

which brew > /dev/null
if [[ $? != 0 ]]; then
	echo_warn "Installing \"Brew\" ..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo_ok "\"Brew\" already installed"
fi


#######################################################################################
#
#     install Oh my ZSH

if [ -d "$ZSH" ]; then
	echo_ok "\"Oh my ZSH\" already installed"
else
	echo_warn "Installing \"Oh my ZSH\" ..."
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh	
fi


#######################################################################################
#
#     install Python3
which python3 > /dev/null
if [[ $? != 0 ]]; then
	echo_warn 'Installing "Python3" ...'
	brew install python3

	pip3 install --upgrade pip setuptools wheel
	pip3 install virtualenvwrapper

	brew linkapps python3
else
	echo_ok '"Python3" already installed'
fi

#######################################################################################
#
#    install additional tools

which htop > /dev/null
if [[ $? != 0 ]]; then
	echo_warn 'Installing "htop" ...'
	brew install htop
else
	echo_ok '"htop" already installed'
fi

# more brew
brew update && brew cleanup && brew cask cleanup

brew tap caskroom/fonts

# brew cask fonts
echo_warn "Installing fonts..."
brew cask install \
  font-droid-sans \
  font-droid-sans-mono font-droid-sans-mono-for-powerline \
  font-inconsolata font-inconsolata-for-powerline \
  font-office-code-pro \
  font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \


#######################################################################################
#
#     sync dotfiles

echo ""
echo_warn "********************************************************************************"
echo_warn "**                               Syncing dotfiles                             **"
echo_warn "********************************************************************************"

rsync --exclude ".git/" \
	  --exclude ".DS_Store" \
	  --exclude "bootstrap.sh" \
	  --exclude "README.markdown" \
	  --exclude "LICENSE-MIT.txt" \
	  -avh \
	  --update \
	  -t \
	  --no-perms . ~
 

rsync -zarvu $HOME'/.zshrc' $HOME'/.vimrc' .

#source ~/.zshrc
