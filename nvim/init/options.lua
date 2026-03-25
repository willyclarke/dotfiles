-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.verbosefile   = vim.fn.stdpath("state") .. "/verbose.log"
vim.opt.verbose       = 1    -- Maximum verbosity level

-- vim.o.hlsearch        = true -- Set highlight on search
vim.opt.incsearch     = true -- Use incremental search

-- vim.wo.number         = true -- Make line numbers default
-- vim.wo.relativenumber = true -- Make relative numbers default

-- vim.o.mouse           = 'a'  -- Enable mouse mode

-- vim.o.breakindent     = true -- Enable break indent
-- vim.o.smartindent     = true

-- vim.o.autochdir       = true

-- Save undo history
-- vim.o.undofile        = true
-- vim.opt.undodir       = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.swapfile      = false
-- vim.opt.backup        = false

-- Handel tabbing
-- vim.opt.tabstop       = 4
-- vim.opt.softtabstop   = 4
-- vim.opt.shiftwidth    = 4
-- vim.opt.expandtab     = true

-- vim.opt.wrap          = false -- No wrapping, please
-- vim.o.ignorecase      = true  -- Case insensitive searching UNLESS /C or capital in search
-- vim.o.smartcase       = true

-- vim.o.updatetime      = 50      -- Decrease update time

-- vim.wo.signcolumn     = 'yes:2' -- Allocate space for signs

-- vim.opt.scrolloff     = 8       -- Avoid scrolling to the end of the screen

-- Set colorscheme
vim.o.guicursor       = ""
-- vim.o.termguicolors   = true
-- vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
-- vim.o.completeopt     = 'menuone,noselect'

-- stylua: ignore start
-- Visual
vim.o.winborder       = "double"
vim.o.conceallevel    = 0 	    -- Make `` Visible in Markdown
vim.o.cmdheight       = 1	      -- Better Error Messages
vim.o.showtabline     = 2 	    -- Always Show Tabline
vim.o.pumheight       = 10      -- Pop up Menu Height
vim.wo.number         = true    -- Display Line Number
vim.wo.relativenumber = true    -- Make relative line numbers default
vim.wo.numberwidth    = 5
vim.o.termguicolors   = true    -- Set Terminal Colors
vim.o.title           = true    -- Display File Info on Title
vim.o.showmode        = true    -- Do Show MODES
vim.wo.signcolumn     = 'yes'   -- Sign Column
vim.opt.listchars     = { tab = '→~', eol='¬', trail='⋅', extends='❯',precedes='❮' }-- toggle invisible characters
vim.opt.list          = true
vim.opt.showbreak     = '↪'


-- Behavior
vim.o.hlsearch        = false -- Set highlight on search
vim.o.ignorecase      = true 	-- Case insensitive searching
vim.o.smartcase       = true	-- If Upper Case Char > case sensitive search
vim.o.smarttab        = true	-- Smart Tabs
vim.o.smartindent     = true 	-- Smart Indenting
vim.o.splitbelow      = true 	-- Force Split Below
vim.o.splitright      = true 	-- Force Split Right
vim.o.expandtab       = true
vim.o.tabstop         = 2	    -- Tabstop
vim.o.softtabstop     = 2
vim.o.shiftwidth      = 2
vim.o.scrolloff       = 12  	-- Vertical Scroll Offset
vim.o.sidescrolloff   = 8  	  -- Horizontal Scroll Offset
vim.o.mouse           = 'a'	  -- Enable mouse mode
vim.o.wrap            = false
vim.o.autowriteall    = true  -- write all files when hiding buffers. NOTE: causes uncoditional writes

-- Vim specific
vim.o.hidden          = true	    -- Do not save when switching buffers
vim.o.breakindent     = true	    -- Enable break indent
vim.o.backup          = false	    -- Disable Backup
vim.o.swapfile        = false	    -- Don't create Swap Files
vim.o.spell           = false
vim.o.undofile        = true 	    -- Save undo history
vim.o.updatetime      = 50	      -- Decrease update time
vim.o.timeoutlen      = 500	      -- Time for mapped sequence to complete (in ms)
vim.o.inccommand      = 'nosplit' -- Incremental live completion
vim.o.fileencoding    = "utf-8"	  -- Set File Encoding
vim.o.spelllang       = "en"
vim.o.completeopt     = "menuone,noselect"  -- Autocompletion
vim.opt.shortmess:append { W = true, a = true }
-- vim.o.undodir         = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undodir       = os.getenv("HOME") .. "/.vim/undodir"
vim.o.ruler           = true
vim.o.exrc            = true
vim.o.secure          = true
vim.o.wildmenu        = true      -- Display all matching files when we tab complete
vim.o.path            = '**'
vim.o.autochdir       = true
-- stylua: ignore end
--

-- Enable relative number in normal mode and actual line number in insert mode.
vim.api.nvim_exec(
  [[
  augroup toggle_relative_number
  autocmd!
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
  augroup end
  ]],
    false
)

-- Highlight for relative line numbers
vim.api.nvim_set_hl(0, "LineNr", { fg = "MAGENTA", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "YELLOW", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "ORANGE", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "GREEN", bg = "NONE", bold = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set({ 'n', 'v' }, ';', ':', { silent = false })
-- vim.keymap.set({ 'n', 'v' }, ':', ';', { silent = false })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
