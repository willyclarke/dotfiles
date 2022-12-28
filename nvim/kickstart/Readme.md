# Kickstarter based configuration for neovim

The configuration in this folder is based on the kickstarter project. The file
has been ammended slightly to my liking.

TJ DeVries has an excellent youtube video covering this.

link: 

    https://youtu.be/stqUbv-5u2s

## Usage

1. Git clone the repo.
e.g.
    $ git clone https://www.github.com/willyclarke/dotfiles ~/.dotfiles
    $ git checkout develop

2. Create a link so that nvim points to the 'nvim-kickstart' directory under your $HOME/.config.
e.g.
    $ cd
    $ cd .config
    $ ln -s ~/.dotfiles/nvim/nvim-kickstart nvim
    $ cd
    $ nvim
