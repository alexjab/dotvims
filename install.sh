echo 'Installing...'


# Archive current vim configs
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.`date +%Y%m%d_%s`
fi
if [ -d ~/.vim ]; then
  mv ~/.vim ~/.vim.`date +%Y%m%d_%s`
fi


# Create basic files and folders
mkdir ~/.vim
touch ~/.vimrc


# Install pathogen
mkdir ~/.vim/autoload ~/.vim/bundle
cp ./vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/


# Install dracula-vim
mkdir ~/.vim/bundle/dracula-vim
cp -r \
  ./dracula-vim/autoload \
  ./dracula-vim/colors \
  ~/.vim/bundle/dracula-vim/


# Install vim-airline
mkdir ~/.vim/bundle/vim-airline
cp -r \
  ./vim-airline/autoload \
  ./vim-airline/doc \
  ./vim-airline/plugin \
  ./vim-airline/t \
  ~/.vim/bundle/vim-airline/


# Install vim-fugitive
mkdir ~/.vim/bundle/vim-fugitive
cp -r \
  ./vim-fugitive/doc \
  ./vim-fugitive/plugin \
  ~/.vim/bundle/vim-fugitive/


# Install ctrlp
mkdir ~/.vim/bundle/ctrlp.vim
cp -r \
  ./ctrlp.vim/plugin \
  ./ctrlp.vim/autoload \
  ./ctrlp.vim/doc \
  ~/.vim/bundle/ctrlp.vim/


# Create .vimrc file
echo 'execute pathogen#infect()' > ~/.vimrc
echo '' >> ~/.vimrc

cat ./vimrc/vimrcs/basic.vim >> ~/.vimrc
echo '' >> ~/.vimrc

cat .vimrc.custom >> ~/.vimrc

echo '-> Done.'


# Fonts
echo ''
echo 'Extra:'
echo 'iTerm colors at ./extra/dracula-iterm'
echo 'Fonts at ./extra/powerline-fonts'
