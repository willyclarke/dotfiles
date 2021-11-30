local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- git related plugins
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


