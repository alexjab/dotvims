VIM_PATH=~/.vim
VIMRC_PATH=~/.vimrc

echo 'Installing...'


# Archive current vim configs
if [ -f $VIMRC_PATH ]; then
  mv $VIMRC_PATH ~/.vimrc.`date +%Y%m%d_%s`
fi
if [ -d $VIM_PATH ]; then

  mv $VIM_PATH ~/.vim.`date +%Y%m%d_%s`
fi


# Create basic files and folders
mkdir $VIM_PATH/swap
mkdir $VIM_PATH/undodir
touch $VIMRC_PATH


# Use custom vimrc
echo -n '-> Using vimrc to install plugins ...'

cat vimrc_install.custom > $VIMRC_PATH

echo '-> Done.'


# Install vim-plug
echo -n '-> Installing vim-plug ...'

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo '-> Done.'


# Install plugins
echo -n '-> Installing plugins ...'

vim +PlugInstall +qall

echo '-> Done.'


# Use custom vimrc
echo -n '-> Using custom vimrc as ~/.vimrc ...'

cat vimrc.custom > $VIMRC_PATH

echo '-> Done.'


# All done
echo ''
echo '-> All done.'


# Fonts
echo ''
echo 'Extra:'
echo 'iTerm colors at ./extra/dracula-iterm'
echo 'Fonts at ./extra/powerline-fonts'

echo ''
echo 'Install the_silver_searcher to improve ctrlp search:'
echo '  brew install the_silver_searcher'

echo ''
echo 'Install italics in Vim:'
echo ' - `tic ./extra/xterm-256color-italic.terminfo`'
echo ' - add "export TERM=xterm-256color-italic" to .profile'
