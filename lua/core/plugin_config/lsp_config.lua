local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  "lua_ls",
  "eslint",
  "tsserver",
  "pyright",
  "yamlls",
  "rust_analyzer",
  "sqlls",
  "gopls"
})


lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
    desc = "Go to the symbol definition",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
    desc = "Show information about the symbol we're hovering over.",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, {
    desc = "List all workspace symbols",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, {
    desc = "Show diagnostics in a floating window.",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {
    desc = "Rename variable/function",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {
    desc = "List all code actions",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {
    desc = "Lists all the implementations for the symbol under the cursor",
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, {
    desc = "Get signature help",
    buffer = bufnr,
    remap = false
  })
end


lsp.on_attach(function(client, bufnr)
  on_attach(client, bufnr)
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['eslint'] = { 'javascript', 'typescript' }
  }
})



lsp.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").eslint.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr);
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    });
  end,
  capabilities = capabilities,
}

vim.diagnostic.config({
  virtual_text = true
})
