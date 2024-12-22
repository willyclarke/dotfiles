local M = {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    lazy = false,
    lazy_update_context = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        vim.notify('Symbols will be reported with navic', vim.log.levels.INFO)

        -- Check if "nvim-navic" can be required
        local ok, navic = pcall(require, "nvim-navic")
        if not ok then
            vim.notify('FileType-navic-error: Failed to load nvim-navic', vim.log.levels.ERROR)
            return
        end

        if client and client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        else
            vim.notify("FileType-navic-cpp-error: documentSymbolProvider not available", vim.log.levels.ERROR)
        end
    end,
})

return M
