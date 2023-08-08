#!/bin/bash
# *************************************************************** #
#                           WELCOME                               #
#                                                                 #
#  Tested on:                                                     #
#   - Ubuntu 22                                                   #
#                                                                 #
# *************************************************************** #
source ./show/welcome

# Get user in session and say hello
user="$(whoami)" 
echo "Hi ${user}!!"

# *************************************************************** #
#                       1- Copy fonts                             #
# *************************************************************** #
source ./show/divbar
echo '1- Copying Nerd Fonts...'
source ./show/divbar
sleep .5

# 1.1 Create fonst type directories
sudo mkdir -p /usr/share/fonts/TTF
sudo mkdir -p /usr/share/fonts/OTF

# 1.2 Copy all fonts
sudo cp -r ./fonts/hack/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/meslolgs/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.otf /usr/share/fonts/OTF

# *************************************************************** #
#                  2- Install terminal tools                      #
# *************************************************************** #
echo '2- Installing terminal tools...'
source ./show/divbar
sleep .5

# 2.1 Create backup RUNCOM files
mv -f ~/.zshrc ~/.zshrc.back
mv -f ~/.vimrc ~/.vimrc.back

# 2.2 Install software with apt
sudo apt -y install locate
sudo apt -y install p7zip-full
sudo apt -y install zsh
sudo apt -y install bat
sudo apt -y install lsd
sudo apt -y install tmux

# 2.3 Install software .deb file
cd ./deb_files
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
sudo dpkg -i lsd_0.23.1_amd64.deb

wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo dpkg -i bat_0.23.0_amd64.deb

# 2.4 Delete created files
rm lsd_0.23.1_amd64.deb
rm bat_0.23.0_amd64.deb

# *************************************************************** #
#    3- Copy ZSH plugins to /usr/share/zsh/plugins directory      #
# *************************************************************** #
cd ..
source ./show/divbar
echo '3- Installing ZSH themes and plugins...'
sleep .5

# 3.1 Copy ZSH RUNCOM to user directory
cp -r ./copy_to_user_folder/.zshrc ~/

# *************************************************************** #
#                 4- Install PowerLevel10k theme                  #
# *************************************************************** #
source ./show/divbar
echo '4- Instaling powerlevel10k zsh theme'
source ./show/divbar
sleep .5

# 4.1 Enter to theme directory
cd ./copy_to_user_folder/zsh/themes/

# 4.2 Download PowerLevel10k theme
wget https://github.com/romkatv/powerlevel10k/archive/refs/tags/v1.19.0.tar.gz

# 4.3 Extract directory powerlevel10k-1.19.0 from tar.gz file
tar -zxvf v1.19.0.tar.gz

# 4.4 Delete downloaded file
rm v1.19.0.tar.gz

# 4.5 Return to base directory
cd ../../..

# 4.6 Create ZSH themes directory
mkdir -p ~/zsh/themes

# 4.7 Copy PowerLevel10k to recentily created directory
cp -r copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0 ~/zsh/themes/powerlevel10k

# 4.8 Delete temporality directory
rm -r copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0

# 4.9 Create ZSH plugins directory
sudo mkdir -p /usr/share/zsh/plugins

# 4.10 Copy plugins to recentily created directory
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

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
sudo usermod --shell /usr/bin/zsh ${user}

echo '' >> ~/.bash_profile