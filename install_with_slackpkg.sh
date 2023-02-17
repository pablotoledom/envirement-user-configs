#!/bin/bash

# install nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install node
# nvm install node

# install yarn
# //npm install -g yarn

# Install terminal tools
# sudo slackpkg install mlocate 7z bat zsh neovim

# Install bat a beatiful cat command
# mkdir -p ~/.local/bin
# ln -s /usr/bin/bat ~/.local/bin/batcat

# Change shell to user pablo
# user=whoami # Get user in session
# sudo usermod --shell /usr/bin/zsh $pablo

###########################################
#####                                  ####
#####            ZSH config            ####
#####                                  ####
###########################################

# Copy fonts
sudo cp -r ./fonts/hack/*.* /usr/share/fonts
sudo cp -r ./fonts/meslolgs/*.* /usr/share/fonts
sudo cp -r ./fonts/powerline/*.* /usr/share/fonts

# Copy to /usr/share directory
sudo mkdir -p /usr/share/zsh/plugins
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

mkdir -p ~/zsh/themes
curl -o ~/zsh/themes/powerlevel10k.tar.gz -sL https://github.com/romkatv/powerlevel10k/archive/refs/tags/v1.17.0.tar.gz 
tar -zxvf ~/zsh/themes/powerlevel10k.tar.gz --directory ~/zsh/themes/
mv ~/zsh/themes/powerlevel10k-1.17.0 ~/zsh/themes/powerlevel10k

# Copy terminal configurations 
cp -r ./copy_to_user_folder/.bashrc ~/.bashrc
cp -r ./copy_to_user_folder/.bash_profile ~/.bash_profile
cp -r ./copy_to_user_folder/.zshrc ~/.zshrc


###########################################
#####                                  ####
#####        NVIM CONFIGURATION        ####
#####                                  ####
###########################################

# Copy files to user directory
mkdir -p ~/.config/nvim
cp -r ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim