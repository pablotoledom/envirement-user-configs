#!/bin/bash
# Copy fonts
sudo cp ./fonts/hack/*.* /usr/share/fonts

# Install terminal tools
sudo pacman -Sy mlocate bat 7z fonts-powerline zsh zsh-syntax-highlighting zsh-autosuggestions neovim

# Install bat a beatiful cat command
# mkdir -p ~/.local/bin
# ln -s /usr/bin/bat ~/.local/bin/batcat

# Change shell to user pablo
user=whoami # Get user in session
sudo usermod --shell /usr/bin/zsh $pablo

# Copy to /usr/share directory
sudo mkdir -p /usr/share/zsh/plugins
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

# Copy files to user directory
mkdir -p ~/.config/nvim
cp ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/zsh/themes
cp -r ./copy_to_user_folder/zsh/themes/powerlevel10k ~/zsh/themes/

cp ./copy_to_user_folder/.zshrc ~/.zshrc