local M = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = {},
    config = function()
        require("gitsigns").setup({
        })
    end,
}

return M

