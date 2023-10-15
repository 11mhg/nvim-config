local lsp_zero = require('lsp-zero').preset({})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
});

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'eslint',
    'lua_ls',
    'cssls',
    'pyright',
    'clangd',
    'cmake',
    'dockerls',
    'julials',
    'yamlls'
  },
  handlers = {
    lsp_zero.default_setup
  }
});

