print('loaded color.lua')
function ColorMyPensils(color)
	color = color or "rose-pine"
	vim.cmd({ cmd = 'colorscheme', args = { color } })

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPensils()
