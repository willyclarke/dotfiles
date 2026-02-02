local function make_async()
  -- Use buffer-local makeprg/errorformat (perfect with your .nvim.lua setup)
  local cmd = vim.bo.makeprg
  local efm = vim.bo.errorformat
  local cwd = vim.fn.getcwd()

  if not cmd or cmd == "" then
    vim.notify("makeprg is empty", vim.log.levels.ERROR)
    return
  end

  vim.notify("Build started: " .. cmd)

  -- Run through the user's shell so makeprg can contain pipes, &&, etc.
  local shell = vim.o.shell
  local shellcmdflag = vim.o.shellcmdflag

  vim.system({ shell, shellcmdflag, cmd }, { cwd = cwd, text = true }, function(res)
    vim.schedule(function()
      local out = (res.stdout or "") .. "\n" .. (res.stderr or "")
      local lines = vim.split(out, "\n", { plain = true, trimempty = true })

      vim.fn.setqflist({}, " ", {
        title = "make (async)",
        lines = lines,
        efm = efm ~= "" and efm or nil,
      })

      if res.code == 0 then
        vim.notify("Build OK", vim.log.levels.INFO)
        pcall(vim.cmd.cclose)
      else
        vim.notify(("Build failed (exit %d)"):format(res.code), vim.log.levels.ERROR)
        vim.cmd.copen()
      end
    end)
  end)
end

vim.api.nvim_create_user_command("MakeAsync", make_async, {})
vim.keymap.set("n", "<leader>mm", "<cmd>MakeAsync<CR>", { desc = "Build (async)" })

