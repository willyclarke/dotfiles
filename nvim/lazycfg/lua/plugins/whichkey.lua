-- plugins/whichkey.lua:
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
        --{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find Buffers", mode = "n" },
        --{ "<leader>G", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
        --{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in current buffer", mode = "n" },
        --{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Oil Filemanager", mode = "n" },

        --{ "<leader>f", group = "file" }, -- group
        --{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },

        --{ "<leader>g", group = "git" }, -- group
        --{ "<leader>gn", "<cmd>Neogit<cr>", desc = "[N]eogit", mode = "n" },
        --{ "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk", mode = "n" },
        --{ "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev hunk", mode = "n" },
        --{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk", mode = "n" },
        --{ "<leader>gr","<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk", mode = "n" },
--       { "<leader>gs",
--           function()
--               -- Visual mode keymap for Gitsigns stage_hunk
--               require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") }
--           end,
--           desc = "Visual mode stage hunk ",
--           mode = "v",
--       },
--        { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer", mode = "n" },
--        { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk", mode = "n" },
--        { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer", mode = "n" },
--        { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk", mode = "n" },
--        { "<leader>gb",
--            function()
--                require("gitsigns").blame_line{full=false}
--             end,
--             desc = "Blame current line",
--             mode = "n",
--        },
--       { "<leader>gB",
--           function()
--               require("gitsigns").blame_line{full=true}
--            end,
--            desc = "Blame line full",
--            mode = "n",
--       },
--       { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame toggle current line", mode = "n" },
--       { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diffthis", mode = "n" },
--       { "<leader>gD",
--           function()
--               require("gitsigns").diffthis('~')
--            end,
--            desc = "Diff this",
--            mode = "n",
--       },
--       { "<leader>gx", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle deleted", mode = "n" },

        { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
    },
}
