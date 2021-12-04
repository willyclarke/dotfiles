local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

print(install_path)

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Language server and autocompletion plugins
use { 'neovim/nvim-lspconfig' }
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-path' }
use { 'hrsh7th/cmp-cmdline' }
use { 'hrsh7th/nvim-cmp' }

use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

-- Super fast git decorations implemented purely in lua/teal.
use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim', tag = 'release' }, -- tag = 'release' -- To use the latest release
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

