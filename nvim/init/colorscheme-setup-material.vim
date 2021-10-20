
" {{{ Set up the Material color scheme - is it better than my own?"
"let g:material_style = 'deep ocean'
"let g:material_style = 'oceanic'
"let g:material_style = 'lighter'
"let g:material_style = 'palenight'
"let g:material_style = 'darker'
"let g:material_italic_comments = 1
"let g:material_italic_keywords = 1
"let g:material_italic_functions = 1
"let g:material_italic_variables = 1
"let g:material_contrast = 1
"let g:material_borders = 1

colorscheme material

lua << EOF
vim.g.material_style = "deep ocean"
require('material').setup({

	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders = true, -- Enable borders between verticaly split windows

	popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings = true, -- Enable italic strings
		variables = true -- Enable italic variables
	},

	contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf" -- Darker qf list background
	},

	text_contrast = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},

	disable = {
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	},

	custom_highlights = {} -- Overwrite highlights with your own
})
EOF

" }}}"
