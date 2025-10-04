local M = {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { "williamboman/mason.nvim", opts = {} },
            { "williamboman/mason-lspconfig.nvim", opts = {
                ensure_installed = {},
                automatic_installation = true,
            }},

            -- Useful status updates for LSP
            { "j-hui/fidget.nvim", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            -- LSP and Mason setup
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {},
            })

            -- Configure individual language servers
            -- local lspconfig = require("lspconfig")

	    local lspconfig = vim.lsp.config('*', {
		    capabilities = {
			    textDocument = {
				    semanticTokens = {
					    multilineTokenSupport = true,
				    }
			    }
		    },
		    root_markers = { '.git' },
	    })

            -- local capabilities = vim.lsp.protocol.make_client_capabilities()

            -- Lua
	    vim.lsp.config('lua_ls', {
		    filetypes = { 'lua' },
		    settings = { 
			    Lua = {
				    diagnostics = {
					    globals = { "vim" },
				    },
			    },
		    },
	    })

            -- Python
            -- lspconfig.pyright.setup({})

        end,
    },
}

return M
