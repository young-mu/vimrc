#!/bin/sh

# ---------- install VIM plugins ----------

mkdir /tmp/vim_plugins
tar xzvf vim_plugins.tar.gz -C /tmp/vim_plugins

# A
cp /tmp/vim_plugins/a.vim ~/.vim/plugin/
# miniBufExplorer
cp /tmp/vim_plugins/minibufexpl.vim ~/.vim/plugin/
# snipMate
unzip /tmp/vim_plugins/snipMate.zip -d ~/.vim/
# tagList
unzip /tmp/vim_plugins/taglist_45.zip -d ~/.vim/
# winManager
unzip /tmp/winmanager.zip -d ~/.vim/

rm -rf /tmp/vim_plugins

# ---------- replace vimrc ----------
cp vimrc ~/.vimrc
