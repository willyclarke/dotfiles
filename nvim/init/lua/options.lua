-- stylua: ignore start
-- Visual
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
vim.o.updatetime      = 250	      -- Decrease update time
vim.o.timeoutlen      = 500	      -- Time for mapped sequence to complete (in ms)
vim.o.inccommand      = 'nosplit' -- Incremental live completion
vim.o.fileencoding    = "utf-8"	  -- Set File Encoding
vim.o.spelllang       = "en"
vim.o.completeopt     = "menuone,noselect"  -- Autocompletion
vim.opt.shortmess:append { W = true, a = true }
vim.o.undodir         = vim.fn.stdpath("cache") .. "/undo"
vim.o.ruler           = true
vim.o.exrc            = true
vim.o.secure          = true
vim.o.wildmenu        = true      -- Display all matching files when we tab complete
vim.o.path            = '**'
-- stylua: ignore end

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

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

-- Disable some default plugins
--vim.g.loaded_gzip = false
--vim.g.loaded_matchit = false
--vim.g.loaded_netrwPlugin = false
--vim.g.loaded_tarPlugin = false
--vim.g.loaded_zipPlugin = false
--vim.g.loaded_man = false
--vim.g.loaded_2html_plugin = false
--vim.g.loaded_remote_plugins = false
--vim.g.did_load_filetypes = false



