# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="archcraft"
# ZSH_THEME="spaceship"
# ZSH_THEME="alanpeabody"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# additional custom
alias cin='xclip -selection c'
alias cout='xclip -selection clipboard -o'
alias update='sudo pacman -Syyu'
alias del='shred -zufn 3'
alias hdd='cd /run/media/dhruv/1TB'
alias fdel='rm -rf $(ls | fzf -m)'
alias fcp='rsync --progress -auv'
alias getpath="find -type f | fzf | sed 's/^..//g' | tr -d '\n' | cin"
alias his="history | fzf | cut -c 8- | tr -d '\n' | cin"
alias wlp='nitrogen --set-zoom-fill --random $HOME/Pictures/wallpapers'
alias rec='ffmpeg -f x11grab -y -r 30 -s 1920x1080 -i :0.0 -vcodec huffyuv rec.avi'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nvim_prev="fzf --preview='nvim {}'"
# alias sxiv='swallow sxiv'
# alias mpv='swallow mpv'

sync_web(){
	cd $HOME/MyStuff/mysite && zola build && rsync -auP public/* root@dhruvcodes.me:/var/www/mysite
}

sync_file(){
	cd $HOME/MyStuff && rsync -auP files/* root@dhruvcodes.me:/var/www/files
}

fcd(){
  cd "$(find -type d | fzf)"
}

fnvim(){
  nvim "$(find -type f | fzf)"
}

open(){
  xdg-open "$(find -type f | fzf)"
}

plysong(){
  pkill -f "https://live.musopen.org:8085/streamvbr0" || mpv "https://live.musopen.org:8085/streamvbr0"
}

set_gnome_rand_wall(){
  DIR="$HOME/Pictures/wallpaper/"
  BGD="$(ls $DIR/*.png | shuf -n1)"
  cat $BGD > /home/dhruv/.config/wallpaper.png
  gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/dhruv/.config/wallpaper.png"
  echo "Wallpaper set to $BGD"
}

emojie(){
  emoji="$(cat $HOME/.local/share/emojie | fzf | cut -d' ' -f1)"
  echo "$emoji" | tr "\n" " " | xclip -sel c
}

commands_info(){
  # echo "-----------------------------------------------\n"
  echo "Required packages :- "
  echo "\tnitrogen youtube-dl mpv npm peerflix fzf tty-clock btop cbonsai foremosts"
  echo "\n"

  echo "Scripts :-"
  echo "\twlp        - changes wallpaper"
  echo "\tyt         - Youtube from terminal"
  echo "\tnotflix    - stream torrent from terminal"
  echo "\n"

  echo "Alias :-"
  echo "\tcin          - copy"
  echo "\tcout         - paste"
  echo "\tupdate       - update packages using pacman"
  echo "\tdel          - delete any file permanently"
  echo "\thdd          - cd into harddisk"
  echo "\tfdel         - delete multiple files with fzf"
  echo "\tfcp          - copy with progress"
  echo "\tgetpath      - copy path of directory"
  echo "\this          - copy any command from history"
  echo "\twlp          - set random wallpaper from $HOME/Pictures/wallpapers"
  # echo "\trec          - record screen using ffmpeg \n\t\t     res: 1920x1080 \n\t\t     output file name: rec.avi"
  echo "\trec          - record screen using ffmpeg (res: 1920x1080) (output file: rec.avi)"
  echo "\tfcd          - cool way of cd into any directory"
  echo "\topen         - search and open any file"
  echo "\tplysong      - play's background music"
  echo "\tset_gnome_rand_wall - set random wlp for gnome dark theme (only for gnome)"
  echo "\n"

  echo "Being Cool with terminal :- "
  echo "\ttty-clock -c"
  echo "\tbtop --utf-force"
  echo "\n"

  echo "Usesfull Commands :-"
  echo "\tcompress video   \n\t\tffmpeg -i silicon.mkv -vcodec libx265 -crf 28 out.mp4"
  echo "\treduce half video size  \n\t\tfor f in *.mp4; do ffmpeg -i \"$f\" -vf \"scale=trunc(iw/4)*2:trunc(ih/4)*2\" -c:v libx265 -crf 28 \"edit/$f\"; done;"
  echo "\toptimize jpg \n\t\t jpegoptim *.jpg"
  echo "\tgnome wallpapers"
  echo "\t\tlight theme: \n\t\t\tgsettings set org.gnome.desktop.background picture-uri \"file://...\""
  echo "\t\tdark theme: \n\t\t\tgsettings set org.gnome.desktop.background picture-uri-dark \"file://...\""
  echo "\tcheck kernal info \n\t\tuname -srm \n\t\thostnamectl"
  echo "\trecover deleted file \n\t\tsudo foremost -v -q -t jpg -i /dev/sda1 -o $HOME/Desktop/recovery"
  # echo "\n-----------------------------------------------"
}

