yay -Sy neovim picom-git nitrogen youtube-dl mpv npm peerflix fzf tty-clock btop cbonsai acpi vlc foremost sublime-text-4 projectm-pulseaudio cli-visualizer

sudo pacman -S ncurses fftw cmake

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# for nvim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \\n       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
