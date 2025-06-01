# Git config file

## HOWTO

1. Create a 'for-this-pc' git config file in the home directory that
   contains the following

[include]
    path = /Users/willyclarke/.config/git/gitconfig
    path = /Users/willyclarke/.config/git/gitconfig.macos

2. Create links in the ~/.config/git directory to the dot-files
   that you want to use, see below.

## Files that may be used:
1. 
This git config assumes that 'exa' has been installed as a pager.
Check out https://dandavison.github.io/delta/introduction.html

gitconfig : simple setup with a single file. 
Link to ~/.gitconfig from ~/.dotfiles/gitconfig/gitconfig

2. 
This git config assumes that 'diff-so-fancy' has been installed as pager.
gitconfig.root - pull in files from the ~/.config/git directory.
Link to ~/.gitconfig from ~/.dotfiles/gitconfig/gitconfig.root

### Commands
mkdir -p ~/.config/git
ln -s ~/.dotfiles/gitconfig/gitconfig ~/.config/git/gitconfig
ln -s ~/.dotfiles/gitconfig/gitconfig.macos ~/.config/git/gitconfig.macos

