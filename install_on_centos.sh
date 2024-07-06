#!/bin/bash

echo '████████████████████████████████████████████████████████████'
echo '█████████╔═╗██████╔╗██████████████╔╗████████████████████████'
echo '█████████║╦╬═╦╦═╦═╬╬╦╦═╦═╦╦══╦═╦═╦╣╚╗███████████████████████'
echo '█████████║╩╣║║╠╗║╔╣║╔╣╬║║║║║║║╩╣║║║╔╣███████████████████████'
echo '█████████╚═╩╩═╝╚═╝╚╩╝╚═╩╩═╩╩╩╩═╩╩═╩═╝███████████████████████'
echo '███████████████████████╔══╗██████████╔╗█████████████████████'
echo '███████████████████████║╔═╬═╦═╦╦═╦╦╦═╣╚╦═╦╦╗████████████████'
echo '███████████████████████║╚╗║╩╣║║║╩╣╔╣╩╣╔╣╬║╔╝████████████████'
echo '███████████████████████╚══╩═╩╩═╩═╩╝╚═╩═╩═╩╝█████████████████'
echo '████████████████████████████████████████████████████████████'

# Copy fonts
sudo cp ./fonts/hack/*.* /usr/share/fonts
sudo cp ./fonts/meslolgs/*.* /usr/share/fonts
sudo cp ./fonts/powerline/*.* /usr/share/fonts

# *************************************************************** #
#                  2- Install terminal tools                      #
# *************************************************************** #
echo '2- Installing terminal tools...'
source ./show/divbar
sleep .5


sudo yum install mlocate -y
sudo yum install p7zip p7zip-plugins -y
sudo yum install epel-release -y
sudo yum install bat -y
sudo yum install tmux -y
sudo yum install neovim -y
# sudo yum install zsh -y

# Install bat a beatiful cat command
# mkdir -p ~/.local/bin
# ln -s /usr/bin/bat ~/.local/bin/batcat


# *************************************************************** #
#    3- Copy ZSH plugins to /usr/share/zsh/plugins directory      #
# *************************************************************** #
cd ..
source ./show/divbar
echo '3- Installing ZSH themes and plugins...'
sleep .5

# # Copy to /usr/share directory
sudo mkdir -p /usr/share/zsh/plugins
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

# 3.1 Copy ZSH RUNCOM to user directory
cp -r ./copy_to_user_folder/.zshrc ~/

# # Copy files to user directory
mkdir -p ~/.config/nvim
cp ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim


# *************************************************************** #
#                 4- Install PowerLevel10k theme                  #
# *************************************************************** #
source ./show/divbar
echo '4- Instaling powerlevel10k zsh theme'
source ./show/divbar
sleep .5

# 4.1 Enter to theme directory
mkdir -p ./copy_to_user_folder/zsh/themes/
cd ./copy_to_user_folder/zsh/themes/
curl -LO https://github.com/romkatv/powerlevel10k/archive/refs/tags/v1.19.0.tar.gz
tar -zxvf v1.19.0.tar.gz
rm v1.19.0.tar.gz
cd ../../..

mkdir -p ~/zsh/themes
cp -r copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0 ~/zsh/themes/powerlevel10k
rm -r copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0

# 4.9 Create ZSH plugins directory
sudo mkdir -p /usr/share/zsh/plugins

# 4.10 Copy plugins to recentily created directory
sudo cp -r ./copy_to_usr_share/zsh/plugins /usr/share/zsh # Add sudo word when press two times the return key


# *************************************************************** #
#               5- Copy neovim configuration                      #
# *************************************************************** #
source ./show/divbar
echo '5- Installing VIM plugins...'
source ./show/divbar
sleep .5

# 5.1 Copy RUNCOM to user directory
cp -r ./copy_to_user_folder/.vimrc ~/

# 5.2 Create .vim directories
mkdir -p  ~/.vim/plugged

# 5.3 Copy plugins list
cp -r ./copy_to_user_folder/.vim/plugins.vim ~/.vim/plugins.vim

# 5.4 Copy configuration init file
mkdir -p ~/.config/nvim
cp -r ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim

# 5.5 Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 5.6 Copy nvim plugins
cd ./copy_to_user_folder/.vim/
tar -zxvf plugged.tar.gz
cp -r plugged/* ~/.vim/plugged
rm -R -f plugged
cd ../..


# *************************************************************** #
#                   6- Others configuration                       #
# *************************************************************** #
# 6.1 Change shell to user pablo
chsh -s /bin/zsh

# Update zsh to 5.1:
sudo yum groupinstall -y "Development Tools"
sudo yum install -y ncurses-devel wget

cd /usr/local/src
sudo wget https://sourceforge.net/projects/zsh/files/zsh/5.1/zsh-5.1.tar.xz
sudo tar -xf zsh-5.1.tar.xz
cd zsh-5.1

sudo ./configure
sudo make
sudo make install

zsh --version

echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh