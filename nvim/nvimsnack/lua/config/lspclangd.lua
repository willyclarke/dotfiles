-- lua/config/lspclangd.lua

vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
--    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
}

vim.lsp.enable({ "clangd" })


require("config.clangtidy")
