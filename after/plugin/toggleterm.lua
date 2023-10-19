local ok, term = pcall(require, 'toggleterm')

if not ok then
	return
end

term.setup({
		insert_mappings = true,
    highlights = {
      Normal = {
        guibg = '#1f1f1f',
      },
      Insert = {
        guibg = '#1f1f1f',
      },
      NormalFloat = {
        guibg = '#1f1f1f',
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    },
})

