local map = vim.keymap.set
local o = { silent = true, noremap = true }

map('', '<Space>', '<Nop>', o) -- unbind space
vim.g.mapleader = ' ' -- map leader key to space


map('n', 'U', '<C-R>', o)
map('n', '<C-s>', '<cmd>w<CR>', o)
map('n', 'x', '"_x', o) -- delete without yanking
map('n', 'yw', 'yiw', o) -- yank a word from anywhere
map('n', 'dw', '"_diw', o) -- delete a word from anywhere without yanking
map('n', 'cw', '"_ciw', o) -- change a word from anywhere without yanking
map('n', 'cc', '"_cc', o) -- change line without yanking
map('v', 'c', '"_c', o) -- change selection without yanking
map('v', 'p', '"_dP', o) -- override selected word without yanking it
map('x', 'p', '"_dP', o)
map('n', 'ss', '<cmd>split<CR>', o)
map('n', 'sv', '<cmd>vsplit<CR>', o)
map('n', '<leader>r', '<cmd>%s/', { noremap = true })

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

-- telescop
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})

-- toggleterm
map('n', '<leader>hto', '<cmd>ToggleTerm dir=$(pwd) direction=horizontal<CR>', o)
map('n', '<leader>fto', '<cmd>ToggleTerm dir=$(pwd) direction=float<CR>', o)
