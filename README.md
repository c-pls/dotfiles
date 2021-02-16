.vimrc file

My personal Vim configurations using both Vundle and Plug

1. Install Vim Plug
- Open terminal
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- create .vimrc file: vim ~/.vimrc

Source: https://github.com/junegunn/vim-plug


2. Install Vim Vundle
- Open Terminal
- Set up Vundle:
  +  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  
- Config Vundle
    set nocompatible              " be iMproved, required
    filetype off                  " required
    
    set rtp+=~/.vim/bundle/Vundle.vim
    
    call vundle#begin()
    
    " Put your plugin in here
    
    call vundle#end()            " required
    filetype plugin indent on    " required

- Save (:wq) relaunch vimrc and run :PluginInstall

Source: https://github.com/VundleVim/Vundle.vim
