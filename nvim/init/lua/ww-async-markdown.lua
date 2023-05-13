-- Based on the article 'Using LibUV in Neovim'
-- https://teukka.tech/vimloop.html
--
--
local M = {}

local loop = vim.loop
local api = vim.api

function M.convertFile()
	local shortname = vim.fn.expand('%:t:r')
	local fullname = api.nvim_buf_get_name(0)
	-- loop logic goes here
	handle, pid = vim.loop.spawn('pandoc', {
			args = { fullname, '--to=html5', '-o', string.format('%s.html', shortname), '-s', '--highlight-style', 'tango',
				'-c', '--css=pandoc.css' }
		},
		function()
			print('DOCUMENT CONVERSION COMPLETED')
			handle:close()
		end
	)
end

return M
