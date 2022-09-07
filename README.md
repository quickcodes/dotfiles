# dotfiles

## commands used
```
config add {file_name}
config commit -m "message"
config push -u main 
config status
config log
```
## installation in new machine
```
git clone --separate-git-dir=$HOME/dotfiles https://github.com/quickcodes/dotfiles.git ~
```
or 
```
git clone --separate-git-dir=$HOME/dotfiles https://github.com/quickcodes/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
## A documentation for all setup [Click Here](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html)

