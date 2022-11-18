# Copy fonts
sudo cp fonts/hack/*.* /usr/share/fonts

# Install terminal tools
sudo apt install locate
sudo apt install 7z
sudo apt install fonts-powerline
sudo apt install zsh
sudo apt install zsh-syntax-highlighting
sudo apt install zsh-autosuggestions

# Install bat a beatiful cat command
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Change shell to user pablo
sudo usermod --shell /usr/bin/zsh pablo


#move files to host directories
mv move_to_user_folder/.vimrc ~/
mv move_to_user_folder/.zshrc ~/
mv move_to_usr_share/zsh-sudo /usr/share/
mv zsh/themes/powerlevel10k ~/

# Install PowerLevel10K
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc