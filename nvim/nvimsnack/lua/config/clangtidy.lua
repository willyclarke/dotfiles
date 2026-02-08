vim.api.nvim_create_user_command("ClangTidy", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No file", vim.log.levels.WARN)
    return
  end

  -- Find project root (same logic clangd uses)
  local root = vim.fs.dirname(
    vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]
  )

  if not root then
    vim.notify("Could not find project root", vim.log.levels.ERROR)
    return
  end

  local config_file = root .. "/.clang-tidy"
  if vim.fn.filereadable(config_file) == 0 then
    vim.notify("No .clang-tidy found", vim.log.levels.ERROR)
    return
  end

  local cc = root .. "/compile_commands.json"
  if vim.fn.filereadable(cc) == 0 then
    vim.notify("No compile_commands.json found", vim.log.levels.ERROR)
    return
  end

  -- Resolve symlink → real compile_commands.json
  local real_cc = vim.fn.resolve(cc)
  local build_dir = vim.fn.fnamemodify(real_cc, ":h")

  local cmd = { "clang-tidy", "--config-file=" .. config_file, "-p", build_dir, file, }

  vim.notify("clang-tidy (" .. build_dir .. ")", vim.log.levels.INFO)

  vim.fn.setqflist({}, "r")

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data then vim.fn.setqflist({}, "a", { lines = data }) end
    end,
    on_stderr = function(_, data)
      if data then vim.fn.setqflist({}, "a", { lines = data }) end
    end,
    on_exit = function(_, code)
      if code ~= 0 then
        vim.cmd("copen")
        vim.notify("clang-tidy finished with issues", vim.log.levels.WARN)
      else
        vim.notify("clang-tidy finished cleanly", vim.log.levels.INFO)
      end
    end,
  })
end, {
  desc = "Run clang-tidy on current file (auto-detect build dir)",
})

vim.keymap.set("n", "<leader>ly", "<cmd>ClangTidy<CR>", {
  desc = "clang-tidy (current file)",
})
