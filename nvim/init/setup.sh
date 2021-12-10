#!/bin/bash
# Get Packer for managing plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

pushd ~/.config
rm -rf ./nvim
ln -s ~/Development/dotfilesnvim/nvim/init nvim
popd

mkdir ~/Development
git clone https://github.com/willyclarke/dotfiles.git ~/Development/dotfilesnvim
pushd ~/Development/dotfilesnvim
git checkout feature/luaconfig
popd

# TODO: (Willy Clarke) Add check if nvim is available
### NOTE: Run twice to avoid errors at first startup ????
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
