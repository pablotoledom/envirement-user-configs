#!/bin/bash
# *************************************************************** #
#                           WELCOME                               #
#                                                                 #
#  Tested on:                                                     #
#   - Manjaro 23.0.0                                              #
#                                                                 #
# *************************************************************** #
source ./show/welcome

user="$(whoami)" # Get user in session
echo "Hi ${user}!!"

# *************************************************************** #
#                         Copy fonts                              #
# *************************************************************** #
echo ''
echo 'Copying Nerd Fonts...'
sleep .5

sudo mkdir -p /usr/share/fonts/TTF
sudo mkdir -p /usr/share/fonts/OTF

sudo cp -r ./fonts/hack/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/meslolgs/*.* /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.ttf /usr/share/fonts/TTF
sudo cp -r ./fonts/powerline/*.otf /usr/share/fonts/OTF

fc-cache -f -v

# *************************************************************** #
#                    Install terminal tools                       #
# *************************************************************** #
echo ''
echo 'Install terminal tools...'
sleep .5

# 1- Create backup RUNCOM files
cp -r ~/.zshrc ~/.zshrc.back
cp -r ~/.vimrc ~/.vimrc.back

# 2- Install software with pacman
sudo pacman -S bat lsd neovim tmux

# 3- Copy ZSH plugins to /usr/share/zsh/plugins directory
sudo mkdir -p /usr/share/zsh/plugins/zsh-sudo
sudo cp -r copy_to_usr_share/zsh/plugins/zsh-sudo/sudo.plugin.zsh /usr/share/zsh/plugins/zsh-sudo/ # Add sudo word when press two times the return key

# 4- Copy neovim configuration
cp -r ./copy_to_user_folder/.vimrc ~/
cp -r ./copy_to_user_folder/.vim ~/

mkdir -p ~/.config/nvim
cp -r ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim

#  - Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#  - Copy nvim plugins
cd ./copy_to_user_folder/.vim/
tar -zxvf plugged.tar.gz
cp -r plugged/* ~/.vim/plugged
rm -R plugged
cd ../..

# 5- Adding configuration to RUNCOM files
echo "
# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
" >> ~/.zshrc

echo "
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
" >> ~/.zshrc