local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		packer_path
	}

	print 'Installing packer...\nclose and reopen neovim after the installation has finished.'

	vim.cmd [[packadd packer.nvim]]
end

local packer_ok, packer = pcall(require, 'packer')
if packer_ok then
	packer.startup(function(use)

		-- update packer itself because packer is a plugin btw.
		use { 'wbthomason/packer.nvim' }

		use { 'catppuccin/nvim', as = 'catppuccin' }

		use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
    }

		-- autopairs
		use { 'windwp/nvim-autopairs', commit = '5fe24419e7a7ec536d78d60be1515b018ab41b15' }

		-- api to work with treesitter
		use { 'neovim/nvim-lspconfig' }

		-- autocomplete
		use 'hrsh7th/nvim-cmp'
  	use 'hrsh7th/cmp-nvim-lsp'
  	use 'hrsh7th/cmp-buffer'
  	use 'hrsh7th/cmp-path'
  	use 'L3MON4D3/LuaSnip'
  	use 'saadparwaiz1/cmp_luasnip'
  	use 'neovim/nvim-lspconfig'

  	-- status line
		use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		}
		
		-- vim be good
		use 'ThePrimeagen/vim-be-good'

		use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  	requires = { {'nvim-lua/plenary.nvim'} }
		}

		use {"akinsho/toggleterm.nvim", tag='*' }

		use {
    "williamboman/mason.nvim"
		}

		if PACKER_BOOTSTRAP then
			packer.sync()
		end

	end)
end
