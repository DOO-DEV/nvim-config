local map = vim.keymap.set
local o = { silent = true, noremap = true }

map('', '<Space>', '<Nop>', o) -- unbind space
vim.g.mapleader = ' ' -- map leader key to space


-- lsp keymaps
map('n', '<leader><leader>', '<cmd>lua vim.lsp.buf.hover()<CR>', o)
map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', o)
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', o)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', o)
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', o)
map('n', 'gL', function()
	vim.diagnostic.goto_next()
	vim.diagnostic.open_float()
end, o)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', o)
map('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', o)
map('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', o)
map('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', o)
