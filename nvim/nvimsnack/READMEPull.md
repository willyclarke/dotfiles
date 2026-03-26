# Restore locked config when starting neovim

To avoid possible issues it is possible to stay on a locked set of plugins.

Doing that should make systems more stable.

It means using restore on most production machines and only using 
Lazy update or Lazy sync on the development machine.

The commands are:

git pull --rebase
nvim +"Lazy restore" +qa
