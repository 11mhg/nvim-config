-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Define plugins
local plugins = {
	-- Git Related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- Detect tabstop and shiftwidth automatically
	-- 'tpope/vim-sleuth',
	
	--'folke/tokyonight.nvim',
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ 'nvim-lualine/lualine.nvim' },

	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

	-- lsp stuff!
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = 'v3.x',
		lazy = true,
		config = false,
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
			'folke/neodev.nvim',
		},
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{'L3MON4D3/LuaSnip'}
		},
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {},
	},
	
	-- neogen
	{
		'danymat/neogen',
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},

	-- debugger protocol stuff
	{ 'mfussenegger/nvim-dap' },
	{ 'leoluz/nvim-dap-go' },
	{ 'rcarriga/nvim-dap-ui' },
	{ 'theHamsta/nvim-dap-virtual-text' },
	{ 'nvim-telescope/telescope-dap.nvim' },
	{ 'jay-babu/mason-nvim-dap.nvim' },
	{ 'mxsdev/nvim-dap-vscode-js' },

	-- codeium
	{ 'Exafunction/codeium.vim' },

	-- which key!
	{ 
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	}
}

local opts = {
	root = vim.fn.stdpath("data") .. "/lazy",
	install = {colorscheme = { "catppuccin" }}
}

-- Install plugins
require("lazy").setup(plugins, opts)
