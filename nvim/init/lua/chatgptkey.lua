local M = {}

function M.get_openai_api_key(notify)
  local home = vim.fn.expand("$HOME")
  local path_to_key = home .. "/.local/bin/keychatgpt.asc.gpg"
  -- vim.notify(path_to_key, vim.log.levels.TRACE)

  -- Check if the file exists
  if not vim.loop.fs_stat(path_to_key) then
    if notify then
      vim.notify("GPG file not found: " .. path_to_key, vim.log.levels.ERROR)
    end
    return nil
  end

  local handle = io.popen("gpg --quiet --decrypt " .. path_to_key .. " 2>&1")

  if not handle then
    vim.notify("Failed to read API key with GPG.", vim.log.levels.ERROR)
    return nil
  end
  local api_key = handle:read("*a")
  local success, exit_code, signal = handle:close()

  if signal then
    vim.notify("Got signal " .. signal .. " when reading ChatGPT API key.", vim.log.levels.TRACE)
  end

  if not success or (exit_code ~= nil and exit_code ~= 0) then
    vim.notify("Failed to read ChatGPT API key: " .. api_key .. " success:" .. success .. " exit_code:" .. exit_code,
      vim.log.levels.ERROR)
    return nil
  end

  local api_key_trimmed = vim.trim(api_key)

  if notify then
    vim.notify(api_key_trimmed, vim.log.levels.TRACE)
  end

  return api_key_trimmed
end

-- local api_key = get_openai_api_key()
-- if api_key then
--   vim.g.openai_api_key = api_key
-- else
--   vim.notify("OpenAI API key not available.", vim.log.levels.ERROR)
-- end

-- Create the user command with an optional notify parameter
vim.api.nvim_create_user_command("GetOpenAiApiKey", function(opts)
  local notify = opts.args == "notify"
  M.get_openai_api_key(notify)
end, {
  nargs = "?",                                  -- Optional argument
  complete = function() return { "notify" } end -- Auto-completion for argument
})

return M
