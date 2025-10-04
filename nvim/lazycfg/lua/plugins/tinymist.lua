vim.lsp.config["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  settings = {
    lint = {
      enabled = true,
    },
    -- ...
  }
}
return {}
