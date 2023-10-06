local ts_ok, ts = pcall(require, 'nvim-treesitter.configs')
if ts_ok then
	ts.setup {
		ensure_installed = 'all',
		ignore_install = { '' },
		highlight = { enable = true },
		autopairs = { enable = true },
		indent = { enable = true }
	}

end

local autopairs_ok, autopairs = pcall(require, 'nvim-autopairs')
if autopairs_ok then
	autopairs.setup { check_ts = true, disable_filetypes = { 'TelescopePrompt', 'vim' } }
end
