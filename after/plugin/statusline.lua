vim.opt.termguicolors = true

local ok, lualine = pcall(require, 'lualine')
if ok then
	lualine.setup()
end
