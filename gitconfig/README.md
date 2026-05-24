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

### Config of the ~/.gitconfig with diff-so-fancy

  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  git config --global interactive.diffFilter "diff-so-fancy --patch"

And the recommended color tweaks (one-time, paste as-is):

  git config --global color.ui true
  git config --global color.diff-highlight.oldNormal    "red bold"
  git config --global color.diff-highlight.oldHighlight "red bold 52"
  git config --global color.diff-highlight.newNormal    "green bold"
  git config --global color.diff-highlight.newHighlight "green bold 22"
  git config --global color.diff.meta       "11"
  git config --global color.diff.frag       "magenta bold"
  git config --global color.diff.func       "146 bold"
  git config --global color.diff.commit     "yellow bold"
  git config --global color.diff.old        "red bold"
  git config --global color.diff.new        "green bold"
  git config --global color.diff.whitespace "red reverse"
