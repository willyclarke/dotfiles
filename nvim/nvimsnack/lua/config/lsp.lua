-- The files loaded by require need to be in the path.
-- Hence need to use the full config path even though 
-- the files are in the same directory.

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

-- Zig language server
require("config.lspzls")

-- Lua language server
require("config.lsplua")

-- clangd language server
require("config.lspclangd")

vim.diagnostic.config({
  virtual_text = true,   -- inline text on the right
  signs = true,          -- gutter symbols
  underline = true,      -- underline problem text
  update_in_insert = false,
})

-- Set up the Window bar to display where in the code ...
-- with nvim-navic
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer (LSP)" })
