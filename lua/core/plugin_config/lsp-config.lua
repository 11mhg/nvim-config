local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['eslint'] = {'javascript', 'typescript'},
		['rust_analyzer'] = {'rust'},
	},
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'rust_analyzer',
		'eslint',
		'lua_ls',
		'dockerls',
		'yamlls'
	},
	handles = {
		lsp_zero.default_setup,
	},
})
