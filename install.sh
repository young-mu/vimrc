#!/bin/sh

# remove legacy VIM conf. and plugins
if [ -d ~/.vim/ ]; then
    echo "remove all VIM confiurations set before."
    echo "--------------------"
    rm -rf ~/.vim
    rm ~/.vimrc
fi

# install VIM plugins
tar xzf vim_plugins.tar.gz -C /tmp/

# A
echo "1. install A ..."
mkdir -p ~/.vim/plugin
cp /tmp/vim_plugins/a.vim ~/.vim/plugin/
# miniBufExplorer
echo "2. install miniBufExplorer ..."
cp /tmp/vim_plugins/minibufexpl.vim ~/.vim/plugin/
# molokai color scheme
echo "3. install colorscheme molokai ..."
mkdir -p ~/.vim/colors
cp /tmp/vim_plugins/molokai.vim ~/.vim/colors/
# snipMate
echo "4. install snipMate ..."
unzip /tmp/vim_plugins/snipMate.zip -d ~/.vim/ > /dev/null
# tagList
echo "5. install tagList ..."
unzip /tmp/vim_plugins/taglist_45.zip -d ~/.vim/ > /dev/null
# winManager
echo "6. install winManager ..."
unzip /tmp/vim_plugins/winmanager.zip -d ~/.vim/ > /dev/null

rm -rf /tmp/vim_plugins

# update vimrc
echo "7. configure vimrc ..."
cp vimrc ~/.vimrc

echo "--------------------"
echo "set all VIM configurations successfully."
