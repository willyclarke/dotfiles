return
{
    'feline-nvim/feline.nvim',
    enabled = false,
    branch = '0.5-compat',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme

    config = function()
        local ok, navic = pcall(require, "nvim-navic")
        if not ok then
            vim.notify('FileType-navic-cpp-error: Failed to load nvim-navic', vim.log.levels.ERROR)
            return
        end

        vim.notify('Feline loading ok...', vim.log.levels.ERROR)
        local components = {
            active = { {}, {}, {} },
            inactive = { {}, {} },
        }

        table.insert(components.active[1], {
            provider = 'file_info',
            hl = {
                fg = 'white',
                bg = 'oceanblue',
                style = 'bold'
            },
            left_sep = { ' ', 'slant_left_2' },
            right_sep = { 'slant_right_2', ' ' },
            -- Uncomment the next line to disable file icons
            -- icon = ''
        })

        table.insert(components.active[1], {
            provider = 'position',
            -- Pad line and column numbers, use default amount for padding.
            padding = true,
            hl = {
                fg = 'white',
                bg = 'oceanblue',
                style = 'bold'
            },
            left_sep = { ' ', 'slant_left_2' },
            right_sep = { 'slant_right_2', ' ' },
        })


        table.insert(components.active[1], {
            provider = 'vi_mode',
            hl = function()
                return {
                    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                    style = 'bold'
                }
            end,
            right_sep = ' ',
            -- Uncomment the next line to disable icons for this component and use the mode name instead
            icon = ''
        })

        table.insert(components.active[2], {
            provider = 'git_branch',
            hl = {
                fg = 'white',
                bg = 'black',
                style = 'bold'
            },
            right_sep = {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'black'
                }
            }
        })

        table.insert(components.active[2], {
            provider = 'diagnostic_warnings',
            hl = {
                fg = 'orange',
                bg = 'black',
                style = 'bold'
            },
            left_sep = {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'black'
                }
            }
        })

        table.insert(components.active[2], {
            provider = 'diagnostic_errors',
            hl = {
                fg = 'red',
                bg = 'black',
                style = 'bold'
            },
            left_sep = {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'black'
                }
            }
        })

        table.insert(components.active[3], {
            provider = function()
                return navic.get_location()
            end,
            enabled = function() return navic.is_available() end,
            padding = true,
            hl = {
                fg = 'fg',
                bg = 'bg',
                style = 'bold'
            },
            left_sep = { ' ', 'slant_left_2' },
            right_sep = { 'slant_right_2', ' ' },
        })

        require("feline").setup({
            components = components
        })
    end,
}
