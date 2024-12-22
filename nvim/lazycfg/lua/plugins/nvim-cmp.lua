return {
    -- Core nvim-cmp plugin
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
            "hrsh7th/cmp-buffer",       -- Buffer completion source
            "hrsh7th/cmp-path",         -- Path completion source
            "saadparwaiz1/cmp_luasnip", -- Snippet completion source
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "rafamadriz/friendly-snippets", -- Optional: Prebuilt snippets
            "SmiteshP/nvim-navic",
            "neovim/nvim-lspconfig",
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
                    ["<C-n>"] = cmp.mapping.select_next_item(), -- Navigate down
                    ["<C-p>"] = cmp.mapping.select_prev_item(), -- Navigate up
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                    ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
                    ["<C-e>"] = cmp.mapping.close(), -- Close completion
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP source
                    { name = "luasnip" }, -- Snippets source
                }, {
                    { name = "buffer" }, -- Buffer source
                    { name = "path" }, -- Path source
                }),
            })

            -- Use nvim-cmp with LSP
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")["clangd"].setup({
                capabilities = capabilities,
            })
        end,
    },
}
