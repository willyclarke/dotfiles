-- plugins/lspconfig.lua:

local function start_clangd()
    -- Run 'which clangd' and trim any trailing whitespace
    local clangd_path = vim.fn.system("which clangd"):gsub("%s+$", "")

    -- Check if clangd was found
    if clangd_path == "" then
        vim.notify("clangd not found in PATH ", vim.log.levels.ERROR)
        return
    end

    -- Start LSP with clangd
    vim.lsp.start({
        name = 'clangd',
        cmd = {clangd_path}, -- Use the dynamically determined path
        root_dir = vim.fs.dirname(vim.fs.find({'compile_commands.json'}, { upward = true })[1]),
    })
end

vim.api.nvim_create_autocmd('FileType', {
    -- This handler will fire when the buffer's 'filetype' is "python"
    pattern = 'cpp',
    callback = function(args)
        start_clangd()
    end,
})

-- On the arm architecture Mason does not provide an Arm installer for clangd.
-- So try to use the system installed one instead.
-- Call the function to start clangd
-- start_clangd()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.supports_method and client.supports_method("textDocument/completion") then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
            -- vim.notify("v:lua.vim.lsp.omnifunc", vim.log.levels.DEBUG)
        end
        if client and client.supports_method and client.supports_method("textDocument/definition") then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
            -- vim.notify("v:lua.vim.lsp.tagfunc", vim.log.levels.DEBUG)
        end

        if client and client.server_capabilities and client.server_capabilities.hoverProvider then
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })

            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            -- vim.notify("Setting K as LspHover", vim.log.levels.DEBUG)

            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end
    end,
})

local M = {}
return M
-- stylua: ignore end
