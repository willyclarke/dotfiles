local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- -- -- --

print(install_path)

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"                -- Have packer manage itself
  use "nvim-lua/popup.nvim"                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                 -- Useful lua functions used ny lots of plugins

  -- Language server and autocompletion plugins
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }

  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Alternative git decorator -  DONT USE BOTH
  -- use({ 'tanvirtin/vgit.nvim', event = 'BufWinEnter', requires = { 'nvim-lua/plenary.nvim' } })
  -- use({ 'tanvirtin/vgit.nvim', requires = { 'nvim-lua/plenary.nvim' } })
  -- Alternative git decorator -  DONT USE BOTH
  -- Super fast git decorations implemented purely in lua/teal.
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' } -- tag = 'release' -- To use the latest release

  -- Simple status line component that shows context of the current cursor position in file
  use { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" }

  use {'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Neovim plugin to comment in and out text.
  use { 'b3nj5m1n/kommentary' }

  use { 'folke/which-key.nvim' }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

