VIM_PATH=~/.vim
BUNDLE_PATH=$VIM_PATH/bundle
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
mkdir $VIM_PATH
touch $VIMRC_PATH


# Install pathogen
mkdir $VIM_PATH/autoload $BUNDLE_PATH
cp ./vim-pathogen/autoload/pathogen.vim $VIM_PATH/autoload/


# Install dracula-vim
mkdir $BUNDLE_PATH/dracula-vim
cp -r \
  ./dracula-vim/autoload \
  ./dracula-vim/colors \
  $BUNDLE_PATH/dracula-vim/


# Install vim-airline
mkdir $BUNDLE_PATH/vim-airline
cp -r \
  ./vim-airline/autoload \
  ./vim-airline/doc \
  ./vim-airline/plugin \
  ./vim-airline/t \
  $BUNDLE_PATH/vim-airline/


# Install vim-fugitive
mkdir $BUNDLE_PATH/vim-fugitive
cp -r \
  ./vim-fugitive/doc \
  ./vim-fugitive/plugin \
  $BUNDLE_PATH/vim-fugitive/


# Install ctrlp
mkdir $BUNDLE_PATH/ctrlp.vim
cp -r \
  ./ctrlp.vim/plugin \
  ./ctrlp.vim/autoload \
  ./ctrlp.vim/doc \
  $BUNDLE_PATH/ctrlp.vim/


# Create .vimrc file
# Pathogen
echo -n '-> Adding pathogen to ~/.vimrc ... '

echo 'execute pathogen#infect()' > $VIMRC_PATH
echo '' >> $VIMRC_PATH

echo 'Done.'


# Add basic vimrc
echo -n '-> Adding basic vimrc to ~/.vimrc ... '

cat ./vimrc/vimrcs/basic.vim >> $VIMRC_PATH
echo '' >> $VIMRC_PATH

echo 'Done.'


# Add custom vimrc
echo -n '-> Adding custom vimrc to ~/.vimrc ... '

cat vimrc.custom >> $VIMRC_PATH

echo 'Done.'


# Generate docs
echo -n '-> Generating docs for plugins ... '

vim \
  -c "helptags $BUNDLE_PATH/vim-airline/doc" \
  -c "helptags $BUNDLE_PATH/vim-fugitive/doc" \
  -c "helptags $BUNDLE_PATH/ctrlp.vim/doc" \
  -c 'q'

echo 'Done.'


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
