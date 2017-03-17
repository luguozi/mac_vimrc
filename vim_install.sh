#!/bin/bash
# @auther guozi lu(88@luguozi.com | lmmys@hotmail.com)

# mkdir ~/.vim,which user for vim plugin install finder
mkdir ~/.vim;

# tmd dir
mkdir ~/vim_tmp;
cd ~/vim_tmp;
git clone https://github.com/luguozi/mac_vimrc.git;

# backup old origin vimrc file
cp ~/.vimrc ~/.vimrc_backup;
mv ~/vim_tmp/mac_vimrc/.vimrc ~/.vimrc;

#vim plugin controller - github.com/VundleVim/Vundle.vim
cd ~/vim_tmp;
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;

#colors schemes
cd ~/vim_tmp;
git clone https://github.com/flazz/vim-colorschemes.git;
mv ~/vim_tmp/vim-colorschemes/colors ~/.vim;

# fonts for airline
cd ~/vim_tmp;
git clone https://github.com/powerline/fonts.git;
cd fonts;
sh ./install.sh;

if type brew > /dev/null;then
  echo "Homebrew Exists";
else
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi;

# ack supported
brew install ack ag;

#YouCompleteMe supported
if [[ -d ~/.vim/bundle/YouCompleteMe ]];then
  echo "YouCompleteMe Exists";
else
  git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe;
  cd ~/.vim/bundle/YouCompleteMe;
  # for nodejs
  ./install.py --tern-completer;
fi;

# update vim,replace the origin
# brew install vim --override-system-vi --with-lua --HEAD;

# install vim plugins
vim +PluginInstall! +qall;

# rm tmp dir
# rm -rf ~/vim_tmp;
echo "You can remove the temporary directory ~/vim_tmp";


