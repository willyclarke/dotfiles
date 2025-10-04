-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "g++ -std=c++20 %",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local executable = file .. '.exe'
    return {
      cmd = { "g++" },
      args = { "-std=c++20", file, "-o", executable },
      components = { { "on_output_quickfix", open = true }, "default" },
      strategy = {},
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
