-- lua/lsp/clangd.lua

-- If you use nvim-cmp, add capabilities (see section 3)
-- local capabilities = nil
-- pcall(function()
--   capabilities = require("cmp_nvim_lsp").default_capabilities()
-- end)

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- If you use nvim-cmp, merge its capabilities in (don’t replace!)
pcall(function()
  capabilities = vim.tbl_deep_extend("force", caps, require("cmp_nvim_lsp").default_capabilities())
end)

vim.lsp.config.clangd = vim.tbl_deep_extend("force", vim.lsp.config.clangd or {}, {
  capabilities = capabilities,
})

vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
  capabilities = capabilities,
}

vim.lsp.enable({ "clangd" })


