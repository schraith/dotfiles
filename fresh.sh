#!/bin/sh

echo "Setting up your Mac..."

export DOTFILES=~/.dotfiles

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# Remove .p10k.zsh from $HOM$ (if it exists) and symlink into .dotfiles directory
rm -rf $HOME/.p10k.zsh
ln -s $DOTFILES/.p10k.zsh $HOME/.p10k.zsh

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Install PHP extensions with PECL
pecl install imagick redis swoole

# Clone Github repositories
$DOTFILES/clone.sh

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
