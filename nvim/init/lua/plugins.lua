local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print('-- bootstrapped packer. Restart nvim to finalize')
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- git related plugins
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use { 'neovim/nvim-lspconfig' , opt = true }

  --use { 'hrsh7th/nvim-cmp'  } -- Autocompletion plugin

  --use { 'hrsh7th/cmp-nvim-lsp' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


