-- ftplugin/php.lua
-- filetype plugin for php files.
local root_files = {'composer.json'}
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})

print(vim.fs.dirname(paths[1]))

if root_dir then
  vim.lsp.start({
    cmd = {'intelephense', '--stdio'},
    root_dir = root_dir,
  })
end
