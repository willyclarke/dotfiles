vim.g.colors_name = "ww-neovim"

require("config.colorscheme").setup {
  base00 = "#111111", -- Default background
  base01 = "#222222", -- Lighter background, tabs
  base02 = "#555555", -- Selection background
  base03 = "#afafaf", -- Comments
  base04 = "#0b8502", -- Line numbers
  base05 = "#f0bc40", -- Member vars in classes/structs, documentation
  base06 = "#ffffff", -- Unknown
  base07 = "#b1f7b5", -- Unknown
  base08 = "#aba56f", -- Variables, namespace
  base09 = "#c26112", -- Unknown
  base0A = "#c0a000", -- classes/structs inside namespace
  base0B = "#c1ae29", -- Strings
  base0C = "#f4ac86", -- NOTE,
  base0D = "#298ad8", -- Function names
  base0E = "#7b5bf1", -- Keywords
  base0F = "#c93cc1", -- Delimiters, ',' and ':'
}
