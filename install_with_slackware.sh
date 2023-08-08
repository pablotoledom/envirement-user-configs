#!/bin/bash

source ./show/welcome

# install nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install node
# nvm install node

# Install terminal tools
# sudo slackpkg install mlocate 7z bat zsh neovim

###########################################
#####                                  ####
#####          Terminal tool           ####
#####                                  ####
###########################################
echo "Install LSD - Release 0.23.1"
curl -o ~/lsd-0.23.1.tar.gz -sL https://codeload.github.com/Peltoche/lsd/tar.gz/refs/tags/0.23.1
tar -zxvf ~/lsd-0.23.1.tar.gz
sudo cargo install --locked bat ~/lsd-0.23.1

echo "Install BAT - Release v0.22.1"
curl -o ~/bat-0.22.1.tar.gz -sL https://codeload.github.com/sharkdp/bat/tar.gz/refs/tags/v0.22.1
tar -zxvf ~/bat-0.22.1.tar.gz
sudo cargo install --locked bat ~/bat-0.22.1

###########################################
#####                                  ####
#####            ZSH config            ####
#####                                  ####
###########################################
echo "Adding hacker fonts"
# Copy fonts
sudo mkdir -p /usr/share/fonts/TTF
sudo mkdir -p /usr/share/fonts/OTF
sudo cp -r ./fonts/hack/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/meslolgs/*.* /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.otf /usr/share/fonts/OTF

sudo mkfontdir /usr/share/fonts/{TTF,OTF}
sudo mkfontscale /usr/share/fonts/{TTF,OTF}
fc-cache -f -v

echo "Adding ZSH plugins"
# Copy to /usr/share directory
sudo mkdir -p /usr/share/zsh/plugins
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

echo "Adding PowerLevel10K ZSH theme- Release v1.17.0"
mkdir -p ~/zsh/themes
curl -o ~/zsh/themes/powerlevel10k.tar.gz -sL https://github.com/romkatv/powerlevel10k/archive/refs/tags/v1.17.0.tar.gz 
tar -zxvf ~/zsh/themes/powerlevel10k.tar.gz --directory ~/zsh/themes/
mv ~/zsh/themes/powerlevel10k-1.17.0 ~/zsh/themes/powerlevel10k

echo "Adding terminal configurations"
# Copy terminal configurations 
cp -r ./copy_to_user_folder/.bashrc ~/.bashrc
cp -r ./copy_to_user_folder/.bash_profile ~/.bash_profile
cp -r ./copy_to_user_folder/.zshrc ~/.zshrc


###########################################
#####                                  ####
#####        NVIM CONFIGURATION        ####
#####                                  ####
###########################################
echo "Adding Neo VIM Configuration"
# Copy files to user directory
mkdir -p ~/.config/nvim
cp -r ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim

# Change shell to user pablo
# user=whoami # Get user in session
# sudo usermod --shell /usr/bin/zsh $pablo