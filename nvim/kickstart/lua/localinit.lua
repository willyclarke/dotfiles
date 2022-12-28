local status_ok, utils = pcall(require, 'utils')
if not status_ok then
  print('localinit: Could not load utils plugin. Will return.')
  return
end

local status_ok_which_key, wk = pcall(require, 'ww-which-key-config')
if not status_ok_which_key then
  print('localinit: Could not load which key config')
  return
end

-- vim.cmd([[source ~/.config/nvim/vim/ww-word-highlight.vim]])

local status_ok_project_config, pc = pcall(require, 'ww-project-config')
if not status_ok_project_config then
  print('localinit: Could not load project config')
  return
end

local all_ok = pc and wk and utils
if all_ok and false then
  print('Loaded all the plugins that was requested')
end

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

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
