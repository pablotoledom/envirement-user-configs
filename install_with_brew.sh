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
echo ''
echo 'Copying Nerd Fonts...'
sleep .5

cp ./fonts/hack/*.* ~/Library/Fonts
cp ./fonts/meslogs/*.* ~/Library/Fonts
cp ./fonts/powerline/*.* ~/Library/Fonts
sleep .5

# *************************************************************** #
#                    Install terminal tools                       #
# *************************************************************** #
echo 'Instaling HomeBrew...'
sleep .5
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Instaling terminal tools'
sleep .5
brew install 7zip
brew install findutils
brew install zsh
brew install lsd
brew install bat

mkdir ~/tmp
alias updatedb="gupdatedb --localpaths='/Users/${user}' --output='/Users/${user}/tmp/locatedb'"
alias locate="glocate"
export LOCATE_PATH="~/tmp/locatedb"

# Change shell to user pablo
# sudo usermod --shell /usr/bin/zsh $pablo

echo 'Copying terminal fonts'
sleep .5
# Copy to /usr/share directory
sudo mkdir -p /usr/share/zsh/plugins
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-sudo /usr/share/zsh/plugins/ # Add sudo word when press two times the return key
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-autosuggestions /usr/share/zsh/plugins/ # v0.7.0
sudo cp -r ./copy_to_usr_share/zsh/plugins/zsh-syntax-highlighting /usr/share/zsh/plugins/ #v0.7.1

echo 'Copying vim plugins'
sleep .5
# Copy files to user directory
mkdir -p ~/.config/nvim
cp ./copy_to_user_folder/.config/nvim/init.vim ~/.config/nvim/init.vim

echo 'Instaling powerlevel10k zsh theme'
sleep .5
mkdir -p ~/zsh/themes
cp -r ./copy_to_user_folder/zsh/themes/powerlevel10k ~/zsh/themes/

cp ./copy_to_user_folder/.zshrc ~/.zshrc
