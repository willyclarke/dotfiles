#!/bin/bash

#== Check what platform
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        platform='linux'
elif [[ "$OSTYPE" == "darwin"* ]]; then
        platform='osx'
fi

echo $platform

mkdir ~/bin
pushd ~/bin || return

if [[ "$platform" == "linux" ]]; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
elif [[ "$platform" == "osx" ]]; then
  wget --backups=2 --continue https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
  tar -xzf nvim-macos.tar.gz
fi

#The config files in this directory has been split up into more logical parts.
#There is a need for one more softlink for to set up the runtime path.

#== Get vundle
#The init.vim relies on vundle. So prior to starting nvim you should do the following:

mkdir -p ~/.config/nvim/pack/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/pack/bundle/Vundle.vim

#== Get the dotfiles
mkdir -p ~/Development
git clone https://github.com/willyclarke/dotfiles.git ~/Development/dotfiles

ln -s ~/Development/dotfiles/nvim/init/init.vim ~/.config/nvim
ln -s ~/Development/dotfiles/nvim/init ~/.nvim_runtime

#== Make a link to shell script for starting neovim.
  ln -s ~/Development/dotfiles/nvim/init/nv ~/bin/nv

#== Update plugins
echo #####*---> start nvim and do a :PluginUpdate
~/bin/nv +PluginUpdate

#== Additional

#* Run the :checkhealth command to see what is missing on your platform. Typically there will
#  be some complaints about pip3/python not installed.

#* On Ubuntu the clangd daemon will act as a Language Server Protocol server. It can be installed
#  with 'sudo apt install clangd'

popd || return
