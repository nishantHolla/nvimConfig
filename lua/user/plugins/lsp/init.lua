local lspconfig = require('lspconfig')
local mason = require('mason')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
mason.setup()

-- diagnostic config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- message popup
vim.o.updatetime = 250
vim.api.nvim_create_autocmd('CursorHold', {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- line number hilight
for _, diag in ipairs({ 'Error', 'Warn', 'Info', 'Hint' }) do
  vim.fn.sign_define('DiagnosticSign' .. diag, {
    text = '',
    texthl = 'DiagnosticSign' .. diag,
    linehl = '',
    numhl = 'DiagnosticSign' .. diag,
  })
end

-- servers
lspconfig['lua_ls'].setup({
  capabilities = capabilities,
})

lspconfig['pyright'].setup({
  capabilities = capabilities,
})

lspconfig['tsserver'].setup({
  capabilities = capabilities,
})

lspconfig['html'].setup({
  capabilities = capabilities,
})

lspconfig['cssls'].setup({
  capabilities = capabilities,
})

lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
})

lspconfig['clangd'].setup({
  capabilities = capabilities,
})

-- formatter
require('user.plugins.conform')
