return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    highlights = true,

    options = { theme = 'auto' },

    config = function()
        -- Check if "nvim-navic" can be required
        local ok, navic = pcall(require, "nvim-navic")
        if not ok then
            print('FileType-navic-error: Failed to load nvim-navic')
            return
        end
        require("lualine").setup({
            sections = {
                lualine_c = {
                    {
                        function()
                            return navic.get_location()
                        end,
                        cond = function()
                            return navic.is_available()
                        end,
                        color = function()
                            return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
                        end,
                    },
                }
            }
        })
    end
}
