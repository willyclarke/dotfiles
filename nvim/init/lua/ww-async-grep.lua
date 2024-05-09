-- Based on the article 'Using LibUV in Neovim'
-- https://teukka.tech/vimloop.html
--
--

--
-- callback function for the looping
--
local results = {}
local function onread(err, data)
	if err then
		print('ERROR: ', err)
		-- TODO handle err
	end
	if data then
		local vals = vim.split(data, "\n")
		for _, d in pairs(vals) do
			if d == "" then goto continue end
			table.insert(results, d)
			::continue::
		end
	end
end


local loop = vim.loop
local api = vim.api

local function asyncCmakeBuild(term)
	local stdin = loop.new_pipe(false) -- create the file descriptor for stdin
	local stdout = loop.new_pipe(false) -- create the file descriptor for stdout
	local stderr = loop.new_pipe(false) -- create the file descriptor for stderr

	if (stdin == nil) then
		return
	end

	if (stderr == nil) then
		return
	end

	if (stdout == nil) then
		return
	end

	local param = ''
	if (term ~= nil) then
		param = term
	end
	print(param, ' is the param I got.')

	local function setQF()
		vim.fn.setqflist({}, 'r', { title = 'CMake build status', lines = results })
		api.nvim_command('cwindow')
		local count = #results
		for i = 0, count do results[i] = nil end -- clear the table for next search
	end

	handle = loop.spawn(
		'cmake', {
			-- spawn ripgrep
			args = { '--build', 'build', param },
			stdio = { stdin, stdout, stderr }
		},
		vim.schedule_wrap(function()
			stdin:read_stop()
			stdout:read_stop()
			stderr:read_stop()
			stdin:close()
			stdout:close()
			stderr:close()
			handle:close()
			setQF()
		end
		)
	)
	loop.read_start(stdout, onread)
	loop.read_start(stderr, onread)
end

local function asyncGrep(term)
	local stdout = loop.new_pipe(false) -- create the file descriptor for stdout
	local stderr = loop.new_pipe(false) -- create the file descriptor for stderr

	if (stderr == nil) then
		return
	end

	if (stdout == nil) then
		return
	end

	print(term, ' test')

	local function setQF()
		vim.fn.setqflist({}, 'r', { title = 'Search Results', lines = results })
		api.nvim_command('cwindow')
		local count = #results
		for i = 0, count do results[i] = nil end -- clear the table for next search
	end

	handle = loop.spawn(
		'rg', {
			-- spawn ripgrep
			args = { term, '--vimgrep', '--smart-case', '--block-buffered' },
			stdio = { nil, stdout, stderr }
		},
		vim.schedule_wrap(function()
			stdout:read_stop()
			stderr:read_stop()
			stdout:close()
			stderr:close()
			handle:close()
			setQF()
		end
		)
	)
	loop.read_start(stdout, onread)
	loop.read_start(stderr, onread)
end

local function getWordUnderCursor()
	return vim.fn.expand("<cword>")
end

local M = {}

function M.grepWordUnderCursor()
	local word = getWordUnderCursor()
	asyncGrep(word)
end

function M.asyncBuild()
	asyncCmakeBuild('-j')
end

function M.asyncGrep(word)
	asyncGrep(word)
end

return M
