-- Better Keymaps
local M = {}
local cmd = vim.cmd

-- :help map-modes
function M.map(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end
function M.noremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function M.exprnoremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = true })
end

-- stylua: ignore start
function M.nmap(lhs, rhs) M.map('n', lhs, rhs) end

function M.nnoremap(lhs, rhs) M.noremap('n', lhs, rhs) end

function M.vnoremap(lhs, rhs) M.noremap('v', lhs, rhs) end

function M.xnoremap(lhs, rhs) M.noremap('x', lhs, rhs) end

function M.inoremap(lhs, rhs) M.noremap('i', lhs, rhs) end

function M.tnoremap(lhs, rhs) M.noremap('t', lhs, rhs) end

function M.exprinoremap(lhs, rhs) M.exprnoremap('i', lhs, rhs) end

function M.exprnnoremap(lhs, rhs) M.exprnoremap('n', lhs, rhs) end

-- Lua table of autocmds as an argument, and creates an augroup
function M.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

function M.remove_trailing_space(str)
  str = string.gsub(str, '[ \t]+%f[\r\n%z]', '')
end

-- https://bit.ly/3g6vYIW
-- https://neovim.discourse.group/t/fixing-a-function-that-receives-commands-as-arguments/993/4
-- https://dev.to/voyeg3r/writing-useful-lua-functions-to-my-neovim-14ki
function _G.preserve(cmd)
    cmd = string.format('keepjumps keeppatterns execute %q', cmd)
    local original_cursor = vim.fn.winsaveview()
    vim.api.nvim_command(cmd)
    vim.fn.winrestview(original_cursor)
end

function addZeroForLessThan10(number)
  if(number < 10) then
    return 0 .. number
  else
    return number
 end
end

function generateDateTime()
 local dateTimeTable = os.date('*t')
 local dateTime = dateTimeTable.year .. addZeroForLessThan10(dateTimeTable.month) ..
 addZeroForLessThan10(dateTimeTable.day) .. addZeroForLessThan10(dateTimeTable.hour) .. addZeroForLessThan10(dateTimeTable.min) .. addZeroForLessThan10(dateTimeTable.sec)
 return dateTime
end

--[[ " Use git to backup everything that I edit {{{
 https://www.reddit.com/r/vim/comments/8w3udw/topnotch_vim_file_backup_history_with_no_plugins/
 That's it! All your files (even those that are not in any version control) are now
 reliably backed up to ~/.vim_custom_backups whenever you save. I have been using this
 for years and it has worked wonders.

 NOTE: This has been converted to lua from vim code by me : Willy Clarke.
]]
function _G.backupcurrentfile()
  local custom_backup_dir = '~/.vim_custom_Xackups'
  local gitcmd = ''

  if (vim.fn.isdirectory(vim.fn.expand(custom_backup_dir)) == 1) then
    print('custom_backup_dir is a dirXctory')
  else
    gitcmd = 'mkdir -p ' .. custom_backup_dir .. ';'
    gitcmd = gitcmd .. 'cd ' .. custom_backup_dir .. ';'
    gitcmd = gitcmd .. 'git init'
    vim.fn.system(gitcmd)
  end
  local file = vim.fn.expand('%:p')
  local test = vim.fn.fnamemodify(custom_backup_dir, ':t')

  -- Check regex to figure out if the filename is invalid.
  if (file == test) then
    print('--backupcurrentfile: Will not save to invalid file name ' .. custom_backup_dir)
    return
  end

  --[[ print('The file name is ' .. file)
  print('The test is ' .. test)
 ]]
  local file_dir = custom_backup_dir .. vim.fn.expand('%:p:h')
  -- print('The file_dir is ' .. file_dir)
  local backup_file = custom_backup_dir .. file

  -- Clean up the git command to start over ...
  gitcmd = ''

  if (vim.fn.isdirectory(vim.fn.expand(file_dir))) then
    gitcmd = 'mkdir -p ' .. file_dir .. ';'
    -- print('Need to create directory ' .. file_dir)
  end
  gitcmd = gitcmd .. 'cp ' .. file .. ' ' .. backup_file .. ';'
  gitcmd = gitcmd .. 'cd ' .. custom_backup_dir .. ';'
  gitcmd = gitcmd .. 'git add ' .. backup_file .. ';'
  gitcmd = gitcmd .. 'git commit -m \"Backup - ' .. generateDateTime() .. ' :: ' .. file .. '\";'
  -- print(gitcmd)
  vim.fn.jobstart(gitcmd)

end


-- so we add the module to the _G global variable.
_G.utils = M

return M
-- stylua: ignore end
