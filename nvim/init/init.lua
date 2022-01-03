-- This neovim lua configuration is inspired/copied a lot from ChrisAtMachine.
-- Kudos to him for teaching all this stuff.
-- Take a look at his tutorials in Youtube and on
-- https://github.com/LunarVim/Neovim-from-scratch.git
--
-- Some code snippets have also been pasted from:
-- https://yashguptaz.hashnode.dev/configuring-neovim-05-with-lua-the-basics
-- which is a tutorial on how to set up neovim with Lua
--
require('plugins')

require('options')
require('keymaps')
require('settings')

-- Configure the various plugins
require('ww-nvim-autopairs-config')
require('ww-telescope-config')
require('ww-treesitter-config')
require('ww-nvimcmp-config')
require('user.lsp') -- Copied from ChrisAtMachine
require('ww-gitsigns-config')
require('ww-nvim-gps-config') -- Function/Method display
require('ww-lualine-config')
require('ww-nvim-tree')
require('ww-toggleterm-config')
require('ww-which-key-config')
require('ww-bufferline-config')
require('ww-project-config')

-- Reuse some of my older files - create a Lua config for this ?
vim.cmd([[source ~/.config/nvim/vim/abbreviations.vim]])
vim.cmd([[source ~/.config/nvim/vim/colorscheme.vim]])
vim.cmd([[source ~/.config/nvim/vim/ww-word-highlight.vim]])

print('Sourced the init.lua file ... ' .. GenerateDateTime())
