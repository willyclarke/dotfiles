-- lua/plugins/treesitter.lua
vim.filetype.add({ extension = { wgsl = "wgsl" } })

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,          -- upstream: main does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- main-branch setup is minimal now
      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Add/override custom parsers ONLY during TSUpdate
      -- (this is the upstream-supported way on main)
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").wgsl = {
            install_info = {
              url = "https://github.com/szebniok/tree-sitter-wgsl",
	      branch = "master",
              files = { "src/parser.c", "src/scanner.c" },
              -- If the repo didn't ship generated C files you'd add:
              -- generate = true,
            },
          }
        end,
      })

      -- Bootstrap parsers you always want (async; wait makes it reliable at first run)
      ts.install({ "c", "lua", "vim", "vimdoc", "query", "wgsl" }, { summary = false }):wait(300000)

      -- Enable Treesitter highlighting per-filetype (Neovim owns highlighting now)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(ev)
          -- Start TS for this buffer; safe even if no parser exists
          pcall(vim.treesitter.start, ev.buf)
        end,
      })

      -- Folding: use Neovim's foldexpr (the old nvim_treesitter#foldexpr() is legacy)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.o.foldlevelstart = 99
        end,
      })
    end,
  },
}

