
vim.api.nvim_create_user_command("LspCompletionTiming", function()
  require("debug.lsp").completion_timing()
end, {})

vim.keymap.set("n", "<leader>lt",
  function() require("debug.lsp").completion_timing() end,
  { desc = "LSP completion timing" }
)

local M = {}

function M.completion_timing()
  local params = vim.lsp.util.make_position_params(0, "utf-16")
  local t0 = vim.loop.hrtime()

  vim.lsp.buf_request(0, "textDocument/completion", params, function(err, result, ctx)
    local ms = (vim.loop.hrtime() - t0) / 1e6
    local n = 0
    if result then
      if result.items then n = #result.items else n = #result end
    end
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    print(string.format(
      "LSP completion: %.1f ms, items=%d, client=%s",
      ms, n, client and client.name or "?"
    ))
  end)
end

return M
