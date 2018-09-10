VIM_PATH=~/.vim
PLUGINS_PATH=$VIM_PATH/pack/plugins/start
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
mkdir -p $PLUGINS_PATH
touch $VIMRC_PATH


# Install dracula-vim
mkdir $PLUGINS_PATH/dracula-vim
cd ./plugins/dracula-vim && git archive master | tar -x -C $PLUGINS_PATH/dracula-vim
cd ../../


# Install vim-airline
mkdir $PLUGINS_PATH/vim-airline
cd ./plugins/vim-airline && git archive master | tar -x -C $PLUGINS_PATH/vim-airline
cd ../../


# Install vim-airline-themes
mkdir $PLUGINS_PATH/vim-airline-themes
cd ./plugins/vim-airline-themes && git archive master | tar -x -C $PLUGINS_PATH/vim-airline-themes
cd ../../


# Install vim-fugitive
mkdir $PLUGINS_PATH/vim-fugitive
cd ./plugins/vim-fugitive && git archive master | tar -x -C $PLUGINS_PATH/vim-fugitive
cd ../../


# Install ctrlp
mkdir $PLUGINS_PATH/ctrlp.vim
cd ./plugins/ctrlp.vim && git archive master | tar -x -C $PLUGINS_PATH/ctrlp.vim
cd ../../


# Install vim-polyglot
mkdir $PLUGINS_PATH/vim-polyglot
cd ./plugins/vim-polyglot && git archive master | tar -x -C $PLUGINS_PATH/vim-polyglot
cd ../../

# Install vim-easyclip
mkdir $PLUGINS_PATH/vim-easyclip
mkdir $PLUGINS_PATH/vim-repeat
cd ./plugins/vim-easyclip && git archive master | tar -x -C $PLUGINS_PATH/vim-easyclip
cd ../vim-repeat && git archive master | tar -x -C $PLUGINS_PATH/vim-repeat
cd ../../

# Install vim-prettier
mkdir $PLUGINS_PATH/vim-prettier
cd ./plugins/vim-prettier && git archive master | tar -x -C $PLUGINS_PATH/vim-prettier
cd ../../

# Install nerdcommenter
mkdir $PLUGINS_PATH/nerdcommenter
cd ./plugins/nerdcommenter && git archive master | tar -x -C $PLUGINS_PATH/nerdcommenter
cd ../../

# Install matchit.vim
mkdir $PLUGINS_PATH/matchit
cd ./plugins/matchit && git archive master | tar -x -C $PLUGINS_PATH/matchit
cd ../../


# Use custom vimrc
echo -n '-> Using custom vimrc as ~/.vimrc ... '

cat vimrc.custom > $VIMRC_PATH

echo '-> Done.'


# Generate docs
echo -n '-> Generating docs for plugins ... '

vim \
  -c "helptags $PLUGINS_PATH/vim-airline/doc" \
  -c "helptags $PLUGINS_PATH/vim-fugitive/doc" \
  -c "helptags $PLUGINS_PATH/ctrlp.vim/doc" \
  -c "helptags $PLUGINS_PATH/vim-polyglot/doc" \
  -c "helptags $PLUGINS_PATH/vim-easyclip/doc" \
  -c "helptags $PLUGINS_PATH/vim-prettier/doc" \
  -c "helptags $PLUGINS_PATH/nerdcommenter/doc" \
  -c "helptags $PLUGINS_PATH/matchit/doc" \
  -c 'q'

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
