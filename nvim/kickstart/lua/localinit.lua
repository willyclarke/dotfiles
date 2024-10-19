
--
-- Tips
-- Writing print(vim.inspect(x)) every time you want to inspect
-- the contents of an object can get pretty tedious. It might be
-- worthwhile to have a global wrapper function somewhere in your
-- configuration (in Neovim 0.7.0+, this function is built-in,
-- see :help vim.pretty_print()):
--
function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

-- Smart tab. From https://github.com/nanotee/nvim-lua-guide
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-N>' or '<Tab>'
end, {expr = true})

local status_ok, utils = pcall(require, 'utils')
if not status_ok then
  print('localinit: Could not load utils plugin. Will return.')
  return
end

local status_ok_settings, settings = pcall(require, 'settings')
if not status_ok_settings then
  print('localinit: Could not load settings plugin. Will return.')
  return
end

local status_ok_which_key, wk = pcall(require, 'ww-which-key-config')
if not status_ok_which_key then
  print('localinit: Could not load which key config')
  return
end

vim.cmd([[source ~/.config/nvim/vim/ww-word-highlight.vim]])
vim.cmd([[source ~/.config/nvim/vim/abbreviations.vim]])

local status_ok_project_config, pc = pcall(require, 'ww-project-config')
if not status_ok_project_config then
  print('localinit: Could not load project config')
  return
end

local status_ok_markdown_convert, asyncmdconv = pcall(require, 'ww-async-markdown')
if not status_ok_markdown_convert then
  print('localinit: Could not load async-markdown plugin')
end

local status_ok_grep, asyncgrep = pcall(require, 'ww-async-grep')
if not status_ok_grep then
  print('localinit: Could not load async-markdown plugin')
end

local all_ok = pc and wk and utils and settings and asyncmdconv and asyncgrep
if all_ok and false then
  print('Loaded all the plugins that was requested')
end

-- Assign the Grep command so that it can be called with :Grep searchTerm
vim.api.nvim_command('command! -nargs=+ -complete=dir -bar Grep lua require("ww-async-grep").asyncGrep(<q-args>)')
-- Grep word under the cursor
vim.cmd([[ command! -nargs=* -complete=dir -bar WordGrep lua require("ww-async-grep").grepWordUnderCursor(<q-args>) ]])
-- Start build command
vim.cmd([[ command! -nargs=* -complete=dir -bar AsyncBuild lua require("ww-async-grep").asyncBuild(<q-args>) ]])

vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#ff5f5f', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiffText', { fg = '#ff5f5f', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#ff5f5f', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeogitDiffDelete', { fg = '#ff5f5f', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteRegion', { fg = '#ff5f5f', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteHighlight', { fg = '#ff5f5f', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteCursor', { fg = '#fff5f5', bg = 'NONE' })

vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#000000", fg = "#ffffff" })

local navic = require("nvim-navic")

navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}

local components = {
  active = { {}, {}, {} },
}

table.insert(components.active[1], {
  provider = function()
    return navic.get_location()
  end,
  enabled = function() return navic.is_available() end,
})

require('feline').setup()
require('feline').winbar.setup({ components = components })
require('alpha').setup(require 'alpha.themes.startify'.config)

-- Set up nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end
  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    },
    {
      {
        name = 'buffer',
        option = {
          get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
        }
      },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- A popup will show possible entries to search for.
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- A popup will show the available paths and files.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
