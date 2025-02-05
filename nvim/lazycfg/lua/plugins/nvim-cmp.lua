local M = {
    -- Core nvim-cmp plugin
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",         -- LSP completion source
            "hrsh7th/cmp-buffer",           -- Buffer completion source
            "hrsh7th/cmp-path",             -- Path completion source
            "saadparwaiz1/cmp_luasnip",     -- Snippet completion source
            "L3MON4D3/LuaSnip",             -- Snippet engine
            "rafamadriz/friendly-snippets", -- Optional: Prebuilt snippets
            -- "SmiteshP/nvim-navic",
            -- "neovim/nvim-lspconfig",
        },
        config = function()
            -- Set up nvim-cmp
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load friendly-snippets (optional)
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For luasnip users
                    end,
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item(),         -- Navigate down
                    ["<C-p>"] = cmp.mapping.select_prev_item(),         -- Navigate up
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                    ["<C-Space>"] = cmp.mapping.complete(),             -- Trigger completion
                    ["<C-e>"] = cmp.mapping.close(),                    -- Close completion
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP source
                    { name = "luasnip" },  -- Snippets source
                }, {
                    { name = "buffer" },   -- Buffer source
                    { name = "path" },     -- Path source
                }),
            })

            -- Use nvim-cmp with LSP
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")["clangd"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["zls"].setup({
                capabilities = capabilities,
            })

            -- Set up more keymappings
        end,
    },
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- if client and client.supports_method and client.supports_method("textDocument/completion") then
        -- --     vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        --     vim.notify("v:lua.vim.lsp.omnifunc", vim.log.levels.DEBUG)
        -- end
        -- if client and client.supports_method and client.supports_method("textDocument/definition") then
        --     --     vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        --     vim.notify("v:lua.vim.lsp.tagfunc", vim.log.levels.DEBUG)
        -- end

        if client and client.server_capabilities and client.server_capabilities.hoverProvider then
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            nmap('<leader>la', vim.lsp.buf.code_action, '[C]ode [A]ction')
            nmap('<leader>lf', vim.lsp.buf.format, 'LSP Format')
            nmap('<leader>lr', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>lS', vim.lsp.buf.signature_help, '[S]ignature [D]ocumentation') -- use capital S since ls is taken below.

            -- show diagnostic in quickfix
            vim.keymap.set("n", "<leader>lq", function()
                -- Get diagnostics for the current buffer
                local diagnostics = vim.diagnostic.get(0)

                -- Convert diagnostics to quickfix format
                local quickfix_list = {}
                for _, diag in ipairs(diagnostics) do
                    table.insert(quickfix_list, {
                        bufnr = diag.bufnr,
                        lnum = diag.lnum + 1, -- Adjust line numbers to 1-based indexing
                        col = diag.col + 1,   -- Adjust column numbers to 1-based indexing
                        text = diag.message,
                        type = diag.severity == vim.diagnostic.severity.ERROR and "E"
                            or diag.severity == vim.diagnostic.severity.WARN and "W"
                            or "I", -- Map severity to quickfix types
                    })
                end

                -- Set the quickfix list and open it
                vim.fn.setqflist(quickfix_list, "r") -- Replace the existing quickfix list
                vim.cmd("copen")
            end, { noremap = true, silent = true, desc = "Open quickfix list with diagnostics" })

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            -- vim.notify("Setting K as LspHover", vim.log.levels.DEBUG)

            -- Used for moving line up instead
            -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end
    end,
})

return M
