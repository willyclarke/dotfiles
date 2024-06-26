local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- -- -- --

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used ny lots of plugins

	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "ahmedkhalf/project.nvim" })

	-- Language server and autocompletion plugins
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- Language Server Protocol
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "tamago324/nlsp-settings.nvim" }) -- language server settings defined in json for

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- GIT - Super fast git decorations implemented purely in lua/teal.
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, tag = "release" }) -- To use the latest release

	-- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	-- Simple status line component that shows context of the current cursor position in file
	use({ "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" })

	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	-- Neovim plugin to comment in and out text.
	-- use { 'b3nj5m1n/kommentary' }

	use({ "akinsho/toggleterm.nvim" })

	use({ "folke/which-key.nvim" })

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").opts)
		end,
	})

	-- Code formatting plugin
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Async make
	use({ "pianocomposer321/yabs.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Better quickfix window
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	-- optional - Fuzzy finder
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
