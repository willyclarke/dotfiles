require'lualine'.setup()

local gps = require("nvim-gps")

require("lualine").setup({
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    }
  }
})
