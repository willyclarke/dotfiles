-- Code snippets have been pasted from:
-- https://yashguptaz.hashnode.dev/configuring-neovim-05-with-lua-the-basics
-- which is a tutorial on how to set up neovim with Lua
--
require('plugins') 

require('options')
require('keymaps')

-- Configure the various plugins
require('ww-neogit-config')
require('ww-telescope-config')
require('ww-treesitter-config')
require('ww-statusline')
require('ww-nvimcmp-config')
require('ww-nvimlsp-config')
require('ww-gitsigns-config') -- require('ww-vgit-config') -- Alternative to gitsigns, dont use both.
require('ww-kommentary-config')

-- Reuse some of my older files - create a Lua config for this ?
vim.cmd([[source ~/.config/nvim/abbreviations.vim]])
vim.cmd([[source ~/.config/nvim/colorscheme.vim]])
