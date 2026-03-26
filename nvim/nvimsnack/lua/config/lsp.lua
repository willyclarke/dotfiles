-- lua/config/lsp.lua

-- Base capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- your semantic tokens tweak (keep it)
-- capabilities.textDocument = capabilities.textDocument or {}
-- capabilities.textDocument.semanticTokens = capabilities.textDocument.semanticTokens or {}
-- capabilities.textDocument.semanticTokens.multilineTokenSupport = true

-- Add your semanticTokens tweak
capabilities = vim.tbl_deep_extend("force", capabilities, {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
  },
})

-- Merge blink.cmp LSP capabilities if available
pcall(function()
  local blink = require("blink.cmp")
  if blink and blink.get_lsp_capabilities then
    capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
  end
end)

-- Global defaults for all servers
vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

-- Zig language server
require("config.lspzls")
-- Lua language server
require("config.lsplua")
-- clangd language server
require("config.lspclangd")
-- typst language server
require("config.lsptypst")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer (LSP)" })

--
-- Debug code for lsp timing...
--
require("../debug/lsp")

