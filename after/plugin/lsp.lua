local lsp_ok, lsp = pcall(require, 'lspconfig')
if lsp_ok then

	local on_attach = function(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end
			})
		end
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	vim.fn.sign_define('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '', numhl = '' })
	vim.fn.sign_define('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '', numhl = '' })
	vim.fn.sign_define('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '', numhl = '' })
	vim.fn.sign_define('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '', numhl = '' })

	vim.diagnostic.config {
		virtual_text = true,
		signs = { active = signs },
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = 'minimal',
			source = 'always',
			header = '',
			prefix = '',
			border = 'rounded'
		},
	}

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

	-- servers
	local servers = { 'clangd', 'tsserver','rust_analyzer', 'pyright' }
	for _, s in ipairs(servers) do
		lsp[s].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		}	
	end

	lsp['gopls'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			gopls = {
				gofumpt = true,
			},
		}
	}
end
