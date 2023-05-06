local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- You can use any plugin specification from lazy.nvim
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require("custom.configs.truezen") -- just an example path
    end,
  },

  -- this opts will extend the default opts
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cmake", "html", "css", "bash", "zig" },
    },
  },

  -- if you load some function or module within your opt, wrap it with a function
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = function(...)
              require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    enabled = true,
  },

  {
    "lewis6991/gitsigns.nvim",
    tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 100,
        },
        current_line_blame_formatter_opts = {
          relative_time = true,
        },
        signs = {
          add = { hl = "GitSignsAdd", text = "螺", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = {
            hl = "GitSignsChange",
            text = "",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = "",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = "",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
        },
      })
    end,
    enabled = true,
  },

  {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    lazy = false, -- load a plugin at startup
  },

  {
    "startup-nvim/startup.nvim",
    lazy = false, -- load a plugin at startup
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup()
    end,
  },

  {
    "SmiteshP/nvim-gps",
    -- requires = "nvim-treesitter/nvim-treesitter",
    enabled = true,
    lazy = false,
    config = function()
      print("Setting up nvim-gps")
      require("nvim-gps").setup({
        icons = {
          ["class-name"] = " ", -- Classes and class-like objects
          ["function-name"] = " ", -- Functions
          ["method-name"] = " ", -- Methods (functions inside class-like objects)
          ["container-name"] = "⛶ ", -- Containers (example: lua tables)
          ["tag-name"] = "炙", -- Tags (example: html tags)
        },
      })
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
