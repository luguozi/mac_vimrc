#!/bin/bash
# git vim sourcecode in github
mkdir ~/vim_tmp;
cd ~/vim_tmp;
git clone https://github.com/vim/vim.git;
cd vim/src;
make;
sudo make install;

