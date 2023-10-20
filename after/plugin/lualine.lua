local ok, line = pcall(require, 'lualine')
if not ok then
	return
end

line.setup({
	options = {
		icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
--	sections = {
--    lualine_x = {
--      {
--        require("noice").api.statusline.mode.get,
--        cond = require("noice").api.statusline.mode.has,
--        color = { fg = "#ff9e64" },
--      }
--    },
--    lualine_a = {
--      {
--        'buffers',
--      }
--    }
--  }
   sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'buffers'},
    lualine_x = {'tabs'},
    lualine_y = {'progress'},
    lualine_z = {
      { 'diagnostics',
        sources = {'nvim_diagnostic', 'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        },
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false,   -- Show diagnostics even if there are none.
      }
    }
  }
  })
