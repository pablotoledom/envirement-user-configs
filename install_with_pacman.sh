# Copy fonts
sudo cp fonts/hack/*.* /usr/share/fonts

# Install terminal tools
sudo pacman -S locate
sudo pacman -S 7z
sudo pacman -S fonts-powerline
sudo pacman -S zsh
sudo pacman -S zsh-syntax-highlighting
sudo pacman -S zsh-autosuggestions

# Install bat a beatiful cat command
sudo pacman -S bat
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