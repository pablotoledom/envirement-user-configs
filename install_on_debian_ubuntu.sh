#!/bin/bash
# *************************************************************** #
#                           WELCOME                               #
#                                                                 #
#  Tested on:                                                     #
#   - Ubuntu 22                                                   #
#                                                                 #
# *************************************************************** #
source ./show/welcome

user="$(whoami)" # Get user in session
echo "Hi ${user}!!"

# *************************************************************** #
#                         Copy fonts                              #
# *************************************************************** #
source ./show/divbar
echo 'Copying Nerd Fonts...'
source ./show/divbar
sleep .5

sudo mkdir -p /usr/share/fonts/TTF
sudo mkdir -p /usr/share/fonts/OTF

sudo cp -r ./fonts/hack/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/meslolgs/*.* /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.otf /usr/share/fonts/OTF

# fc-cache -f -v

# *************************************************************** #
#                    Install terminal tools                       #
# *************************************************************** #
source ./show/divbar
echo 'Installing terminal tools...'
source ./show/divbar
sleep .5

# 1- Create backup RUNCOM files
mv -f ~/.zshrc ~/.zshrc.back
mv -f ~/.vimrc ~/.vimrc.back

# Install software with apt
sudo apt -y install locate
sudo apt -y install p7zip-full
sudo apt -y install zsh
sudo apt -y install bat
sudo apt -y install lsd

# Install software .deb file
cd ./deb_files
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
sudo dpkg -i lsd_0.23.1_amd64.deb

wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo dpkg -i bat_0.23.0_amd64.deb

cd ..

# Copy ZSH plugins to /usr/share/zsh/plugins directory
sudo mkdir -p /usr/share/zsh/plugins
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

# Copy files to host directories
cp -r copy_to_user_folder/.vimrc ~/
cp -r copy_to_user_folder/.zshrc ~/

# Install PowerLevel10k theme
echo ''
echo 'Instaling powerlevel10k zsh theme'
echo ''
sleep .5

cd ./copy_to_user_folder/zsh/themes/
wget https://github.com/romkatv/powerlevel10k/archive/refs/tags/v1.19.0.tar.gz
tar -zxvf v1.19.0.tar.gz
cd ../../..
mkdir -p ~/zsh/themes
cp -r copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0 ~/zsh/themes/powerlevel10k

# Change shell to user pablo
sudo usermod --shell /usr/bin/zsh ${user}

echo '' >> ~/.bash_profile