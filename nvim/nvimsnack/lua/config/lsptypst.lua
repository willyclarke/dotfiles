vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst", "typ" },
    settings = {
        -- ...
    }
}

vim.lsp.enable({ "tinymist" })
