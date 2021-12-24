-- Code snippets have been pasted from:
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
-- require('ww-nvimlsp-config')
require('user.lsp') -- Copied from ChrisAtMachine
require('ww-gitsigns-config')
require('ww-nvim-gps-config')
require('ww-lualine-config')
require('ww-nvim-tree')
require('ww-toggleterm-config')
require('ww-which-key-config')
-- require('ww-statusline') -- My take on a status line

-- Reuse some of my older files - create a Lua config for this ?
vim.cmd([[source ~/.config/nvim/vim/abbreviations.vim]])
vim.cmd([[source ~/.config/nvim/vim/colorscheme.vim]])
vim.cmd([[source ~/.config/nvim/vim/ww-word-highlight.vim]])
