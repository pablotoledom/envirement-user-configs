#!/bin/bash
# *************************************************************** #
#                           WELCOME                               #
#                                                                 #
#  Tested on:                                                     #
#   - MacOs 10.13.6                                                   #
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

# cp ./fonts/hack/*.* ~/Library/Fonts
# cp ./fonts/meslogs/*.* ~/Library/Fonts
# cp ./fonts/powerline/*.* ~/Library/Fonts
# sleep .5

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

# 2- Install software with Brew
# echo ''
# echo 'Instaling HomeBrew...'
# sleep .5
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew install 7zip
# brew install findutils
# brew install zsh
# brew install lsd
# brew install bat
# brew install tmux

mkdir -p ~/tmp
alias updatedb="gupdatedb --localpaths='/Users/${user}' --output='/Users/${user}/tmp/locatedb'"
alias locate="glocate"
export LOCATE_PATH="~/tmp/locatedb"

# 3- Copy ZSH plugins to /usr/share/zsh/plugins directory
echo ''
echo 'Copying ZSH plugins'
echo ''
sleep .5

# 3- Copy ZSH plugins to /usr/share/zsh/plugins directory
# sudo mkdir -p /usr/share/zsh/plugins/zsh-sudo
# sudo cp -r copy_to_usr_share/zsh/plugins/zsh-sudo/sudo.plugin.zsh /usr/share/zsh/plugins/zsh-sudo/ # Add sudo word when press two times the return key
# sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
# sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

# Copy to /usr/share directory
sudo -S mkdir -p /usr/share/zsh/plugins
sudo -S cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo -S cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo -S cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

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
sudo cp -rf ./plugged/* ~/.vim/plugged
rm -R plugged
cd ../..

# Install PowerLevel10k theme
echo ''
echo 'Instaling powerlevel10k zsh theme'
echo ''
sleep .5

cd ./copy_to_user_folder/zsh/themes/
curl -LO https://github.com/romkatv/powerlevel10k/archive/refs/tags/v1.19.0.tar.gz

tar -zxvf v1.19.0.tar.gz
cd ../../..
mkdir -p ~/zsh/themes
cp -r ./copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0 ~/zsh/themes/powerlevel10k
rm -R ./copy_to_user_folder/zsh/themes/powerlevel10k-1.19.0
rm ./copy_to_user_folder/zsh/themes/v1.19.0.tar.gz

cp ./copy_to_user_folder/.zshrc ~/.zshrc

# Change shell to user pablo
# sudo usermod -S --shell /usr/bin/zsh $pablo