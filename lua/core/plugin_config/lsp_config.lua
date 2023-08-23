require("mason").setup({
  PATH = "prepend",
 })
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "eslint",
    "vtsls",
    "pyright",
    "yamlls",
    "rust_analyzer",
    "sqlls",
    "gopls"
  }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename variable/function" })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "List all code actions" })

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to the symbol definition" })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Lists all the implementations for the symbol under the cursor" })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show information about the symbol we're hovering over." })
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

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

require("lspconfig").vtsls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
